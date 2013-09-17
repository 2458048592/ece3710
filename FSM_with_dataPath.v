`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:29:49 09/17/2013 
// Design Name: 
// Module Name:    FSM_with_dataPath 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM_with_dataPath(
    input clk,
    input reset,
    output [6:0] seg7,
    output [3:0] select
    );
	wire selectImm;
	wire [3:0] loadReg, readRegA, readRegB;
	wire [7:0] Imm, op;
	wire [15:0] A, B, Z;
	wire [4:0] flags;
	
 
	FSM fsm(clk, reset, selectImm, loadReg, readRegA, readRegB, Imm, op);
	dataPath data(clk, reset, selectImm, loadReg, readRegA, readRegB, Imm, op, A, B, Z, flags);

endmodule
