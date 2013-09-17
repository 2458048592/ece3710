`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:02:47 09/17/2013
// Design Name:   dataPath
// Module Name:   C:/Users/Zach/Documents/Xilinx/ALU/dataPath_FSM_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dataPath_FSM_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg selectImm;
	reg [3:0] loadReg;
	reg [3:0] readRegA;
	reg [3:0] readRegB;
	reg [7:0] Imm;
	reg [7:0] op;

	// Outputs
	wire [15:0] A;
	wire [15:0] B;
	wire [15:0] Z;
	wire [4:0] flags;

	// Instantiate the Unit Under Test (UUT)
	dataPath uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.selectImm(selectImm), 
		.loadReg(loadReg), 
		.readRegA(readRegA), 
		.readRegB(readRegB), 
		.Imm(Imm), 
		.op(op), 
		.A(A), 
		.B(B), 
		.Z(Z), 
		.flags(flags)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		selectImm = 0;
		loadReg = 0;
		readRegA = 0;
		readRegB = 0;
		Imm = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

