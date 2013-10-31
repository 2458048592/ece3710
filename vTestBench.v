`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:39 10/31/2013
// Design Name:   vVideo
// Module Name:   C:/Users/Phil/mem_block/vTestBench.v
// Project Name:  mem_block
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vVideo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vTestBench;

	// Inputs
	reg CLK;
	reg CLR;
	reg vCntEna;

	// Outputs
	wire vSync;
	wire vBright;
	wire [9:0] Vcnt;

	// Instantiate the Unit Under Test (UUT)
	vVideo uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.vCntEna(vCntEna), 
		.vSync(vSync), 
		.vBright(vBright), 
		.Vcnt(Vcnt)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		vCntEna = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		CLR = 1'b1;
		#22;
		CLR = 1'b0;
		
		#10000;
		$display("Finished.");
		$finish;
	end
	
	always #2 CLK = ~CLK;
	
	always begin 
		#2; vCntEna = 1'b1;
		#1; vCntEna = 1'b0;
	end
      
endmodule

