`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:04:03 10/29/2013
// Design Name:   program_counter
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/program_counter_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: program_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module program_counter_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg set_addr;
	reg [15:0] in_addr;

	// Outputs
	wire [15:0] out_addr;

	// Instantiate the Unit Under Test (UUT)
	program_counter uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.set_addr(set_addr), 
		.in_addr(in_addr), 
		.out_addr(out_addr)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		set_addr = 0;
		in_addr = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CLR = 1;
		#3 CLR = 0;
		#20;
		in_addr = 16'b0000000000000100;
		set_addr= 1;
		#2 set_addr =0;
		
		
		
        
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;
      
endmodule

