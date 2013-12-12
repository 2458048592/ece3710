SPACE: NUM 0b000000
NUM_0: NUM 0b000001
NUM_1: NUM 0b000010
NUM_2: NUM 0b000011
NUM_3: NUM 0b000100
NUM_4: NUM 0b000101
NUM_5: NUM 0b000110
NUM_6: NUM 0b000111
NUM_7: NUM 0b001000
NUM_8: NUM 0b001001
NUM_9: NUM 0b001010
A: NUM 0b001011
B: NUM 0b001100
C: NUM 0b001101
D: NUM 0b001110
E: NUM 0b001111
F: NUM 0b010000
G: NUM 0b010001
H: NUM 0b010010
I: NUM 0b010011
J: NUM 0b010100
K: NUM 0b010101
L: NUM 0b010110
M: NUM 0b010111
N: NUM 0b011000
O: NUM 0b011001
P: NUM 0b011010
Q: NUM 0b011011
R: NUM 0b011100
S: NUM 0b011101
T: NUM 0b011110
U: NUM 0b011111
V: NUM 0b100000
W: NUM 0b100001
X: NUM 0b100010
Y: NUM 0b100011
Z: NUM 0b100100
PERIOD: NUM 0b100101
COMMA: NUM 0b100110
COLON: NUM 0b100111
EXCLAIMATION: NUM 0b101000 
BULLET: NUM 0b101001
PLA: NUM 0b011010_010110_001011
YER: NUM 0b100011_001111_011100

#########################################################################
#
# Duckhunt
#
#
#   VAR stands for variable, just use a label to reserve a memory location
#
#
########################################################################

# write all to high
LBN $0, $1, 0x2020
# doesn't matter whats in $2
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 
addui 1, $1
stor $2, $1 



# set background to blue
# 0xc003: display Color (8-bit) 
LBN $0, $1, 0x2f
LBN $0, $2, 0xc003
stor $1, $2

VAR_p1ScoreLoc: NUM 0x8657
VAR_p2ScoreLoc: NUM 0x865c
VAR_p1BulletsLoc: NUM 0x868b
VAR_p2BulletsLoc: NUM 0x8690
VAR_shootToPlayLoc: NUM 0x88c7

# Load in the glyphs for the screen
Player1: LBN $0, $12, Player2
  movi 1, $13
  LBN $0, $14, 0x8654
  LBN $0, $15, loadPlayer
  juc $15

Player2: LBN $0, $12, MENU
  movi 2, $13
  LBN $0, $14, 0x8659
  LBN $0, $15, loadPlayer
  juc $15


#####################################
# loadPlayerOne
#
#  $12 return address
#  $13 which player
#  $14 address of where to write player
#
#
loadPlayerReturn: xor $0, $0
loadPlayerWhichPlayer: xor $0, $0
####################################
loadPlayer: xor $0, $0
  LBN $0, $1, 0x868a
  LBN $0, $2, BULLET
  load $2, $2
  stor $2, $1


  LBN $0, $1, loadPlayerReturn
  stor $12, $1
  LBN $0, $1, loadPlayerWhichPlayer
  stor $13, $1
#     $10 return address
#     $11 Top char
#     $12 mid char
#     $13 bottom char
#     $14 location
  
  
  LBN $0, $10, loadPlayerPart2
  LBN $0, $11, P
  load $11, $11
  LBN $0, $12, L
  load $12, $12
  LBN $0, $13, A
  load $13, $13
  #LBN $2, $14, 0x8654

  LBN $2, $15, loadChar
  juc $15

  loadPlayerPart2: xor $0, $0 
    LBN $0, $1, 0x868f
    LBN $0, $2, BULLET
    load $2, $2
    stor $2, $1
    LBN $0, $10, loadPlayerReturn
    load $10, $10
    LBN $0, $11, Y
    load $11, $11
    LBN $0, $12, E
    load $12, $12
    LBN $0, $13, R
    load $13, $13
    #LBN $2, $14, 0x8655
    addui 1, $14

    # store the player's number
    LBN $0, $1, loadPlayerWhichPlayer
    load $1, $1
    addui 1, $1 # offset for glyph
    lshi 6, $1
    LBN $0, $2, COLON
    load $2, $2
    or $2, $1
    addui 1, $14
    stor $1, $14

    subi 1, $14

    LBN $2, $15, loadChar
    juc $15


