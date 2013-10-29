#!/usr/bin/env ruby
require 'rubygems'
require 'rubygame'
require 'observer'
require_relative 'duck'
require_relative 'serialPort'

YELLOW = [ 0xee, 0xee, 0x33]
RED = [ 0xff, 0x00, 0x00]
BLUE = [ 0x00, 0x00, 0xff]
GREEN = [ 0x00, 0xff, 0x00]
PURPLE = [ 0xff, 0x00, 0xff]

class Game
  include Rubygame

  def initialize
    @demo = false

    @serialEnable = true

    @player1Score = 0
    @player2Score = 0

    if @demo  
      @duckCount = 5
      @frameDelay = 30 
    else
      @duckCount = 5
      @frameDelay = 2
    end

    TTF.setup
    @point_size = 40
    $font = TTF.new "Verdana.ttf", @point_size
    

    @resolution = [1024, 768]
    #@resolution = [800, 600]
    @screen = Screen.open @resolution, 0, [HWSURFACE, DOUBLEBUF]
    #@backgroundImage = "bg800x600.jpg"
    if @demo
      @backgroundImage = "bg1024x768.jpg"
      @background = Surface.load @backgroundImage
    else
      @background = Surface.new @resolution
    end

    @black = Surface.new @resolution
    @black.blit @screen,[0,0]
    @background.blit @screen,[0,0]
    @screen.title = "Duck Hunt"

    unless @screen.respond_to? :draw_box
      puts "Don't have SDL_gfx available, can't use draw_box"
      puts "Exiting..."
      exit 1
    end

    @drawOffset = -1
    @killDuck = false

    if (@serialEnable)
      @watcher = SerialObservable.new
      @watcher.start_observing
      @watcher.add_observer(self)
    end

    @clock = Clock.new
    @clock.target_framerate = 60
    @clock.enable_tick_events

    @eventQueue = EventQueue.new
    @eventQueue.enable_new_style_events #enables rubygame 3.0

    @ducks=Sprites::Group.new
    @walls=Sprites::Group.new
    Sprites::UpdateGroup.extend_object @ducks

    # different color to help debug
    duck1 = Duck.new @screen, YELLOW
    @ducks << duck1
    duck2 = Duck.new @screen, RED
    @ducks << duck2
    duck3 = Duck.new @screen, GREEN
    @ducks << duck3
    duck4 = Duck.new @screen, BLUE
    @ducks << duck4
    duck5 = Duck.new @screen, PURPLE
    @ducks << duck5
    #for i in 1..@duckCount
      #duck1 = Duck.new @screen [ 200,  i*100 , 110]
      #@ducks << duck1
    #end
  end

  def update(newData)
    puts "#{newData}"

    if newData =~ /^\bPlayer\b\s+\btrigger\b\s+(\d+)$/
      @hitCount = 1 
      @whoPulledTrigger = $1
    end

    if newData =~ /^\bPlayer1\b\s+\bsens\b\s+(\d+)$/
      @player1Hit = $1 
    end
    if newData =~ /^\bPlayer2\b\s+\bsens\b\s+(\d+)$/
      @player2Hit = $1 
    end
  end

  # handles the drawing when the trigger is pulled
  def hit hits
    # blackout the screen
    @watcher.observe_sensors if @serialEnable
    if hits >= 1 and hits < @frameDelay 
      @black.blit @screen,[0,0]
      hits += 1
      @ducks.map &:color_trans
    end
    # Draw each duck as a white square
    if hits >= @frameDelay and hits < @frameDelay*(@ducks.count) + @frameDelay 
      puts "******** drawOffset: #{@drawOffset} ****************"
      if hits % @frameDelay == 0
        @drawOffset += 1 
        # displays each duck for the alloted frameDelay
        @ducks.each_with_index do |duck, index| 
          if (index == @drawOffset ) 
            puts "drawOffset: #{@drawOffset}, index that is white: #{index}"
            duck.color_white()
          else
            duck.color_black()
            duck.draw @screen
            duck.color_trans()
          end
        end
      end

      puts "P1 #{@whoPulledTrigger}, #{@player1Hit}"
      puts "P2 #{@whoPulledTrigger}, #{@player2Hit}"
      
      # who killed the duck
      if @whoPulledTrigger == "1" and @player1Hit == "1"
        @player1Score += 1 
        @whoPulledTrigger = "0"
        @killDuck = true
      end
      if @whoPulledTrigger == "2" and @player2Hit == "1"
        @player2Score += 1 
        @whoPulledTrigger = "0"
        @killDuck = true
      end

      @player1Hit = "3" 
      @player2Hit = "3"

      if @killDuck == true
        #@ducks[@drawOffset].alive = false
        @ducks.delete_at @drawOffset
        @killDuck = false
      end

      hits += 1
    # Go back to normal
    elsif hits >= @frameDelay*(@ducks.count) + @frameDelay 
      @drawOffset = -1
      @whoPulledTrigger = 0
      @ducks.map &:duck
      @background.blit @screen, [0,0]
      hits = 0
    end
    return hits
  end

  def update_score
    player1_score_text = $font.render_utf8 @player1Score.to_s, true, YELLOW
    player2_score_text = $font.render_utf8 @player2Score.to_s, true, YELLOW
    player1_score_text.blit @screen, [0,0]
    player2_score_text.blit @screen, [320,0]
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

  def start
    shouldRun = true
    count = 0
    sec = 1
    @hitCount = 0
    while shouldRun
      secondsPassed = @clock.tick().seconds
      @eventQueue.each do |event|
        case event
        when Events::QuitRequested
          shouldRun = false
        when Events::MousePressed
          puts "Pressed #{event.button} at #{event.pos}"
        when Events::KeyPressed 
          case event.key
          when :escape
            @screen.exit
            puts "exit"
          when :f
            Screen.close
            @resolution = Screen.get_resolution
            @screen = Screen.open @resolution, 0, [HWSURFACE, DOUBLEBUF, FULLSCREEN]
            if @demo
              @background = Surface.load @backgroundImage
            else
              @background = Surface.new @resolution
            end
            @background.blit @screen,[0,0]
          when :d
            @ducks.map &:duck
            duck1 = Duck.new @screen, [ 200,  100 , 110]
            @ducks << duck1
          when :b
            @ducks.map &:color_black
          when :o
            @ducks.map &:color_original
          when :u
            @ducks.map &:speed_up
          when :s
            @ducks.map &:speed_down
          when :c
            @ducks.undraw @screen, @background
          when :w
            @ducks.map &:color_white
          when :h
            @hitCount = 1
          end
        end
      end

      count += secondsPassed
      if count > sec 
        @ducks.map &:switch
      end
      if count > sec
        count = 0 
        num = rand(3) + 0.5
        num = 1 if num == 2.5
        sec = num
      end

      if @hitCount == 0
        @ducks.undraw @screen, @background
        @ducks.update secondsPassed, @walls
        @watcher.observe_trigger if @serialEnable
        update_score
      end

      @ducks.draw @screen

      # call the hit code
      @hitCount = self.hit @hitCount

      if @ducks.size == 0
        5.times do
          duck1 = Duck.new @screen, [ 200,  100 , 110]
          @ducks << duck1
        end
      end

      @screen.flip
    end
  end
end

game = Game.new
game.start
