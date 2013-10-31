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
	wire hSync;
	wire vCntEna;
	wire hBright;
	wire [6:0] HA;

	// Instantiate the Unit Under Test (UUT)
	hVideo uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.hSync(hSync), 
		.vCntEna(vCntEna), 
		.hBright(hBright), 
		.HA(HA)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 10 ns for global reset to finish
		#10;
		
		CLR = 1'b0;
		#500;
		CLR = 1'b1;
		#51;
		CLR = 1'b0;
		#10000;
			$display("Finished");
			$finish;
        
		// Add stimulus here

	end
	
	always begin CLK = ~CLK; #5; end
      
endmodule