##############################################
#
# loadChar
#
#    Arguments
#     $10 return address
#     $11 Top char
#     $12 mid char
#     $13 bottom char
#     $14 location
#
##############################################
loadChar: xor $0, $0
  lshi 6, $12
  or $12, $13
  GSTOR $11, $13, $14
  mov $10, $15

  juc $15





START: xor $0, $0

topLeftCorner: xor $0, $0

  #movi 0, $14_y 
  LBN $0, $14, 0x2008
  load $14, $14
  LBN $0, $13, 0x2008
  load $13, $13

  #movi 0, $13_x

  LBN $0, $12_return, bottomRightCorner

  LBN $0, $15, moveDuck
  juc $15


topRightCorner: LBN $0, $12_return, topLeftCorner
  #movi 0, $14_y 

  #LBN $0, $13_x, 0x240 # x = 640 - 64 = 576 = 0x240
  LBN $0, $14, 0x2008
  load $14, $14
  LBN $0, $13, 0x2010
  load $13, $13

  LBN $0, $15, moveDuck
  juc $15

bottomRightCorner: LBN $0, $12_return, bottomLeftCorner
  #LBN $0, $13_x, 0x240 # x = 640 - 64 = 576 = 0x240
  
  #LBN $0, $14_y, 0x1A0 # y = 480 - 64 = 416 = 0x1A0
  LBN $0, $14, 0x2010
  load $14, $14
  LBN $0, $13, 0x2010
  load $13, $13
  
  LBN $0, $15, moveDuck
  juc $15

bottomLeftCorner: LBN $0, $12_return, topRightCorner
  #movi 0, $13_x 

  #LBN $0, $14_y, 0x1A0 # y = 480 - 64 = 416 = 0x1A0
  LBN $0, $14, 0x2010
  load $14, $14
  LBN $0, $13, 0x2008
  load $13, $13

  LBN $0, $15, moveDuck
  juc $15


###################################
# moveDuck
#
#   arguments
#     $12 return address
#     $13 moveToX
#     $14 moveToY
#
VAR_VGA_moveToX: xor $0, $0     # where to move the duck to 
VAR_VGA_moveToY: xor $0, $0     # where to move the duck to 
VAR_VGA_currentX: NUM 0b0    # current duck X pos
VAR_VGA_currentY: NUM 0b0    # current duck Y pos
VAR_moveDuckReturn: xor $0, $0  
##################################
moveDuck: xor $0, $0
  # Save arguments to memory
  LBN $0, $2, VAR_moveDuckReturn
  stor $12, $2 
  # store X
  LBN $0, $2, VAR_VGA_moveToX
  stor $13, $2 

  # store Y
  LBN $0, $2, VAR_VGA_moveToY
  stor $14, $2

  # moveCompleted uses 2 bits to specify when the duck has moved
  #    00 - x moving,  y moving
  #    01 - x moving,  y done
  #    10 - x done,    y moving
  #    11 - x done,    y done
  movi 0, $7_moveCompleted 

  # while(!moveCompleted) {
  moveDuckLoop: xor $0, $0
    
    LBN $0, $12, checkGunReturn
    LBN $0, $15, checkGun
    juc $15

    checkGunReturn: xor $1, $1
  
    LBN $0, $15, sleep
    LBN $0, $13, moveDuckSleepReturn
    movi 0x01, $14_sleepArg
    juc $15
    
    moveDuckSleepReturn: xor $0, $0


    # Load the x positions
    LBN $0, $3, VAR_VGA_moveToX
    load $3, $3
    LBN $0, $2, VAR_VGA_currentX
    load $1, $2
    
    # Branch when it reaches desired position
    # if (currentX == moveToX) {
      LBN $0, $15, setFinishedX
      cmp $3_moveToX, $1_currentX
      beq $15
    # }
    # else {
      # if (moveToX > currentX) {
        LBN $0, $15, addToX
        cmp $1_currentX, $3_moveToX
        bgt $15
      # }
      # else {
        LBN $0, $15, subFromX
        juc $15
      # }

      addToX: addui 1, $1 # add 1 to pos
        LBN $0, $15, finishedAddSubX
        juc $15
        
      subFromX: subi 1, $1 #sub 1 to pos

      finishedAddSubX: xor $5, $5

      lui 0xc0, $5
      stor $1, $5_vga_addr # update VGA

      stor $1, $2 # save currentX

      LBN $0, $15, finishedElseX
      juc $15
    # }
    
    setFinishedX: movi 0b10, $1 
    or $1, $7  # moveComplete = 10  (x done,    y ?)

    finishedElseX: xor $0, $0
    
    # Load the y positions
    LBN $0, $3, VAR_VGA_moveToY
    load $3, $3
    LBN $0, $2, VAR_VGA_currentY
    load $1, $2
    
    # Branch when it reaches desired position
    # if (currentY == moveToY) {
      LBN $0, $15, setFinishedY
      cmp $3_moveToY, $1_currentY
      beq $15
    # }
    # else {
      # if (moveToY > currentY) {
        LBN $0, $15, addToY 
        cmp $1_currentY, $3_moveToY
        bgt $15
      # }
      # else {
        LBN $0, $15, subFromY
        juc $15
      # }

      addToY: addui 1, $1 # add 1 to pos
        LBN $0, $15, finishedAddSubY
        juc $15
        
      subFromY: subi 1, $1 #sub 1 to pos

      finishedAddSubY: xor $5, $5
      
      lui 0xc0, $5
      addui 1, $5
      stor $1, $5_vga_addr # update VGA

      stor $1, $2 # save currentY

      LBN $0, $15, finishedElseY
      juc $15
    # }
    
      setFinishedY: movi 0b01, $1 
      or $1, $7  # moveComplete = 01  (x ?,    y done)
      
      finishedElseY: xor $0, $0

      # if (moveCompleted == 0b11) {
        LBN $0, $2, VAR_moveDuckReturn
        load $15, $2
        cmpi 0b11, $7
        beq $15
      # }
      # else {
        LBN $0, $2, moveDuckLoop
        mov $2, $15
        juc $15
      # }
  # }

