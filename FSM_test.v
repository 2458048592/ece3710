`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:48 09/17/2013
// Design Name:   FSM
// Module Name:   U:/My Documents/ece3710_projects/lab2/FSM_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FSM_test;

	// Inputs
	reg clk;
	reg clr;

	// Outputs
	wire selectImm;
	wire [3:0] loadReg;
	wire [3:0] readRegA;
	wire [3:0] readRegB;
	wire [7:0] Imm;
	wire [7:0] op;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.clr(clr), 
		.selectImm(selectImm), 
		.loadReg(loadReg), 
		.readRegA(readRegA), 
		.readRegB(readRegB), 
		.Imm(Imm), 
		.op(op)
	);
	integer i;
	initial begin
		// Initialize Inputs
		clr = 0;
		clk = 0;
		#5 clr = 1;
		#1 clr = 0;
		
		for(i =0; i < 2**5; i = i+1) begin
			#50;
			#1 clr = 1;
			#2 clr = 0;
		end
		

        
		

	end
	
	always
		#1 clk = ~clk;
      
endmodule

