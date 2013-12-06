#########################################################################
#
# Duckhunt
#
#
#   VAR stands for variable, just use a label to reserve a memory location
#
#
########################################################################
VAR_VGA_moveToX: xor $0, $0     # where to move the duck to 
VAR_VGA_moveToY: xor $0, $0     # where to move the duck to 
VAR_VGA_currentX: xor $0, $0    # current duck X pos
  movi VAR_VGA_currentX, $2 
  stor $0, $2 
VAR_VGA_currentY: xor $0, $0    # current duck Y pos
  movi VAR_VGA_currentY, $2 
  stor $0, $2 
VAR_moveDuckReturn: xor $0, $0  

topLeftCorner: movi bottomRightCorner, $12_return
  movi 0, $14_y 
  movi 0, $13_x
 
  movi moveDuck, $15
  juc $15

topRightCorner: movi topLeftCorner, $12_return
  movi 0, $14_y 

  lui 0x02, $13
  movi 0x40, $2
  or $2, $13_x # x = 640 - 64 = 576 = 0x240

  movi moveDuck, $15
  juc $15

bottomRightCorner: movi bottomLeftCorner, $12_return
  lui 0x02, $13
  movi 0x40, $2
  or $2, $13_x # x = 640 - 64 = 576 = 0x240
  
  lui 0x01, $14
  movi 0xA0, $2
  or $2, $14_y # y = 480 - 64 = 416 = 0x1A0
  
  movi moveDuck, $15
  juc $15

bottomLeftCorner: movi topRightCorner, $12_return
  movi 0, $13_x 

  lui 0x01, $14
  movi 0xA0, $2
  or $2, $14_y # y = 480 - 64 = 416 = 0x1A0

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
    movi 0x01, $14_sleepArg
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
      # if (moveToX > currentX) {
        movi addToX, $15
        cmp $1_currentX, $3_moveToX
        bgt $15
      # }
      # else {
        movi subFromX, $15
        juc $15
      # }

      addToX: addui 1, $1 # add 1 to pos
        movi finishedAddSubX, $15
        juc $15
        
      subFromX: subi 1, $1 #sub 1 to pos

      finishedAddSubX: xor $5, $5

      lui 0xc0, $5
      stor $1, $5_vga_addr # update VGA

      stor $1, $2 # save currentX

      movi finishedElseX, $15
      juc $15
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
      # if (moveToY > currentY) {
        movi addToY, $15
        cmp $1_currentY, $3_moveToY
        bgt $15
      # }
      # else {
        movi subFromY, $15
        juc $15
      # }

      addToY: addui 1, $1 # add 1 to pos
        movi finishedAddSubY, $15
        juc $15
        
      subFromY: subi 1, $1 #sub 1 to pos

      finishedAddSubY: xor $5, $5
      
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
        movi VAR_moveDuckReturn, $2
        load $15, $2
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



END: xor $0, $0







