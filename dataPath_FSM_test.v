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
	
	// Set parameters to run through each op_code
	parameter ADD = 8'b00000101;
	parameter ADDI = 8'b01010000;
	parameter ADDU = 8'b00000110;
	parameter ADDUI = 8'b01100000;
	parameter ADDC = 8'b00000111;
	parameter ADDCU = 8'b00000100;
	parameter ADDCUI = 8'b10100000; // Replaces SUBCI
	parameter ADDCI = 8'b01110000;
	parameter SUB = 8'b00001001;
	parameter SUBI = 8'b10010000;
	parameter CMP = 8'b00001011;
	parameter CMPI = 8'b10110000;
	parameter CMPUI = 8'b11100000; // Replaces MULI
	parameter AND = 8'b00000001;
	parameter OR = 8'b00000010;
	parameter XOR = 8'b00000011;
	parameter NOT = 8'b00001111;
	parameter LSH = 8'b10000100; 
	parameter LSHI = 8'b10000000; // Imm is unsigned
	parameter RSH = 8'b10001100;
	parameter RSHI = 8'b10000001; // Imm is unsigned
	parameter ALSH = 8'b10000101;
	parameter ARSH = 8'b10001101;
	
	integer i,j; //ForLoop Counter
	// Set up array for to interate through
	integer codes[22:0];
	

	initial begin
		codes[0] = 8'b00000101; // ADD
		codes[1] = 8'b01010000; // ADDI
		codes[2] = 8'b00000110; // ADDU
		codes[3] = 8'b01100000; // ADDUI
		codes[4] = 8'b00000111; // ADDC
		codes[5] = 8'b00000100; // ADDCU
		codes[6] = 8'b10100000; // ADDCUI // Replaces SUBCI
		codes[7] = 8'b01110000; // ADDCI
		codes[8] = 8'b00001001; // SUB
		codes[9] = 8'b10010000; // SUBI
		codes[10] = 8'b00001011; // CMP
		codes[11] = 8'b10110000; // CMPI
		codes[12] = 8'b11100000; // CMPUI // Replaces MULI
		codes[13] = 8'b00000001; // AND
		codes[14] = 8'b00000010; // OR
		codes[15] = 8'b00000011; // XOR
		codes[16] = 8'b00001111; // NOT
		codes[17] = 8'b10000100; // LSH
		codes[18] = 8'b10000000; // LSHI // Imm is unsigned
		codes[19] = 8'b10001100; // RSH
		codes[20] = 8'b10000001; // RSHI // Imm is unsigned
		codes[21] = 8'b10000101; // ALSH
		codes[22] = 8'b10001101; // ARSH
	
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
		
		
		// Load value 1 into reg0
		CLR = 0; // CLR = 1 clears all reg values;
		selectImm = 1;
		Imm = 1;
		op = ADDI;
		// Don't care about readRegA or readRegB in this case
		readRegA = 5;
		readRegB = 0;
		loadReg = 1; // this selects the register
		
		#10
		loadReg = 0;
		readRegA = 1;
		if(A != 1)
		begin
			$display("ERROR");
		end
		
		
		
		
		
		
		
//		// Check each op_code on datapath to make sure it is working
//		for (j = 0; j < 23; j = j + 1)
//		begin
//		
//			for (i = 0; i < 16; i = i + 1)
//			begin
//				case(i)
//					0: begin // Inputs to dataPath, wait, check if working
//							op = codes[j];
//						end
//						
//					1:
//					2:
//					3:
//					4:
//					default:
//			end
//		end
        
		// Add stimulus here

	end
	
	// Simulate the clock
	always
		begin
			#1 CLK = ~CLK;	
		end
      
endmodule

