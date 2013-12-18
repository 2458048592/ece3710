movi 0, $0
TOP: movi 254, $1
movi 255, $2
load $10, $1
load $11, $2
movi TOP, $4
cmpi 0, $0
beq $4

