`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
//
// Design Name:   FSM_with_dataPath_test
// Description: FSM_with_dataPath_test verifies the outputs for the FSM and values from the ALU
// 
////////////////////////////////////////////////////////////////////////////////

module hexSpeak_with_dataPath_test;

	// Inputs
	reg clk;
	reg reset;
	reg [3:0] ext_input;

	// Outputs
	wire [6:0] seg7;
	wire [3:0] select;
	 wire [15:0] A, B, Z;
	 wire [4:0] flags;

	// Instantiate the Unit Under Test (UUT)
	hexSpeak_with_dataPath uut (
		.clk(clk), 
		.reset(reset), 
		.ext_input(ext_input),
		.seg7(seg7),
		.A(A),
		.B(B),
		.Z(Z),
		.flags(flags),
		.select(select)
	);
	integer i, j;
	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		reset = 1;
		#2;
		reset = 0;
		
		#60;
		// Inner loop runs through all ext_input possibilities
		for (j=0; j < 16; j = j + 1) begin
			ext_input = j;
			#2;
		end

	end
      
		
	always
		#1 clk = ~clk;
endmodule

