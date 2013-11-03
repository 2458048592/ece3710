`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:09:46 10/29/2013 
// Design Name: 
// Module Name:    CPU 
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
module CPU(
    input CLK,
    input CLR,
	 output [15:0] B, aluOut, // for debugging
	 output [17:0] a_din, a_dout, b_din, b_dout, // for debugging
	 output [14:0] a_addr, b_addr, // for debugging
	 output [4:0] FLAGS
    );
	 
	

	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg;
	wire selectImm, selectResult;
	wire [17:0] /*inst,*/ out1;
	wire set_addr = 0; 
	wire [14:0] pc_load_addr = 0;
	wire [13:0] /* pc_addr,*/ c_addr, d_addr;

	
	program_counter counter(CLK,CLR,set_addr,pc_load_addr, a_addr);
	
	memory asm_RAM (CLK, 1'b0, a_addr, a_din, a_dout, CLK, b_wr, b_addr, b_din, b_dout);
	//memory game_RAM (CLK, 1'b0, c_addr, c_din, c_dout, CLK, 1'b0, d_addr, d_din, d_dout);

	/* Inputs and outputs for the controller
	input CLK, CLR,
	input [17:0] inst, out1,
	output w1, e1, // w1 is writeToMemory
	output [15:0] addr1, // A[14:0] is addr1 for the memory module
	output [15:0] data1,
	output [4:0] FLAGS*/
	controller_integrated controller(CLK,CLR,a_dout,external_din,b_wr,b_addr,b_din,FLAGS,B,aluOut);


endmodule
