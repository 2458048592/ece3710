`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_White_test;

	// Inputs
	reg CLK;
	reg CLR;

	// Outputs
	wire r0;
	wire r1;
	wire r2;
	wire g0;
	wire g1;
	wire g2;
	wire b0;
	wire b1;
	wire hSync;
	wire vSync;
	wire _CLK;

	// Instantiate the Unit Under Test (UUT)
	VGA_White uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.r0(r0), 
		.r1(r1), 
		.r2(r2), 
		.g0(g0), 
		.g1(g1), 
		.g2(g2), 
		.b0(b0), 
		.b1(b1), 
		.hSync(hSync), 
		.vSync(vSync),
		._CLK(_CLK)
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
		#100000000;
		$finish;
	end
	
	always begin
		#1 CLK = ~CLK;
	end
      
endmodule

