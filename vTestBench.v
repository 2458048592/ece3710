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

	// Outputs
	wire vSync;
	wire vBright;
	wire [20:0] Vcnt;

	// Instantiate the Unit Under Test (UUT)
	vVideo uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.vSync(vSync), 
		.vBright(vBright), 
		.Vcnt(Vcnt)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
        
		// Add stimulus here
		CLR = 1'b1;
		#10;
		CLR = 1'b0;
		
		#4000000;
		$display("Finished.");
		$finish;
	end
	
	always #1 CLK = ~CLK;
	
      
endmodule

