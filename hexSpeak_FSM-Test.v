`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:46:37 09/23/2013
// Design Name:   hexSpeak_FSM
// Module Name:   C:/Users/Phil/ALU_datapath_Git/hexSpeak_FSM-Test.v
// Project Name:  ALU_datapath_Git
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hexSpeak_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hexSpeak_FSM_Test;

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
	hexSpeak_FSM uut (
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
		clk = 0;
		clr = 1;
		ext_input = 0;

		// Wait 2 ns for global reset to finish
		#2;
		clr = 0;
		
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
        
		// Add stimulus here

	end
	
	always
		#1 clk = ~clk;
      
endmodule

