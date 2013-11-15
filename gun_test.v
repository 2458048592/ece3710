`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:35:23 11/14/2013
// Design Name:   gun
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/gun_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gun
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gun_test;

	// Inputs
	reg clk;
	reg CLR;
	reg trigger;

	// Outputs
	wire trigger_state;

	// Instantiate the Unit Under Test (UUT)
	gun uut (
		.clk(clk), 
		.CLR(CLR), 
		.trigger(trigger), 
		.trigger_state(trigger_state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
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
		#20 trigger = 0;
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
		#1 clk = ~clk;
      
endmodule

