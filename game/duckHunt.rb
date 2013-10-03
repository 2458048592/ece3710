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
    @velocity = [1, 1] #gravity
    @position = [0,0]
    @rect.move! @position[0], @position[1]
  end

  def vel vel
    @velocity[0] = vel[0]
    @velocity[1] = vel[1]
  end

  def switch 
    i = [1, 1]
    case rand(9)
    when 0
      i = [-1,-1]
    when 1
      i = [-1, 0]
    when 2
      i = [-1, 1]
    when 3
      i = [0, -1]
    when 4
      i = [1, 1]
    when 5
      i = [1, 0]
    when 6
      i = [1, -1]
    when 7
      i = [0, 1]
    else
      i = [1, 1]
    end
    @velocity = i
  end

  def color_original
    @image.fill @color
  end

  def color_white
    @image.fill [ 0xff, 0xff, 0xff]
  end

  def update seconds_passed, walls
    @x, @y = @velocity
    @factor = 250 * seconds_passed
    @x *= @factor
    @y *= @factor
    #puts "#{@x}, #{@y}" if @x == 0 or @y == 0
    @rect.move! @x,@y
    #puts "vel: #{x}, #{y}" 
    #puts "pos: #{@rect.x}, #{@rect.y}" 

    # undo x and y separately so you can move without jumping
    #@rect.move! 0, -1.0 * @y if collides? walls # undo gravity
    #@rect.move! -1.0 * @x, 0 if collides? walls # undo sideways movement
  end

  def draw on_surface
    @rect.clamp! Rect.new(-60,-60, 760,600)#on_surface.make_rect
    @image.blit on_surface, @rect
  end

  def collides? group
    collide_group(group) != []
  end
end

class Wall
  include Sprites::Sprite
  def initialize pos, color
    super()

    @image = Surface.new [80,10]
    @image.fill color
    @rect = @image.make_rect
    @rect.topleft = pos
  end

  def draw on_surface
    @image.blit on_surface, @rect
  end
end

# returns -1, 0 ,1
def randLevelOne
  a = rand(3)
  a = -1 if a == 2
  return a
end

# returns -1, 1
def randLevelTwo
  a = rand(2)
  a = -1 if a == 0
  return a
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

for i in 0..10
  duck1 = Duck.new [ 0xc0, i* 200, 0xa0]
  @ducks << duck1
end
#@duck1 = Duck.new [ 0xc0, 0xc0, 0xa0]
#@duck2 = Duck.new [ 0xc0, 0x80, 0x40]
#@duck3 = Duck.new [ 0xc0, 0x80, 0x40]
#@ducks << @duck1
#@ducks << @duck2
#@ducks << @duck3

@walls << Wall.new([400,400],[ 0xc0, 0xc0, 0xa0])
@walls << Wall.new([300,300],[ 0xc0, 0xc0, 0xa0])
@walls << Wall.new([200,200],[ 0xc0, 0xc0, 0xa0])
@walls << Wall.new([100,100],[ 0xc0, 0xc0, 0xa0])
#@walls.draw @screen

@event_queue = EventQueue.new
@event_queue.enable_new_style_events #enables rubygame 3.0

should_run = true
@count = 0
@sec = 1
while should_run
  seconds_passed = @clock.tick().seconds
  @event_queue.each do |event|
    case event
      when Events::QuitRequested
        should_run = false
      when Events::KeyPressed 
        case event.key
          when :d
            @ducks.map &:original_color
          when :c
            @ducks.undraw @screen, @background
          when :w
            @ducks.map &:color_white
        end
     end
  end
  @count += seconds_passed
  if @count > @sec 
    @ducks.map &:switch
  end
  if @count > @sec
    @count = 0 
    num = rand(2) + 0.5
    num = 1 if num == 2.5
    @sec = num
  end
  @ducks.undraw @screen, @background
  @ducks.update seconds_passed, @walls
  @ducks.draw @screen
  @screen.flip
end

