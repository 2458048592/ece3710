#!/usr/bin/env ruby
require 'rubygems'
require 'rubygame'

include Rubygame

resolution = [640, 480]




@screen = Screen.open resolution, 0, [HWSURFACE, DOUBLEBUF]
@screen.title = "Duck Hunt"

unless @screen.respond_to? :draw_box
  puts "Don't have SDL_gfx available, can't use draw_box"
  puts "Exiting..."
  exit 1
end

class Duck
  include Sprites::Sprite

  def initialize color
    super()

    @color = color
    @image = Surface.new [60,60]
    @rect = @image.make_rect
    @image.fill @color  
    @velocity = [0, 0] #gravity
    @position = [320,240]
    @rect.move! @position[0], @position[1]
  end

  def vel_add vel
    @velocity[0] += vel[0]
    @velocity[1] += vel[1]
  end

  def color_original
    @image.fill @color
  end

  def color_white
    @image.fill [ 0xff, 0xff, 0xff]
  end

  def update seconds_passed, walls
    old_velocity = @velocity
    x, y = @velocity
    factor = 500 * seconds_passed
    x *= factor
    y *= factor
    @rect.move! x,y

    # undo x and y separately so you can move without jumping
    @rect.move! 0, -1.0 * y if collides? walls # undo gravity
    @rect.move! -1.0 * x, 0 if collides? walls # undo sideways movement
  end

  def move pos
    @position = pos
    @rect.move! pos[0], pos[1]
  end

  def draw on_surface
    @rect.clamp! on_surface.make_rect
    @image.blit on_surface, @rect
  end

  def collides? group
    collide_group(group) != []
  end
end

class Wall
  include Sprites::Sprite
  def initialize pos
    super()

    @image = Surface.new [80,10]
    @image.draw_box_s [0,0], [80,10], color
    @rect = @image.make_rect
    @rect.topleft = pos
  end

  def draw on_surface
    @image.blit on_surface, @rect
  end
end

@black = Surface.new resolution
@black.blit @screen,[0,0]
@background = Surface.new resolution
@background.blit @screen,[0,0]

@clock = Clock.new
@clock.target_framerate = 120
@clock.enable_tick_events

@ducks=Sprites::Group.new
@walls=Sprites::Group.new
Sprites::UpdateGroup.extend_object @ducks
Sprites::UpdateGroup.extend_object @walls

@duck1 = Duck.new [ 0xc0, 0xc0, 0xa0]
@duck2 = Duck.new [ 0xc0, 0x80, 0x40]
@ducks << @duck1
@ducks << @duck2

#@walls << Wall.new([400,400])
#@walls << Wall.new([300,300])
#@walls << Wall.new([200,200])
#@walls << Wall.new([100,100])
@walls.draw @screen

@event_queue = EventQueue.new
@event_queue.enable_new_style_events #enables rubygame 3.0

should_run = true
@colliding = false

while should_run
  seconds_passed = @clock.tick().seconds
  first = rand(640)
  second = rand(480)

  @event_queue.each do |event|
    case event
      when Events::QuitRequested
        should_run = false
      when Events::KeyPressed 
        case event.key
          when :left
            @duck1.vel_add [1,0]
            @duck2.vel_add [0,1]
          when :right
            @duck1.vel_add [-1,0]
            @duck2.vel_add [0,-1]
          when :d
            @duck1.color_original
            @duck2.color_original
            @ducks.undraw @screen, @background
            @ducks.update seconds_passed, @walls
            @ducks.draw @screen
          when :c
            @ducks.undraw @screen, @background
          when :w
            @duck1.color_white
            @duck2.color_white
            @ducks.undraw @screen, @background
            @ducks.update seconds_passed, @walls
            @ducks.draw @screen
        end
     end
  end


  @screen.flip
end

