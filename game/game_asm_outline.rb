# positon_x = 0x11212211214
# positon_y = 0x11212211214
while shouldRun
  # top_of_game_loop:
  secondsPassed = @clock.tick().seconds

    @ducks.undraw @screen, @background # dont know how to undraw
    @ducks.update secondsPassed, @walls # dont know how to update draw
    #
    # //$1 = postion_x
    # //$2 = postion_y
    # update_duck: 
    #           load postion_x, $1
    #           load postion_y, $2
    #           add $1, 5
    #           add $2, 5
    #           j draw_the_duck
    @watcher.observe_trigger if @serialEnable
    # // $3 = gun_trigger_bool_IO
    # observe_trigger:  load gun_trigger, $3 // load I/O 
    #                   cmpi 0, $3
    #                   beq $3, pass_hit_code // not a trigger pull
    #                   movi 1, hit_variable
    #
    # pass_hit_code:
    #               cmpi 0, hit_variable
    #               beq update_score
    #               call hit_code
    # 
    #
  end
  @hitCount = self.hit @hitCount

  @ducks.draw @screen

  # call the hit code

  @screen.flip
end
  end
end
  def hit hits
    # hit_code:
    #               // begin loop again
    # blackout the screen
    @watcher.observe_sensors if @serialEnable
    # 
    # black_out: 
    #             cmpi hit_variable, frame_delay
    #             bgt draw_duck_white
    #             make screen black
    #             addi hit_variable, 1
    #             j top_of_game_loop
    if hits >= 1 and hits < @frameDelay 
      @black.blit @screen,[0,0]
      hits += 1
      @ducks.map &:color_trans
    end
    # Draw each duck as a white square

    # draw_duck_white:
    #             lhs frame_delay, double_frame_delay
    #             cmpi hit_variable, double_frame_delay + 1 // the first time the duck will be black
    #             bgt draw_duck_normal
    #             movi 1, is_duck_white
    # check_sensor: load gun1_sensor_IO, gun1_sensor
    #             // the duck should be black, if not draw duck normal
    #
    #             cmp hit_variable, frame_should_be_black
    #             bne check_for_white
    # black_cheat_test: cmpi 0, gun1_sensor
    #             beq increment_hit_variable
    # Cheat_test: movi draw_duck_normal_num, hit_variable,  // check for black duck
    #  
    # check_for_white:
    #             cmpi 1, gun1_sensor
    #             bne increment_hit_variable
    # update_score:
    #              update the score
    #              kill the duck
    #             j top_of_game_loop
    # increment_hit_variable:
    #             addi hit_variable, 1
    #             j top_of_game_loop
    #             
    #draw_duck_normal:
    #             movi 0, is_duck_white?
    #         
    #             
    if hits >= @frameDelay and hits < @frameDelay*(@ducks.count) + @frameDelay 
      duck.color_white()

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
