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
	 input load_program,
	 input [14:0] addr0_ext,
	 input [17:0] write_data0,
	 output [15:0] addr1, B, aluOut, // for debugging
	 output [17:0] inst, // for debugging
	 output [14:0] pc_addr, // for debugging
	 output [4:0] FLAGS
    );
	 
	

	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg;
	wire selectImm, selectResult;
	wire [17:0] /*inst,*/ out1;
	wire set_addr = 0; 
	wire [14:0] pc_load_addr = 0;
	wire [14:0] /* pc_addr,*/ addr0;

	
	program_counter counter(CLK,CLR,set_addr,pc_load_addr, pc_addr);
	
	
	// The first secction of memory and ports (w0,pc_addr,write_data0,inst) are used for the assembly program
	/* Memory input and output
		input CLK, CLR, w0, w1, e0, e1,
		input [14:0] addr0, addr1,
		input [17:0] data_in0, data_in1,
		output reg [17:0] out0, out1
	*/
	mux2_to_1_16bit Address0Mux(pc_addr, addr0_ext, load_program, addr0);

	memory2 mem_block(CLK,CLR,load_program ,w1, // write
									  1'b1 /*always enable */,e1, // enable
									  addr0,addr1,					// address
									  write_data0,write_data1,		// write data
									  inst,out1);						// memory out data
	
	/* Inputs and outputs for the controller
	input CLK, CLR,
	input [17:0] inst, out1,
	output w1, e1, // w1 is writeToMemory
	output [15:0] addr1, // A[14:0] is addr1 for the memory module
	output [15:0] data1,
	output [4:0] FLAGS*/
	controller_integrated controller(CLK,CLR,inst,out1,w1,e1,addr1,write_data1,FLAGS,B,aluOut);


endmodule
