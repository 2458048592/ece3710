`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:18:38 09/19/2013
// Design Name:   FSM_with_dataPath
// Module Name:   U:/My Documents/ece3710_projects/lab2/FSM_with_dataPath_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM_with_dataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_with_dataPath_test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [6:0] seg7;
	wire [3:0] select;

	// Instantiate the Unit Under Test (UUT)
	FSM_with_dataPath uut (
		.clk(clk), 
		.reset(reset), 
		.seg7(seg7), 
		.select(select)
	);
	integer i;
	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		#5 reset = 1;
		#1 reset = 0;
		
		for(i =0; i < 2**5; i = i+1) begin
			#50;
			#1 reset = 1;
			#2 reset = 0;
		end

	end
      
		
	always
		#1 clk = ~clk;
endmodule

