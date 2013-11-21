movi 0, $0
movi Change_color, $13_color
movi Skip_trig, $12_skip_t
movi TOP, $r15
movi 0, $8_score



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
movi 0, $a14 # set arg as green

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
cmpi 0, $9_norm_bool 
beq $3
#}
#else {
#  if (sensor) {
cmp 0, $11_sens 
beq $3
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



