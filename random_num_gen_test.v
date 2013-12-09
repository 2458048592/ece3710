`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:54:41 12/07/2013
// Design Name:   random_num_gen
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/random_num_gen_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: random_num_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module random_num_gen_test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [9:0] data;

	// Instantiate the Unit Under Test (UUT)
	random_num_gen uut (
		.clk(clk), 
	//	.rst_n(rst_n), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 1;

		// Wait 100 ns for global reset to finish
		#100;
       
		
		 #1000;
		 
		// Add stimulus here

	end
	
	always
		#1 clk = ~clk;
      
endmodule

