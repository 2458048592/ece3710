`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:46:22 09/19/2013
// Design Name:   SSD_decoder
// Module Name:   U:/My Documents/ece3710_projects/lab2/SSD_decoder_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SSD_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
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
		
		for(i =0; i < 2**16; i = i+1) begin
			number = i;
			#1000000;
		end
	end
	
	
	always
		#1 clk = ~clk;
      
      
endmodule

