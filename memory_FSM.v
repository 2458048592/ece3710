`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:36 10/10/2013 
// Design Name: 
// Module Name:    memory_FSM 
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
module memory_FSM(
    input clk,
    input clr,
    input [5:0] ext_input,
	 input button,
    output [6:0] seg7,
    output [3:0] select
    );
	
	wire [15:0]addr0,addr1;
	wire w0,w1;
	wire [15:0]data0,data1;
	wire [17:0] out0, out1;
	wire [15:0] display;
//	input clk,
//	input clr,
//	input [5:0] ext_input,
//	output reg[14:0] addr0, addr1,
//	output reg w0, w1,
//	output reg[15:0] data0, data1
	memory_FSM_fib fsm(clk,clr,ext_input,addr0,addr1,w0,w1,data0,data1);

	
//	input CLK, CLR, w0, w1,
//	input [14:0] addr0, addr1,
//	input [17:0] data0, data1,
//	output reg [17:0] out0, out1
	memory2 mem_block(clk,clr,w0,w1,addr0,addr1,data0,data1,out0,out1);
	
//	input [15:0] a0,
//	input [15:0] a1,
//	input sel,
//	output reg [15:0] b
	mux2_to_1_16bit muxX(out0,out1,button,display);
	
	SSD_decoder decoder(clk, clr, display, seg7, select);
	


endmodule
