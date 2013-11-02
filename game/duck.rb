#!/usr/bin/env ruby
require 'rubygems'
require 'rubygame'
include Rubygame

class Duck
  include Sprites::Sprite
  attr_accessor :alive

  def initialize on_surface, color
    super()

    @color = color
    @alive = true
    @image = Surface.load "picDuck.png"
    @rect = @image.make_rect
    @velocity = [0,0 ] #gravity
    @screen = on_surface
    @position = random_start_pos()
    @speed = 150
    @rect.move! @position[0], @position[0]
  end

  def vel vel
    @velocity[0] = vel[0]
    @velocity[1] = vel[1]
  end

  def random_start_pos
    duckSizeX = @image.w 
    duckSizeY = @image.h 
    pos = 0
    case rand(4)
    when 0
      pos = [-1*duckSizeX, -1 *duckSizeY] # top left
      puts "0"
    when 1
      pos = [@screen.w, -duckSizeY] # top right
      puts "1"
    when 2
      pos = [-duckSizeX, @screen.h] # bottom left
      puts "2"
    when 3
      pos = [@screen.w, @screen.h] # bottom right
      puts "3"
    else 
      pos = [-1*duckSizeX, -1 *duckSizeY] # top left
      puts "else"
    end
    return pos
  end



  def switch_vel 
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
  
  def duck
    @image = Surface.load "picDuck.png"
  end

  def color_white
    @image.fill [ 0xff, 0xff, 0xff]
  end

  def color_black
    @image.fill [ 0, 0, 0]
  end

  def color_trans
    @image.fill [ 0, 0, 0, 0]
  end

  def speed_up
    @speed = @speed + 50
  end

  def speed_down
    @speed = @speed - 50
  end

  def update seconds_passed, walls
    @x, @y = @velocity
    @factor = @speed * seconds_passed
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
    bordRect = on_surface.make_rect
    @border = Rect.new(-@rect.w,-@rect.h, bordRect.w + @rect.w * 2, bordRect.h + @rect.h * 2)
    @rect.clamp! @border
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