##############################################
#
# incrementScore
#
#   Adds $13 to p1's score
#    
#    Arguments
#     $12 return address
#     $13 location on screen address
#     $14 player score address
#
VAR_p1Score: NUM 0b000001_000001_000001 # NUM_0
VAR_p2Score: NUM 0b000001_000001_000001 # NUM_0
VAR_p1Score_actual: NUM 0
VAR_p2Score_actual: NUM 0
VAR_p1Bullets: NUM 0b000001_000001_000001 # NUM_0
VAR_p2Bullets: NUM 0b000001_000001_000001 # NUM_0
##############################################
incrementScore: xor $0, $0

  load $4, $14


  # if ( score > A) { # A is 9
    mov $4, $2
    lshi 12, $2
    rshi 12, $2 # isolate the ones

    LBN $0, $15, incTens
    cmpi 0xA, $2
    bgt $15
  # } 
  # else 
    incOnes: addi 1, $4 # inc the score
    LBN $0, $15, doneInc
    juc $15
  # }

  incTens: xor $0, $0
  # if ( score > A) { # A is 9
    mov $4, $2
    lshi 6, $2
    rshi 12, $2 # isolate the ones

    LBN $0, $15, incHundred
    cmpi 0xA, $2
    bgt $15
  # } 

    rshi 6, $4
    addi 1, $4
    lshi 6, $4
    movi 1, $5
    or $5, $4 # write a zero
    LBN $0, $15, doneInc
    juc $15
    
  incHundred: xor $0, $0

    rshi 12, $4
    addi 1, $4
    lshi 12, $4
    movi 1, $5
    lshi 6, $5
    or $5, $4 # write a zero
    movi 1, $5
    or $5, $4 # write a zero

  doneInc: xor $0, $0

  load $13, $13
  stor $4, $13 # write to screen

  stor $4, $14 # save the score

  mov $12, $15
  juc $15



##########################################3
# sleep
#
#   arguments
#     $14 loop count
#     $13 return address
#
############################################
sleep: xor $1, $1
  LBN $0, $15, sleepLoop
  sleepLoop: addui 1, $1
  cmp $1, $14
  bneq $15
  juc $13


