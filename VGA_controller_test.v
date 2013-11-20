`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:23:15 11/19/2013
// Design Name:   VGA_controller
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/VGA_controller_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA_controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_controller_test;

	// Inputs
	reg CLK;
	reg CLR;

	// Outputs
	wire clkDivPulse;
	wire [9:0] hTickCounter;
	wire [9:0] vLineCounter;
	wire hSync;
	wire vSync;
	wire bright;
	wire [9:0] hCount;
	wire [9:0] vCount;

	// Instantiate the Unit Under Test (UUT)
	VGA_controller uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.clkDivPulse(clkDivPulse),
		.hTickCounter(hTickCounter),
		.vLineCounter(vLineCounter),
		.hSync(hSync), 
		.vSync(vSync), 
		.bright(bright), 
		.hCount(hCount), 
		.vCount(vCount)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 100 ns for global reset to finish
		#100;
      CLR =1;
			#4 CLR =0;
		// Add stimulus here

	end
     
	always
		#1 CLK = ~CLK;
endmodule

