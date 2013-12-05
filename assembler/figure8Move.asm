#########################################################################
#
# Duckhunt
#
#
#   VAR stands for variable, just use a label to reverse a memory location
#
#
########################################################################
VAR_VGA_moveToX: xor $0, $0     # where to move the duck to 
VAR_VGA_moveToY: xor $0, $0     # where to move the duck to 
VAR_VGA_currentX: xor $0, $0    # current duck X pos
VAR_VGA_currentY: xor $0, $0    # current duck Y pos
VAR_moveDuckReturn: xor $0, $0  

posOne: movi 100, $14_y # y = 240
  # x = 320
  lui 0x01, $13
  movi 0x40, $2
  or $2, $13_x

  movi posTwo, $12

  movi moveDuck, $15
  juc $15

posTwo: movi 240, $14 
  # x = 320
  lui 0x01, $13
  movi 0x40, $2
  or $2, $13_x
  movi posOne, $12
  movi moveDuck, $15
  juc $15




###################################
# moveDuck
#
#   arguments
#     $12 return address
#     $13 moveToX
#     $14 moveToY
#
##################################
moveDuck: xor $0, $0
  # Save arguments to memory
  movi VAR_moveDuckReturn, $2 
  stor $12, $2 
  # store X
  movi VAR_VGA_moveToX, $2 
  stor $13, $2 

  # store Y
  movi VAR_VGA_moveToY, $2 
  stor $14, $2

  # moveCompleted uses 2 bits to specify when the duck has moved
  #    00 - x moving,  y moving
  #    01 - x moving,  y done
  #    10 - x done,    y moving
  #    11 - x done,    y done
  movi 0, $7_moveCompleted 

  # while(!moveCompleted) {
  moveDuckLoop: xor $0, $0
  
    movi sleep, $15
    movi moveDuckSleepReturn, $13
    lui 2, $14_sleepArg
    juc $15
    
    moveDuckSleepReturn: xor $0, $0


    # Load the x positions
    movi VAR_VGA_moveToX, $3
    load $3, $3
    movi VAR_VGA_currentX, $2
    load $1, $2
    
    # Branch when it reaches desired position
    # if (currentX == moveToX) {
      movi setFinishedX, $15
      cmp $3_moveToX, $1_currentX
      beq $15
    # }
    # else {
      addui 1, $1 # add 1 to pos
      
      xor $5, $5
      lui 0xc0, $5
      
      stor $1, $5_vga_addr # update VGA
      stor $1, $2 # save currentX
      movi finishedElseX, $15
    # }
    
    setFinishedX: movi 0b10, $1 
    or $1, $7  # moveComplete = 10  (x done,    y ?)

    finishedElseX: xor $0, $0
    
    # Load the y positions
    movi VAR_VGA_moveToY, $3
    load $3, $3
    movi VAR_VGA_currentY, $2
    load $1, $2
    
    # Branch when it reaches desired position
    # if (currentY == moveToY) {
      movi setFinishedY, $15
      cmp $3_moveToY, $1_currentY
      beq $15
    # }
    # else {
      addui 1, $1 # add 1 to pos
      
      xor $5, $5
      lui 0xc0, $5
      addui 1, $5
      
      stor $1, $5_vga_addr # update VGA
      stor $1, $2 # save currentY
      movi finishedElseY, $15
      juc $15
    # }
    
      setFinishedY: movi 0b01, $1 
      or $1, $7  # moveComplete = 01  (x ?,    y done)
      
      finishedElseY: xor $0, $0

      # if (moveCompleted == 0b11) {
        movi VAR_moveDuckReturn, $15
        cmpi 0b11, $7
        beq $15
      # }
      # else {
        movi moveDuckLoop, $15
        juc $15
      # }
  # }

##########################################3
# sleep
#
#   arguments
#     $14 loop count
#     $13 return address
#
############################################
sleep: xor $1, $1
  sleepLoop: movi sleepLoop, $15
  addui 1, $1
  cmp $1, $14
  bneq $15
  juc $13










