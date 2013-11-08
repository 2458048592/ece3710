`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module hTestBench;

	// Inputs
	reg CLK;
	reg CLR;

	// Outputs
	wire VCntEna;
	wire HSync;
	wire [9:0] HPix;

	// Instantiate the Unit Under Test (UUT)
	hCounter uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.VCntEna(VCntEna), 
		.HSync(HSync), 
		.HPix(HPix)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   
	always begin CLK = ~CLK; #1; end
	
endmodule

