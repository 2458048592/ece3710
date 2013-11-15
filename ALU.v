`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineers: Plan B
//
// Module: ALU
// Description: This module is purely combinational and generates a 16-bit result y, and
// operational result indicator 1-bit flags C, L, F, Z, N based on an 8-bit operation code op
// two 16-bit input values a, b and a possible third 1-bit value c (which is interpreted as a 17-bit
// value with 16 0s appended)
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
         input c,
    input signed [15:0] a,
    input signed [15:0] b,
         input [7:0] op,
    output reg [15:0] y,
    output reg C, L, F, Z, N
    );
         // currently implemented operations. NOP/WAIT hasn't been explicitly
         // implemented, but can be essentially any operation so long as the
         // result is not written back to the registers. It will be explicitly
         // written as part of the controller.
         // ADD, ADDI, ADDU, ADDUI, ADDC, ADDCU, ADDCUI, ADDCI
         // SUB, SUBI, CMP, CMPI, CMPU/I, AND, OR, XOR, NOT
         // LSH, LSHI, RSH, RSHI, ALSH, ARSH, NOP/WAIT
        
        parameter ADD = 8'b00000101;
        parameter ADDI = 8'b0101xxxx;
        parameter ADDU = 8'b00000110;
        parameter ADDUI = 8'b0110xxxx;
        parameter ADDC = 8'b00000111;
        parameter ADDCU = 8'b00000100;
        parameter ADDCUI = 8'b1010xxxx; // Replaces SUBCI
        parameter ADDCI = 8'b0111xxxx;
        parameter SUB = 8'b00001001;
        parameter SUBI = 8'b1001xxxx;
        parameter CMP = 8'b00001011;
        parameter CMPI = 8'b1011xxxx;
        parameter CMPUI = 8'b1110xxxx; // Replaces MULI
        parameter AND = 8'b00000001;
        parameter OR = 8'b00000010;
        parameter XOR = 8'b00000011;
        parameter NOT = 8'b00001111;
        parameter LSH = 8'b10000100;
        parameter LSHI = 8'b10000000; // Imm is unsigned
        parameter RSH = 8'b10001100;
        parameter RSHI = 8'b10000001; // Imm is unsigned
        parameter ALSH = 8'b10000101; // Interprets RSrc as Unsigned
        parameter ARSH = 8'b10001101; // Interprets RSrc as Unsigned
        
        parameter LUI = 8'b1111xxxx;
        parameter MOV = 8'b00001101;
        parameter MOVI = 8'b1101xxxx;
        
        // generate y result and flags for each operation type
        always @ (*) begin
                C = 0; L = 0; F = 0; Z = 0; N = 0; y = 0;
                casex(op)
                        ADD:
                                begin
                                        // Signed
                                        {C, y} = a + b;
                                        // signed addition can create overflow only
                                        // if the signs of inputs a and b are the same,
                                        // but the output y does not have the same sign
                                        if (a[15] == b[15] && y[15] != b[15])
                                                F = 1;
                                end
                        ADDI:
                                begin
                                        {C, y} = a + b; // a is Rdest, b contains imm
                                        // signed addition can create overflow only
                                        // if the signs of inputs a and b are the same,
                                        // but the output y does not have the same sign
                                        if (a[15] == b[15] && y[15] != b[15])
                                                F = 1;
                                end
                        ADDU:
                                begin
                                        y = $unsigned(a) + $unsigned(b);
                                end
                        ADDUI:
                                begin
                                        {C, y} = $unsigned(a) + $unsigned(b);
                                end
                        ADDC:
                                begin
                                        // The difference between ADD and ADDC is that
                                        // ADDC includes the c input
                                        // signed addition can create overflow only
                                        // if the signs of inputs a and b are the same,
                                        // but the output y does not have the same sign
                                        {C, y} = b + a + {c, 16'b0};
                                        if (a[15] == b[15] && y[15] != b[15])
                                                F = 1;
                                end
                        ADDCU:
                                begin
                                        {C, y} = $unsigned(b) + $unsigned({c, a});
                                end
                        ADDCUI:
                                begin
                                        {C, y} = $unsigned(b) + $unsigned({c, a});
                                end
                        ADDCI:
                                begin
                                        // The difference between ADDI and ADDCI is that
                                        // ADDC includes the c input
                                        {C, y} = b + {c, a};
                                        if (a[15] == b[15] && y[15] != b[15])
                                                F = 1;
                                end
                        SUB:
                                begin
                                        // Overflow for a subtraction operation can occur in 3 ways:
                                        // If the inputs have the same sign, but the output does not and the result is non-zero
                                        // If a is positive, b is negative and y is also negative
                                        // If a is negative, b is positive and y is also positive
                                        {C, y} = a - b;
                                        if (((a[15] == b[15]) && (y[15] != b[15]) && y!= 0) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
                                                F = 1;
                                end
                        SUBI:
                                begin
                                        // Overflow for a subtraction operation can occur in 3 ways:
                                        // If the inputs have the same sign, but the output does not and the result is non-zero
                                        // If a is positive, b is negative and y is also negative
                                        // If a is negative, b is positive and y is also positive
                                        {C, y} = a - b;
                                        if (((a[15] == b[15]) && (y[15] != b[15]) && y!= 0) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
                                                F = 1;
                                end
                        CMP:
                                begin
                                        // signed
                                        y = a - b;
                                        if (y == 0)
                                                Z = 1;
                                        // if a is less than b, then set the N flag
                                        if (a < b)
                                                N = 1;                                         
                                end
                        CMPI:
                                begin
                                        // signed
                                        y = a - b;
                                        if (y == 0)
                                                Z = 1;
                                        // if a is less than b, then set the N flag
                                        if (a < b)
                                                N = 1;        
                                end
                        CMPUI:
                                begin
                                        // unsigned
                                        y = $unsigned(a) - $unsigned(b);
                                        if (y == 0)
                                                Z = 1;
                                        // if a is less than b, then set the L flag
                                        if ($unsigned(a) < $unsigned(b))
                                                L = 1;
                                end
                        AND:
                                begin
                                        y = a & b;
                                end
                        OR:
                                begin
                                        y = a | b;
                                end
                        XOR:
                                begin
                                        y = a ^ b;
                                end
                        NOT:
                                begin
                                        y = ~a;
                                end
                        LSH:
                                begin
                                        y = a << 1;
                                end
                        LSHI:
                                begin
                                        y = a << $unsigned(b[3:0]);                        
                                end
                        RSH:
                                begin
                                        y = a >> 1;                                        
                                end
                        RSHI:
                                begin
                                        y = a >> $unsigned(b[3:0]);                                                        
                                end
                        ALSH:
                                begin
                                        // arithmetic left shifts retain the sign bit
                                        y = {a[15], a[14:0] <<< $unsigned(b)};                
                                end
                        ARSH:
                                begin
                                        y = a >>> $unsigned(b);
                                end
                        MOV:
                                begin
                                        y = b;
                                end
                        MOVI:
                                begin
                                        y = b; // {a[15:8], b[7:0]};
                                end
                        LUI:
                                begin
                                        y = b; // {b[15:8], a[7:0]};
                                end
                        default:
                                begin
                                        y = 0;
                                end
                endcase
                // ensure that if the result is ever 0 to set the Z flag
                if (y == 0)
                        Z = 1;
                
        end

endmodule