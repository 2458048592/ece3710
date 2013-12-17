`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:29:09 11/14/2013
// Design Name:   gun_top
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/gun_top_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gun_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gun_top_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg trigger;

	// Outputs
	wire LED;

	// Instantiate the Unit Under Test (UUT)
	gun_top uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.trigger(trigger), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		trigger = 0;

		#10;
		CLR = 1;
		#2 CLR =0;
		
		#1 trigger = 0;
		#3 trigger = 1;
		#20 trigger = 0;
		#10 trigger = 1;
		#10 trigger = 0;
		#9 trigger = 1;
		#1 trigger = 0;
		#9 trigger = 1;
		#1 trigger = 0;
		#9 trigger = 1;
		#1 trigger = 0;
		#9 trigger = 1;
		#2 trigger = 0;
		#9 trigger = 1;
		#1 trigger = 0;
		#9 trigger = 1;
		#1 trigger = 0;
		#9 trigger = 1;
		#500 trigger = 0;
		#1 trigger = 1;
		#2 trigger = 0;
		#9 trigger = 1;
		#20 trigger = 0;
		#1 trigger = 1;
		#20 trigger = 0;
		
		#30 trigger = 1;
		#10 trigger = 0;
        
		// Add stimulus here

	end
	
	always
		#1 CLK = ~CLK;
      
endmodule

