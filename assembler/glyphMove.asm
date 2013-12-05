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
lui 192, $0
movi 64, $1
addui 50, $2
moveLoop: movi duckIncrement, $15
cmp $2, $3
beq $15
stor $1, $0
addui 1, $0
stor $1, $0
subi 1, $0
addui 1, $3
movi moveLoop, $15
juc $15
duckIncrement: movi moveLoop, $15
addui 1, $1
xor $3, $3
juc $15