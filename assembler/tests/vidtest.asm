xor $0, $0
xor $1, $1
xor $2, $2
xor $3, $3
xor $4, $4
xor $5, $5
xor $6, $6
xor $7, $7
xor $8, $8
xor $9, $9
xor $10, $10
xor $11, $11
xor $12, $12
xor $13, $13
xor $14, $14
xor $15, $15
movi 134, $0
lshi 8, $0
addui 84, $0
movi 140, $10
lshi 8, $10
addui 167, $10
AddressLoop: movi Stall, $15
cmp $0, $10
beq $15
ValueLoop: movi ResetVal, $15
cmpi 39, $1
beq $15
stor $1, $0
addui 1, $0
addui 1, $1
movi AddressLoop, $15
juc $15
ResetVal: movi AddressLoop, $15
movi 0, $1
juc $15
Stall: juc $14