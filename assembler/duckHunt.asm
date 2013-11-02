#positon_x = 0x11212211214
#positon_y = 0x11212211214
top_of_game_loop:
  
############################################    
# undraw_duck
#   @ducks.undraw @screen, @background # dont know how to undraw
#
#   $1 = postion_x
#   $2 = postion_y
############################################    
undraw_duck:
  #@todo undraw the duck
  # if a hit don't update postion
  cmpi hit_variable, 0
  bgt draw_duck

############################################    
# update_duck
#   calculates a new duck position 
#
#   $1 = postion_x
#   $2 = postion_y
############################################    
update_duck: 
  load postion_x, $1
  load postion_y, $2
  add $1, 5 # move the duck 5 pixels in x direction
  add $2, 5

############################################    
# draw_duck
#   draws a duck at the postion 
#
#   $1 = postion_x
#   $2 = postion_y
############################################    
draw_duck:
  # @todo check the is_duck_white? and draw accordingly

###################################
# observe_trigger
#   checks if the trigger was pulled
#     1 = pulled, 0 otherwise
#
#   $3 = gun_trigger_bool
###################################
observe_trigger: 
  load gun_trigger, $3 # load I/O 
  cmpi 0, $3
  # if ( trigger )  {
  beq pass_hit_code 
  movi 1, hit_variable # then case of if statement
  #} else
pass_hit_code: 
  cmpi 0, hit_variable  
  # if (hit_variable == 0) {
  beq top_of_game_loop
  #} else

###############################################
# start hit sequence
###############################################

################################
# black_out
#   draws the whole screen black
#
#
#
#################################
black_out: 
  # if (hit_variable > frame_delay) {
  cmpi hit_variable, frame_delay
  bgt set_duck_white
  # } else
  # @todo make screen black
  j increment_hit_variable

###################################
# set_duck_white
#  checks the gun sensor, awards points, and changes duck state
#  
#  In the first iteration, if the duck is not black, the duck becomes #   normal and no points are awarded
#  The second iteration,duck is drawn white, if the gun senses white,
#   then points awarded
#
#  set the is_duck_white to true 
#
##################################
draw_duck_white:
  lhs frame_delay, double_frame_delay # this allows for the duck to remain in the white state for more frames

  # if (hit_variable > double_frame_delay)  {
  cmpi hit_variable, double_frame_delay 
  bgt draw_duck_normal
  # } else
  movi 1, is_duck_white

check_sensor:
  load gun1_sensor_IO, gun1_sensor
  # the duck should be black on 1st iteration, if not draw duck normal
  # if ( hit_variable != frame_should_be_black) {
  cmp hit_variable, frame_should_be_black
  bne check_for_white # jump to check_for_white
  #} else

black_cheat_test: 
  # if ( gun1_sensor == 0) {
  cmpi 0, gun1_sensor
  beq increment_hit_variable
  # } else
  j draw_duck_normal # the duck wasn't black, so the hit doesn't count

#####################################
# check_for_white
#   determines if a hit is valid
#  
#
#
#####################################
check_for_white:
  # if (gun1_sensor == 0) { 
  cmpi 1, gun1_sensor
  bne increment_hit_variable
  # } else

#####################################
# update_score
#  updates the score and sets hit_variable to 0
#
#
#####################################
update_score:
  # @todo update the score
  # @todo kill the duck
  movi 0, hit_variable # reset hit, hit sequence finishes when duck dies
  j top_of_game_loop

draw_duck_normal:
  movi 0, is_duck_white?
  movi 0, hit_variable
  j top_of_game_loop

##################################
# increment_hit_variable
#  
###################################
increment_hit_variable:
  addi hit_variable, 1
  j top_of_game_loop


