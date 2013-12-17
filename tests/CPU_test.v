`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:57:40 11/23/2013
// Design Name:   CPU
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/CPU_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg PAUSE;
	reg STEP;
	reg p1_trigger;
	reg p1_sens;
	reg p2_trigger;
	reg p2_sens;

	// Outputs
	wire p1_shot;
	wire p1_hit;
	wire p2_shot;
	wire p2_hit;
	wire [7:0] RGB_out;
	wire HSync;
	wire VSync;
	wire [6:0] seg7;
	wire [3:0] select;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.PAUSE(PAUSE), 
		.STEP(STEP), 
		.p1_trigger(p1_trigger), 
		.p1_sens(p1_sens), 
		.p2_trigger(p2_trigger), 
		.p2_sens(p2_sens), 
		.p1_shot(p1_shot), 
		.p1_hit(p1_hit), 
		.p2_shot(p2_shot), 
		.p2_hit(p2_hit), 
		.RGB_out(RGB_out), 
		.HSync(HSync), 
		.VSync(VSync), 
		.seg7(seg7), 
		.select(select)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		PAUSE = 0;
		STEP = 0;
		p1_trigger = 0;
		p1_sens = 0;
		p2_trigger = 0;
		p2_sens = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CLR = 1;
		#10 CLR = 0;
        
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;

      
endmodule

