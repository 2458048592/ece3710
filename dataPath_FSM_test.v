`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module: dataPath Test
// Description: This writes a random immediate to a certain register, then subtracts
//     the same immediate value from that register's value and writes into another
//     register.  Smart outputs.  Verify results based on waveform.
// 
////////////////////////////////////////////////////////////////////////////////

module dataPath_FSM_test;

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
	parameter ADDI = 8'b01010000;
	parameter SUBI = 8'b10010000;
	
	integer i,j; //ForLoop Counter
	

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
		
		//****TESTS ADDI FOREVER AND WRITES IT TO REG0 EVERYTIME****
		// Load value 1 into reg0
		CLR = 0; // CLR = 1 clears all reg values;
		selectImm = 1;
		Imm = 0;
		// B output should be 1
		readRegB = 0;
		readRegA = 0;
		op = ADDI;
		loadReg = 0; // this selects the register to write output Z into 
		
		#2;
		
		selectImm = 1;
					
		// Loop to write result to all registers
		for (j = 0; j < 16; j = j + 1) 
		begin
			Imm = $random % (2 ** 8); // 8 bit number
			readRegA = j;
			readRegB = j;
			op = ADDI;
			// Load the value of 0 + Imm into register j+1 using register j whose value is 0
			loadReg = (j + 1) % 16;
			// Wait a cycle for everything to propagate
			#2; 
			// A and B select register j+1
			readRegA = (j + 1) % 16;
			readRegB = (j + 1) % 16;
			// Subtract the immediate from register j+1 and load into register j
			// This should give a value in j of 0
			op = SUBI;
			loadReg = j;
			// Wait a cycle for everything to propagate
			#2;
			// Verify that A is the Immediate value sign-extended
			if (A != {Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm})
				$display("Error with reg %d", (j + 1) % 16);
			Imm = 0;
			op = ADDI;
			readRegA = j;
			#2;
			//if (A != 0)
			//	$display("Error with reg %d", j);
			// Set reg 1 to 0
			op = ADDI;
			loadReg = (j + 1) % 16;
			readRegA = j;
			#2;
			// Verify that register j is now set to 0
			if (A != 0)
				$display("Error with reg %d", j);
		end
	end
	
	// Simulate the clock
	always begin
		#1 CLK = ~CLK;	
	end
      
endmodule



