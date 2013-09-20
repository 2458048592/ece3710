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
	 input [3:0] ext_input,
    output [6:0] seg7,
	 output tri [15:0] A, B, Z,
	 output [4:0] flags,
    output [3:0] select
    );
	tri selectImm;
	tri [3:0] readRegA, readRegB;
	tri [4:0] loadReg;
	tri [7:0] Imm, op;
	
	// FSM
	// input clk,
	// input clr,
	// input [3:0] ext_input,
   // output reg selectImm,
	// output reg[4:0] loadReg,
   // output reg[3:0] readRegA, readRegB,
   // output reg[7:0] Imm, op
 
	FSM fsm(clk, reset,ext_input, selectImm, loadReg, readRegA, readRegB, Imm, op);
	
	// dataPath
	//input CLK, CLR, selectImm,
	//input [4:0] loadReg,
	//input [3:0] readRegA, readRegB,
	//input [7:0] Imm, op,
	//output [15:0] A, B, Z,
	//output [4:0] flags
	dataPath data(clk, reset, selectImm, loadReg, readRegA, readRegB, Imm, op, A, B, Z, flags);
	
	//input clk,
	// input clr,
   // input [15:0] number,
   // output reg [6:0] ssOut,
   // output reg [3:0] select
	SSD_decoder decoder(clk, reset, Z, seg7, select);

endmodule