#############################################
# 
# duckDied
#
#   $12 
#   $13 which player
#
VAR_speedOfDuck: xor $0, $0
################################################
duckDied: xor $0, $0
  # move duck off screen to pos 
  #LBN $0, $1, 0x2010
  #load $1, $1

  LBN $0, $1, 0x2034
  stor $0, $1

  LBN $0, $3, 0x2Fe

  LBN $0, $2, VAR_VGA_currentX
  stor $3, $2
  LBN $0, $2, VAR_VGA_currentY
  stor $3, $2

  
  lui 0xc0, $5
  stor $3, $5_vga_addr # update VGA
  addui 1, $5
  stor $3, $5_vga_addr # update VGA

  # if ( $13 == 1) {
    LBN $0, $15, p1Hit
    cmpi 1, $13
    beq $15
  # }
  # else {
  # player 2 hit
  # 0xc003: display Color (8-bit) 
    LBN $0, $1, 0x1c # green
    LBN $0, $2, 0xc003
    stor $1, $2
    LBN $0, $15, bgChangeDone
    juc $15

  # }
  

  p1Hit: xor $0, $0
    LBN $0, $1, 0xe0 # red
    LBN $0, $2, 0xc003
    stor $1, $2

  bgChangeDone: xor $0, $0

  LBN $0, $15, sleep
  LBN $0, $13, duckDiedSleepReturn
  lui 0x10, $14_sleepArg
  juc $15

  duckDiedSleepReturn: xor $0, $0
  # set bg to normal
    LBN $0, $1, 0x2f
    LBN $0, $2, 0xc003
    stor $1, $2
    # play duck sound
    LBN $0, $1, 0x2024
    stor $0, $1

  # if ( isMenu == 1) {
    LBN $0, $1, VAR_isMenu
    load $1, $1
    LBN $0, $15, returnMenu
    cmpi 1, $1
    beq $15
  # }
  # else {

    LBN $0, $15, topRightCorner
    juc $15
    # }

    returnMenu: xor $0, $0
    
    LBN $0, $15, menuCheckGunReturn
    juc $15

  
##########################################33
# checkGun 
#
#
#    $12 return address
#
VAR_checkGunReturn: xor $0, $0
VAR_p1GunState: NUM 0 
VAR_p2GunState: NUM 0 
##############################################
checkGun: xor $0, $0
  LBN $0, $1, VAR_checkGunReturn
  stor $12, $1
  # $8 holds the trig and sens bools, 
  #  0001 - p1 sens
  #  0010 - p1 trig
  # $9 holds the trig and sens bools, 
  #  0100 - p2 sens
  #  1000 - p2 trig
  xor $8, $8 # reset the bools
  xor $9, $9 # reset the bools

  ############# PLAYER 1 ########################

  # P1 gun
  LBN $2, $1_loc, 0x8663

  LBN $0, $4, G
  load $4, $4
  lshi 6, $4

  LBN $0, $3, 0x2000
  load $3, $3_trig # read trig

  LBN $0, $6, VAR_p1GunState
  load $5, $6
  lshi 1, $5 
  or $3, $5


  # if { $5 > 2 ) { 
    LBN $0, $15, p1TriggerPulled
    cmpi 3, $5
    beq $15

  # else {

    # Save off the gun state, clear it with and, add gun state 
    mov $3, $5
    stor $5, $6




    mov $3, $2
    lshi 1, $2 # offset for trig to be stored in $8
    or $2, $8 # save off the state
    addi 1, $3
    or $4, $3

    stor $3, $1_loc # display to screen
    
    
    # if ($8 != 0b10) {
      LBN $0, $15, p1gunReturn
      cmpi 0b10, $8
      bneq $15
    # } 
    # else {
    #0xc002: display Black (1-bit)

      LBN $0, $1, 0xc002
      movi 1, $2
      stor $2, $1

      # increment the bullet
      LBN $2, $13_loc, VAR_p1BulletsLoc
      LBN $0, $14, VAR_p1Bullets
      LBN $0, $12, p1BulletReturn

    LBN $0, $15, incrementScore
    juc $15

    p1BulletReturn: xor $0, $0
      
      LBN $0, $15, sleep
      LBN $0, $13, p1gunReturn
      LBN $0, $14_sleepArg, 0x180
      juc $15
    # }


    p1gunReturn: xor $0, $0


    # P1 sens
    LBN $2, $1_loc, 0x8662

    LBN $0, $4, S
    load $4, $4
    lshi 6, $4

    LBN $0, $3, 0x2001
    load $3, $3_sens # read sens
    or $3, $8 # save off the state
    addi 1, $3
    or $4, $3

    stor $3, $1 # display to screen

    # turn BG back on
    LBN $0, $1, 0xc002
    movi 0, $0
    stor $0, $1
  # }

  p1TriggerPulled: xor $0, $0

  ############# PLAYER 2 ########################

  # P2 gun

  LBN $2, $1_loc, 0x8666

  LBN $0, $4, G
  load $4, $4
  lshi 6, $4

  LBN $0, $3, 0x2002
  load $3, $3_trig # read trig

  LBN $0, $6, VAR_p2GunState
  load $5, $6
  lshi 1, $5 
  or $3, $5


  # if { $5 > 2 ) { 
    LBN $0, $15, p2TriggerPulled
    cmpi 3, $5
    beq $15

  # else {

    # Save off the gun state
    mov $3, $5
    stor $5, $6


    mov $3, $2
    lshi 3, $2 # offset for trig to be stored in $9
    or $2, $9 # save off the state
    addi 1, $3
    or $4, $3

    stor $3, $1_loc # display to screen

    # if ($9 != 0b1000) {
      LBN $0, $15, p2gunReturn
      cmpi 0b1000, $9
      bneq $15
    # } 
    # else {
    #0xc002: display Black (1-bit)

      LBN $0, $1, 0xc002
      movi 1, $2
      stor $2, $1

    # increment the bullet
    LBN $2, $13_loc, VAR_p2BulletsLoc
    LBN $0, $14, VAR_p2Bullets
    LBN $0, $12, p2BulletReturn

    LBN $0, $15, incrementScore
    juc $15

    p2BulletReturn: xor $0, $0
      
      LBN $0, $15, sleep
      LBN $0, $13, p2gunReturn
      LBN $0, $14_sleepArg, 0x180
      juc $15
    # }


    p2gunReturn: xor $0, $0

    # P2 sens
    LBN $2, $1_loc, 0x8665

    LBN $0, $4, S
    load $4, $4
    lshi 6, $4

    LBN $0, $3, 0x2003
    load $3, $3_sens # read sens
    mov $3, $2
    lshi 2, $2 # offset for trig to be stored in $9
    or $2, $9 # save off the state
    addi 1, $3
    or $4, $3

    stor $3, $1 # display to screen

    # turn BG back on
    LBN $0, $1, 0xc002
    movi 0, $0
    stor $0, $1
  # }


  p2TriggerPulled: xor $0, $0

  ### PLAYER 1 score #####

  # if ($8 != 3) {
    LBN $0, $15, dontIncScore
    cmpi 0b11, $8
    bneq $15
  # }
  # else {
    # increment the score
