addui 255, $3 # max 
lui 1, $1 # 256
or $3, $1 # becomes 511
load $2, $1  # load 511
