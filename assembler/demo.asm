# 1. Load data from memory into the regfile
addi 100, $0
addui 150, $2
stor $2_a150, $0_v100 # Value 100 into address 250
movi 7, $13
JUC $13
XOR $10, $10
XOR $10, $10  
load $12_v100, $2_a150 # Load from address in $2, and put that value into $1
movi Arithmetic, $r15
mov $12, $a14
movi Display, $4
JUC $4

# 2. Perform a series of arithmetic andlogical operations (set flags) 

Arithmetic: movi 0, $0
movi 0, $1
movi 0, $2
movi 0, $15
cmpi 0, $0 # This means it is equal, aka set the zero flag
cmpi 1, $0 # This should be not equal
cmp $1, $2 # This should be equal
movi 1, $1 
and $0, $1 # and 0*1, should be zero
movi 20, $0
movi 20, $1
or $0, $1 # value is 20
movi 127, $12

# 3. Store the result in memory
Store: stor $12_Raddr, $1 # Store value 20 in address 127 ($15)
movi 42, $4

# 4. Reload the result from memory into the regfile
load $4, $12_Raddr #reg4 should have value 20
mov $4, $a14
movi Flags, $r15
movi Display, $3
JUC $3

# 5. Perfrom arithmetic to set flags
Flags: movi 5, $10 #break look when i =5, currently line 24
movi 0, $9_i # loop counter
movi Loop, $12
Loop: addi 1, $9
# set up function call
mov $9, $a14 # set the argument address to display
movi Loop_return, $r15
movi Display, $3
JUC $3
Loop_return: cmp $10, $9
bneq $12 

# 6. Use the flags to do branches (BEQ, BNEQ, JUC)
movi 0, $0
movi 1, $1
movi 30, $14
movi End, $r15
cmp $0, $1
beq $14 # shouldn't branch
# 7. Write the result into memory and display at the output

Display: and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
and $14, $14
JUC $r15

End: xor $2, $2