#    LBN $0, $2, VAR_p1Score_actual
#    load $1, $2
#    addui 1, $1
#    stor $1, $2

    LBN $2, $13_loc, VAR_p1ScoreLoc
    LBN $0, $14, VAR_p1Score
    LBN $0, $12, incScoreReturn

    LBN $0, $15, incrementScore
    juc $15
  # }
  
  incScoreReturn: xor $0, $0
    movi 1, $13
    LBN $0, $15, duckDied
    juc $15

  dontIncScore: xor $0, $0


  ### PLAYER 2 score #####

  # if ($9 != 0b1100) {
    LBN $0, $15, dontIncScore1
    cmpi 0b1100, $9
    bneq $15
  # }
  # else {
    # increment the score
    LBN $2, $13_loc, VAR_p2ScoreLoc
    LBN $0, $14, VAR_p2Score
    LBN $0, $12, incScoreReturn1

    LBN $0, $15, incrementScore
    juc $15
  # }
  
  incScoreReturn1: xor $8, $8
    movi 2, $13
    LBN $0, $15, duckDied
    juc $15

  dontIncScore1: xor $9, $9

  LBN $0, $15, VAR_checkGunReturn
  load $15, $15

  juc $15




###########################################
#
# drawBullets
#
#  $12 return address
#  $13 location on screen address
#
VAR_p1BulletCount: NUM 0 # total bullets shot
VAR_p2BulletCount: NUM 0 # total bullets shot
###########################################

LBN $0, $1, VAR_p1BulletCount
LBN $0, $3, VAR_p1BulletsLoc

LBN $0, $2, VAR_p2BulletCount
LBN $0, $4, VAR_p2BulletsLoc

