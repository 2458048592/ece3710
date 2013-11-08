`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module vTestBench;

	// Inputs
	reg CLK;
	reg CLR;
	reg VCntEna;

	// Outputs
	wire VSync;
	wire [9:0] VPix;

	// Instantiate the Unit Under Test (UUT)
	vCounter uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.VCntEna(VCntEna), 
		.VSync(VSync), 
		.VPix(VPix)
	);
	
	integer i,j;

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		VCntEna = 0;
		i = 0;
		j = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		for (j=0; j<60; j=j+1) begin
			for (i=0; i<521; i=i+1) begin
				VCntEna = 1'b1;
				#2;
				VCntEna = 1'b0;
				#2;
			end
		end
		$finish;

	end
	
	always begin CLK = ~CLK; #1; end
      
endmodule

