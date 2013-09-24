`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module Name:    equiv_check 
// Description: equiv_check instantiates both the Verilog and the structural synthesis of the Verilog ALU modules
//      for direct comparison during the randomized test.
//
//////////////////////////////////////////////////////////////////////////////////
module equiv_check(
	input [15:0] a1, a2, b1, b2,
	input c1, c2,
	input [7:0] op1, op2,
	output [15:0] y1, y2,
	output [4:0] flags1, flags2
    );
	
	ALU ALU_beh(c1, a1, b1, op1, y1, flags1[4], flags1[3], flags1[2], flags1[1], flags1[0]);
	// c, C, L, F, Z, N, a, b, op, y
	// Flags =  C, L, F, Z, N
	ALU_syn ALU_synth(c2, flags2[4], flags2[3], flags2[2], flags2[1], flags2[0], a2, b2, op2, y2);

endmodule
