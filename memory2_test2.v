`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:44:20 10/08/2013
// Design Name:   memory2
// Module Name:   C:/Users/Phil/Controller-Integrated/memory2_test2.v
// Project Name:  Controller-Integrated
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory2_test2;

	// Inputs
	reg CLK;
	reg CLR;
	reg w0;
	reg w1;
	reg [14:0] addr0;
	reg [14:0] addr1;
	reg [17:0] data0;
	reg [17:0] data1;

	// Outputs
	wire [17:0] out0;
	wire [17:0] out1;

	// Instantiate the Unit Under Test (UUT)
	memory2 uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.w0(w0), 
		.w1(w1), 
		.addr0(addr0), 
		.addr1(addr1), 
		.data0(data0), 
		.data1(data1), 
		.out0(out0), 
		.out1(out1)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		w0 = 0;
		w1 = 0;
		addr0 = 0;
		addr1 = 0;
		data0 = 0;
		data1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		w1 = 1;
		data1 = 42;
		#2;
		data1 = 0;
		w1 = 0;
		#2;
	end
	
	always begin
		#1 CLK = ~CLK;
	end
      
endmodule

