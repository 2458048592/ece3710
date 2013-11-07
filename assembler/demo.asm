# 1. Load data from memory into the regfile
addi 100, $0
addi 200, $2
stor $2, $0 # Value 100 into address 200
movi 7, $15
JUC $15
XOR $10, $10
XOR $10, $10  
load $1_v100, $2 # Load from address in $2, and put that value into $1


# 2. Perform a series of arithmetic andlogical operations (set flags) 

movi 0, $0
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
movi 127, $15

# 3. Store the result in memory
stor $15, $1 # Store value 20 in address 127 ($15)

# 4. Reload the result from memory into the regfile
load $4, $15 #reg4 should have value 20

# 5. Perfrom arithmetic to set flags
movi 5, $10 #break look when i =5, currently line 24
movi 0, $11_i # loop counter
addi 1, $11
movi 24, $14
cmp $10, $11
bneq $14 #currently on line 29, move to line 24

# 6. Use the flags to do branches (BEQ, BNEQ, JUC)
movi 0, $0
movi 1, $1
movi 30, $14
cmp $0, $1
beq $14 # shouldn't branch
# 7. Write the result into memory and display at the output
