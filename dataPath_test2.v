`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module: dataPath test2
// Description:  This testfixture reads and writes to the same register within the same
//      control cycle.
// 
////////////////////////////////////////////////////////////////////////////////

module dataPath_test2;

	// Inputs
	reg CLK;
	reg CLR;
	reg selectImm;
	reg [4:0] loadReg;
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
		CLR = 1;
		selectImm = 0;
		loadReg = 0;
		readRegA = 0;
		readRegB = 0;
		Imm = 0;
		op = 0;
		i = 0;
		#2;
		CLR = 0;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here
		// Outer For Loop selects the register, Inner For Loop iterates up to 16 and adds up to 16 each time through the body.
		// This proves that each register can be assigned and read during the same computation cycle.
		for(j=0; j<16; j=j+1)
			for(i=0; i<16; i=i+1) begin
				// The register's identifier +1 will be added to the value in that register each time through the inner loop.
				readRegA = j;
				readRegB = j;
				loadReg = j;
				op = ADDI;
				selectImm = 1;
				Imm = j + 1;
				#2;
			end
			
		op = 16'b0;

	end
	
	always begin
		#1 CLK = ~CLK;
	end
      
endmodule

