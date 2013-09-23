`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module: SSD_decoder_test
// Description: This is a test for all 4 7-segment displays
// 
////////////////////////////////////////////////////////////////////////////////

module SSD_decoder_test;

	// Inputs
	reg clk;
	reg clr;
	reg [15:0] number;

	// Outputs
	wire [6:0] ssOut;
	wire [3:0] select;

	// Instantiate the Unit Under Test (UUT)
	SSD_decoder uut (
		.clk(clk), 
		.clr(clr), 
		.number(number), 
		.ssOut(ssOut), 
		.select(select)
	);
	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		number = 0;
		
		#5 clr = 1;
		#1 clr = 0;
		
		// number is automatically parsed into 4-bit chunks by the decoder
		for(i =0; i < 2**16; i = i+1) begin
			number = i;
			#1000000;
		end
	end
	
	
	always
		#1 clk = ~clk;
      
      
endmodule

