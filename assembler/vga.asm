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
movi 0, $0
movi Change_color, $13_color
movi Skip_trig, $12_skip_t
movi TOP, $r15
movi 0, $8_score

Set_pos: lui 240, $2
  movi 252, $1
  or $1, $2
  lui 255, $14_arg
  movi 255, $3
  or $3, $14_arg
  stor $14_arg, $2


TOP: movi 254, $1_trig # {

load $5, $1_trig

#if (trigBool) {
  cmpi 0, $10_trig_bool 
  bneq $12_skip_t
#}
#else {
  mov $5, $10_trig_bool
  movi 255, $a14 # set arg as white

#  if (trigger) {
  cmp $0 , $5 
  bneq $13_color
#  } 
#  else {


  # color back to normal
  movi 28, $a14 # set arg as green

  #  if (normBool) {
    cmpi 0, $9_norm_bool 
    bneq $r15
  #  } else {
    movi 1, $9_norm_bool
    juc $13_color
#  }
# }
#}

#################################################
# Skip_trig
#
#     sets a bool so that the color isn't stored in memory every loop
#################################################
Skip_trig: movi 254, $1_trig
  load $5, $1_trig 

  # increment score, norm_bool will be 1 the first time through
  movi 255, $2
  load $11, $2_sens_mem

  #if (!norm_bool) {
    movi Skip_score, $3
    #cmpi 0, $9_norm_bool 
    #beq $3
  #}
  #else {
  #  if (sensor) {
      cmpi 1, $11_sens 
      bneq $3
  #  }
  #  else {
      addi 1, $8_score
  #  }
  #}

  Skip_score: mov $5, $10_trig_bool
    movi 0, $9_norm_bool
    JUC $r15

  #}

######################################################################
# change_color
#
#    changes the color in VGA memory
######################################################################
Change_color: lui 240, $2
movi 253, $1
or $1, $2
stor $14_arg, $2
JUC $r15



