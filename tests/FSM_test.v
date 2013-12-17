`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Design Name:   FSM_test
// Description: FSM_test verifies the correct outputs of the FSM for any inputs
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test;

	// Inputs
	reg clk;
	reg clr;
	reg [3:0] ext_input;

	// Outputs
	wire selectImm;
	wire [4:0] loadReg;
	wire [3:0] readRegA;
	wire [3:0] readRegB;
	wire [7:0] Imm;
	wire [7:0] op;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.clr(clr), 
		.ext_input(ext_input),
		.selectImm(selectImm), 
		.loadReg(loadReg), 
		.readRegA(readRegA), 
		.readRegB(readRegB), 
		.Imm(Imm), 
		.op(op)
	);
	integer i, j;
	initial begin
		// Initialize Inputs
		clr = 0;
		clk = 0;
		#5 clr = 1;
		#1 clr = 0;
		
		// Outer Loop starts the timer
		for(i =0; i < 2**5; i = i+1) begin
			#50;
			// inner loop verifies the output once the FSM is in State16
			for (j=0; j < 16; j = j + 1) begin
				ext_input = j;
				#2;
			end
			#1 clr = 1;
			#2 clr = 0;
		end
		
	end
	
	always
		#1 clk = ~clk;
      
endmodule