##########################################
#
# Displays the menu
#
#
#
VAR_isMenu: NUM 0b1
##########################################
MENU: xor $0, $0
  LBN $0, $1, VAR_isMenu
  movi 1, $2
  stor $2, $1
  
  LBN $0, $13_x, 0x120 # x = 640 - 64 = 576 = 0x120
  LBN $0, $14_y, 0xd0 # y = 240 - 32 = 208 = 0xd0
  lui 0xc0, $5
  stor $13, $5_vga_addr # update VGA
  addui 1, $5
  stor $14, $5_vga_addr # update VGA



  # check if the duck was hit
  LBN $0, $12, menuCheckGunReturn
  LBN $0, $15, checkGun
  juc $15

  menuCheckGunReturn: xor $1, $1

  # if the score of either player is greater than 1 they hit the duck
  LBN $0, $1, VAR_p1Score
  load $1, $1
  lshi 12, $1 
  rshi 12, $1 # clear the tens/hundreds

  LBN $0, $15, ResetScores
  cmpi 2, $1 
  bge $15

  LBN $0, $1, VAR_p2Score
  load $1, $1
  lshi 12, $1 
  rshi 12, $1 # clear the tens/hundreds

  LBN $0, $15, ResetScores
  cmpi 2, $1 
  bge $15

  LBN $0, $12, drawResetText
  LBN $0, $15, shootToPlay
  juc $15

  drawResetText: xor $0, $0

  LBN $0, $15, MENU
  JUC $15

  ResetScores: xor $0, $0
    LBN $0, $1, VAR_isMenu
    movi 0, $2
    stor $2, $1

    # reset scores
    LBN $0, $3, 0b000001_000001_000001 # NUM_0
    LBN $0, $2, 0b000001_000001 # NUM_0
    LBN $0, $1, VAR_p1Score
    stor $3, $1
    LBN $0, $1, VAR_p1ScoreLoc
    load $1, $1
    stor $2, $1

    LBN $0, $1, VAR_p2Score
    stor $3, $1
    LBN $0, $1, VAR_p2ScoreLoc
    load $1, $1
    stor $2, $1

    LBN $0, $1, VAR_p1Bullets
    stor $3, $1
    LBN $0, $1, VAR_p1BulletsLoc
    load $1, $1
    stor $2, $1

    LBN $0, $1, VAR_p2Bullets
    stor $3, $1
    LBN $0, $1, VAR_p2BulletsLoc
    load $1, $1
    stor $2, $1

    # erase shoot to play

    LBN $2, $14, VAR_shootToPlayLoc
    load $14, $14
    xor $0, $0
    stor $0, $14
    addui 1, $14
    stor $0, $14
    addui 1, $14
    stor $0, $14
    addui 1, $14
    stor $0, $14
    addui 1, $14
    stor $0, $14
    addui 1, $14
    stor $0, $14

    LBN $0, $15, START
    JUC $15

#################################################
#shootToPlay
#
#
#
#    $12 return address
#
shootToPlayReturn: xor $0, $0
################################################
shootToPlay: xor $0, $0
  LBN $0, $1, shootToPlayReturn
  stor $12, $1
#     $10 return address
#     $11 Top char
#     $12 mid char
#     $13 bottom char
#     $14 location
  
  
  LBN $0, $10, shootToPlayPart2
  LBN $0, $11, S
  load $11, $11
  LBN $0, $12, H
  load $12, $12
  LBN $0, $13, O
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14

  LBN $2, $15, loadChar
  juc $15

  shootToPlayPart2: xor $0, $0 

  LBN $0, $10, shootToPlayPart3
  LBN $0, $11, O
  load $11, $11
  LBN $0, $12, T
  load $12, $12
  LBN $0, $13, SPACE
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14
  addui 1, $14

  LBN $2, $15, loadChar
  juc $15

  shootToPlayPart3: xor $0, $0 

  LBN $0, $10, shootToPlayPart4
  LBN $0, $11, D
  load $11, $11
  LBN $0, $12, U
  load $12, $12
  LBN $0, $13, C
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14
  addui 2, $14

  LBN $2, $15, loadChar
  juc $15

  shootToPlayPart4: xor $0, $0 

  LBN $0, $10, shootToPlayPart5
  LBN $0, $11, K
  load $11, $11
  LBN $0, $12, SPACE
  load $12, $12
  LBN $0, $13, T
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14
  addui 3, $14

  LBN $2, $15, loadChar
  juc $15

  shootToPlayPart5: xor $0, $0 

  LBN $0, $10, shootToPlayPart6
  LBN $0, $11, O
  load $11, $11
  LBN $0, $12, SPACE
  load $12, $12
  LBN $0, $13, P
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14
  addui 4, $14

  LBN $2, $15, loadChar
  juc $15

  shootToPlayPart6: xor $0, $0 

  LBN $0, $10, shootToPlayPart7
  LBN $0, $11, L
  load $11, $11
  LBN $0, $12, A
  load $12, $12
  LBN $0, $13, Y
  load $13, $13

  LBN $2, $14, VAR_shootToPlayLoc
  load $14, $14
  addui 5, $14

  LBN $2, $15, loadChar
  juc $15
  
  shootToPlayPart7: xor $0, $0 
  LBN $0, $15, shootToPlayReturn
  load $15, $15
  juc $15
