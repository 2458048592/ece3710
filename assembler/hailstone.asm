Start: XOR $0, $0 # set register r0 to 0
XOR $1, $1 # 
XOR $2, $2 # ensure the rest of the registers are set to 0
XOR $3, $3
XOR $4, $4
XOR $5, $5
XOR $6, $6
XOR $7, $7
XOR $8, $8
XOR $9, $9
XOR $10, $10
XOR $11, $11
XOR $12, $12
XOR $13, $13
XOR $14, $14
XOR $15, $15
addui 254, $0 # Set up some interesting values and store them in memory
movi 63, $4   # 254 is the last value to run
lshi 8, $4
addui 255, $4
stor $4, $0
XOR $0, $0
addui 128, $0 # 128 is the second to last value to run
subi 1, $4
stor $4, $0
XOR $0, $0
addui 42, $0 # 42 is the third value to run
subi 1, $4
stor $4, $0
XOR $0, $0
addui 65, $0 # 65 is the second value to run
subi 1, $4
stor $4, $0
XOR $0, $0
addui 4, $0 # 4 is the first value to run
subi 1, $4
stor $4, $0
load $4, $0	# Load the first value
Loop: movi CheckAddress, $15
cmpi 1, $0
beq $15
mov $0, $1
movi Even, $15
lshi 15, $1
beq $15
mov $0, $1 # We are Odd, so multiply by 3 and add 1
lshi 2, $0
addu $0, $1
addui 1, $0
XOR $1, $1 # reset r1 to 0
movi Loop, $15
JUC $15
Even: rshi 2, $0 # we are Even, so divide by 2
movi Loop, $15
JUC $15
CheckAddress: movi 63, $0
lshi 8, $0
addui 255, $0
movi Start, $15 # We've reached the end of the Hailstone sequence for
cmp $0, $4		# the number, so see if we've reached the last of our
beq $15			# interesting numbers
addui 1, $4
load $0, $4
movi Loop, $15
JUC $15