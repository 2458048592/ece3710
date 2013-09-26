fibn:   addi $3, $0, 14         # initialize n = 14
        addi $4, $0, 1          # initialize f1 = 1
        addi $6, $0, 0          # initialize memindex = 0
        addi $5, $0, -1         # initialize f2 = -1
loop:   beq $3, $0, endl        # Done with loop if n = 0
        add $4, $4, $5          # f1 = f1 + f2
        sub $5, $4, $5          # f2 = f1 - f2
        addi $3, $3, -1         # n = n - 1
        sb $4, 128($6)          # store result in address 128  + memindex
        addi $6, $6, 1          # mem = mem + 1
        j loop                  # repeat until done
endl:   lb $4, 255($0)          # read from switches
        lb $4, 128($4)          # load fib number
        sb $4, 255($0)          # write to leds
        j endl                  # repeat
