`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_Top_test;

	// Inputs
	reg CLK;
	reg CLR;

	// Outputs
	wire hSync;
	wire nhSync;
	wire hBright;
	wire vSync;
	wire nvSync;
	wire vBright;
	wire VidOut;

	// Instantiate the Unit Under Test (UUT)
	VGA_Top uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.hSync(hSync), 
		.nhSync(nhSync), 
		.hBright(hBright), 
		.vSync(vSync), 
		.nvSync(nvSync), 
		.vBright(vBright), 
		.VidOut(VidOut)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		CLR = 1'b1;
		#10;
		CLR = 1'b0;
		#10000000;
		$finish;
	end
	
	always begin
		#1; CLK = ~CLK;
	end
      
endmodule

