NUM_0: BIN 0b000001
NUM_1: BIN 0b000010
NUM_2: BIN 0b000011
NUM_3: BIN 0b000100
NUM_4: BIN 0b000101
NUM_5: BIN 0b000110
NUM_6: BIN 0b000111
NUM_7: BIN 0b001000
NUM_8: BIN 0b001001
NUM_9: BIN 0b001010
A: BIN 0b001011
B: BIN 0b001100
C: BIN 0b001101
D: BIN 0b001110
E: BIN 0b001111
F: BIN 0b010000
G: BIN 0b010001
H: BIN 0b010010
I: BIN 0b010011
J: BIN 0b010100
K: BIN 0b010101
L: BIN 0b010110
M: BIN 0b010111
N: BIN 0b011000
O: BIN 0b011001
P: BIN 0b011010
Q: BIN 0b011011
R: BIN 0b011100
S: BIN 0b011101
T: BIN 0b011110
U: BIN 0b011111
V: BIN 0b100000
W: BIN 0b100001
X: BIN 0b100010
Y: BIN 0b100011
Z: BIN 0b100100
PERIOD: BIN 0b100101
COMMA: BIN 0b100110
COLON: BIN 0b100111
EXCLAIMATION: BIN 0b101000 
PLA: BIN 0b011010_010110_001011
YER: BIN 0b100011_001111_011100

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
VAR_VGA_currentX: BIN 0b0    # current duck X pos
VAR_VGA_currentY: BIN 0b0    # current duck Y pos
VAR_moveDuckReturn: xor $0, $0  
VAR_p1Score: BIN 0b000001_000001 # NUM_0

# Load in the glyphs for the screen

loadPLA: movi loadYER, $12
  lui 0x86, $1
  xor $2, $2
  addui 0x54, $2
  or $2, $1_loc

  movi P, $13
  load $13, $13
  mov $1, $14
  movi loadChar, $15
  juc $15

loadYER: movi START, $12
  lui 0x86, $1
  xor $2, $2
  addui 0x55, $2
  or $2, $1_loc

  movi NUM_1, $2
  load $2, $2
  lshi 12, $2
  movi COLON, $3
  load $3, $3
  lshi 6, $3
  or $3, $2

  mov $2, $13
  mov $1, $14
  movi loadChar, $15

  juc $15


##############################################
#
# loadChar
#    
#    From 8654 to 8ca6 (8 is for memory map to glyph memory)
#     1620.to_s(16) => "654" 
#
#    Arguments
#     $12 return address
#     $13 char to draw (3 chars per 18 bit register)
#     $14 location
#
##############################################
loadChar: xor $0, $0
  stor $13, $14
  mov $12, $15
  juc $15


START: xor $0, $0


topLeftCorner: xor $0, $0

  # increment the score
  movi 1, $13
  movi VAR_p1Score, $14
  movi incScoreReturn, $12

  movi incrementScore, $15
  juc $15
  
  incScoreReturn: xor $0, $0
    movi 0, $14_y 
    movi 0, $13_x

    movi bottomRightCorner, $12_return
  
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

##############################################
#
# incrementP1Score
#
#   Adds $13 to p1's score
#    
#    Arguments
#     $12 return address
#     $14 which player
#
##############################################
incrementScore: xor $0, $0
  lui 0x86, $1
  xor $2, $2
  addui 0x56, $2
  or $2, $1_loc

  mov $14, $3
  load $4, $3


  # if ( score > A) { # A is 9
    mov $4, $2
    lshi 12, $2
    rshi 12, $2 # isolate the ones

    movi incTens, $15
    cmpi 0xA, $2
    bgt $15
  # } 
  # else 
    incOnes: addi 1, $4 # inc the score
    movi doneInc, $15
    juc $15
  # }

  incTens: rshi 6, $4
    addi 1, $4
    lshi 6, $4
    movi 1, $5
    or $5, $4 # write a zero
    

  doneInc: xor $0, $0

  stor $4, $1 # write to screen

  stor $4, $3 # save the score

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
  sleepLoop: movi sleepLoop, $15
  addui 1, $1
  cmp $1, $14
  bneq $15
  juc $13



END: xor $0, $0







