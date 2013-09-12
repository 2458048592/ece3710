`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:01 09/03/2013
// Design Name:   ALU
// Module Name:   C:/Users/Zach/Documents/Xilinx/ALU/ALU_test.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg c;
	reg [15:0] a;
	reg [15:0] b;
	reg [7:0] op;

	// Outputs
	wire [15:0] y;
	wire C; // Carry
	wire L; // Low
	wire F; // Flag
	wire Z; // Zero
	wire N; // Negative

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b),

		.c(c),
		.op(op), 
		.y(y), 
		.C(C), 
		.L(L), 
		.F(F), 
		.Z(Z), 
		.N(N)
	);
		
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
	 reg [4:0] flagTests;
	initial begin
		// Initialize Inputs
		a = 16'b0;
		b = 16'b0;
		op = 16'b0;
		c = 1'b0;

		flagTests = 5'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Specific Testing Cases
		
		//OP CODE ADD
		// Test Zero Overflow Test
		// Check the zero flag. Also the carry flag should not be 1
	   op = ADD;
		a = -1; 
		b = 1;
		#10
		
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON ADD Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		
		#50
		// Test min int + 1
		// Check for the overflow flag
		a = 16'b0111111111111111; // max int 
		b = 1; 
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00100) // Z C F L N
			begin
			$display("ERROR ON ADD Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// min int + (-1)
		#50
		a = 16'b1000000000000000; 
		b = -1; 
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b01100) // Z C F L N
			begin
			$display("ERROR ON ADD Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// @TODO Not sure about the I functions
		// Immediate always in B
		#50
		op = ADDI;
		#10
		// Max int + 1 immediate
		a = 0; 
		b = 16'b0000000001111111; // max immediate value
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON ADDI Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		#50;
		// Test  0 + most negative number

		// This should generate a Carry bit... Adding a 16-bit negative number with 16'b0 will generate a 17-bit signed representation

		// of the number--hence the Carry bit.
		a = 16'b0; 
		b = 16'b1111111110000000;
		#20;
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

		//$display("%b, %b", flagTests, y);

      if (flagTests != 5'b01000) // Z C F L N
			begin
			$display("ERROR ON ADDI Test 2 FLAGS");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end


		if( y != 16'b1111111110000000)
			begin
			$display("ERROR ON ADDI Test 2 Y value");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// Check for flags overflow
		#50
		a = 1; // max positive number 
		b = 16'b0111111111111111; 
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00100) // Z C F L N
			begin
			$display("ERROR ON ADDI Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		//CHECK OP CODE ADDU
		op = ADDU;
		// Max int + 1
		#50
		a = 65535; 
		b = 1; 
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON ADDU Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		
		
		
		
		// @TODO Not sure about the I functions
		// @TODO Check implementation
		op = ADDUI;
		// Max int + 0 immediate
		a = 0; 
		b = 16'b0000000001111111; // max immediate value
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON ADDUI Test 1 Flags");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		if (y != 16'b0000000001111111)
			begin
			$display("ERROR ON ADDUI Test 1 Y value");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
			
		// Check for flags overflow
		#50
		a = 1;  
		b = 16'b0111111111111111; // max positive number
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON ADDUI Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		#50
		// Check the carry flag
		// Max int + 1
		op = ADDC;
		a = 16'b0111111111111111; // max int 
		b = 1;

		c = 1'b0;
		#20;
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00100) // Z C F L N
			begin
			$display("ERROR ON ADDC Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		#50
		// min int + (-1)
		a = 16'b1000000000000000; 
		b = 16'b1111111111111111; 
		#20;
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b01100) // Z C F L N
			begin
			$display("ERROR ON ADDC Test 2");

			$display("%d", $signed(y));
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end

		#50
		// max int  + 1 

		// Should generate a Zero and a Carry bit
		op = ADDCU;
		a = 16'b1111111111111111; 
		b = 1; 
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b11000) // Z C F L N
			begin
			$display("ERROR ON ADDCU Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

		#50
		op = ADDCUI;
		// Max int + 0 immediate
		a = 0; 
		b = 16'b0000000001111111; // max immediate value
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON ADDCUI Test 1 flagsTest");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		if (y != 16'b0000000001111111)
			begin
			$display("ERROR ON ADDCUI Test 1 y value");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
			
		// Check for flags overflow, max int + 1
		#50
		a = 1;  
		b = 16'b0111111111111111; // max positive number
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON ADDCUI Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		#50
		op = SUB;
		// Test zero flag
		// 1 - 1
		a = 1;
		b = 1;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON SUB Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		//Max negative - 1

		// Should generate a borrow bit (Carry), not overflow, since 
		#50
		a = 16'b1000000000000000;
		b = 1;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b01100) // Z C F L N
			begin
			$display("ERROR ON SUB Test 2");

			$display("%d", $signed(y));
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end
			
		//Max positive - (-1)
		#50
		a = 16'b0111111111111111;
		b = -1;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00100) // Z C F L N
			begin
			$display("ERROR ON SUB Test 3");

			// SHould not generate a carry.

			$display("%d", $signed(y));
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end

		#50
		op = SUBI;
		#10
		// 1 - max neg immediate
		a = 1; 
		b = 16'b1111111110000000; //max neg number

		//$display($signed(b));
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON SUBI Test 1 FLAGS");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end
		if (y != 16'b0000000010000001)
			begin
			$display("ERROR ON SUBI Test 1 y value");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end
		#50
		// Test  0 + most negative number
		a = 0; 
		b = 16'b1111111110000000;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON SUBI Test 2 FLAGS");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end
		if (y != 16'b0000000010000000)
			begin
			$display("ERROR ON SUBI Test 2 y value");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end
		
		// Check for flags overflow, max negative - 1
		#50
		a = 1;  
		b = 16'b1000000000000000; // max neg number
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;
		//$display($signed(y));
      if (flagTests != 5'b00100) // Z C F L N)
			begin
			$display("ERROR ON SUBI Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", $signed(a), $signed(b), op, C, L, F, Z, N, $time );
			end

		
		
		
		#50
		op = CMP; 
		// set zero flag is result is zero (I.E. equal comparison)
		a = 1;
		b = 1;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON CMP Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		#50
		// After comparison of equal numbers, check that the zero flag was cleared for the next tests
		op = CMP;
		a = 1;
		b = 1;
		#10
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON CMP Test 1 Clear Zero");

			$display("%b", y);
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// Reset op to CMP for next tests
		#50
		op = CMP;
		a = 0;
		b = 1;
		#10;
		// N bit should also be set for only signed if Rdest is less than y 
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00001) // Z C F L N
			begin
			$display("ERROR ON CMP Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// If A > B, no flags set
		a = 16'b0111111111111111; // most positive
		b = 16'b1000000000000000; // most negative
		#10;
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON CMP Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

		op = CMPI;
		// set zero flag is result is zero (I.E. equal comparison)
		a = 16'b0000000001111111; // max positive I value
		b = 16'b0000000001111111; // max positive I value
		#50
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON CMPI Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		//  N is set if Rdest operand (a) is less than y
		a = 0;
		b = 1;
		#50;
	 
		// N bit should also be set for only signed if Rdest is less than y 
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00001) // Z C F L N
			begin
			$display("ERROR ON CMPI Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end 
		
		
		// If A > B, no flags set
		a = 16'b0000000001111111; // max positive I value
		b = 0; // 
		#50
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON CMPI Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		op = CMPUI;
		// set zero flag is result is zero (I.E. equal comparison)
		a = 16'b0000000001111111; // max positive I value
		b = 16'b0000000001111111; // max positive I value
		#50
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b10000) // Z C F L N
			begin
			$display("ERROR ON CMPUI Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// L is set if Rdest operand (a) is less than y
		a = 0;
		b = 1;
		#50
	 
		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00010) // Z C F L N
			begin
			$display("ERROR ON CMPUI Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end 
		
		
		// If A > B, no flags set
		a = 16'b0000000001111111; // max positive I value
		b = 0; // 
		#50

		flagTests[4] = Z;flagTests[3] = C;flagTests[2] = F;flagTests[1] = L;flagTests[0] = N;

      if (flagTests != 5'b00000) // Z C F L N
			begin
			$display("ERROR ON CMPUI Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		op = AND;
		a = 16'b0000000000000001;
		b = 16'b0000000000000001;
		#50
		if (y != 16'b0000000000000001) 
			begin
			$display("ERROR ON AND Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b0111111111111111; // max int
		b = 16'b1000000000000000; // min int
		#50

		
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON AND Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

			
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		#50
		if (y != 16'b1111111111111111) 
			begin
			$display("ERROR ON AND Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		a = 16'b1111111111111111;
		b = 16'b0000000000000000;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON AND Test 4");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

		op = OR;
		// Test basic functinality
		a = 16'b0000000000000001;
		b = 16'b0000000000000001;
		#50
		if (y != 16'b0000000000000001) 
			begin
			$display("ERROR ON OR Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b0111111111111111; // max int
		b = 16'b1000000000000000; // min int
		#50
		if (y != 16'b1111111111111111) 
			begin
			$display("ERROR ON OR Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		#50
		if (y != 16'b1111111111111111) 
			begin
			$display("ERROR ON OR Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		a = 16'b0000000000000000;
		b = 16'b0000000000000000;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON OR Test 4");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		op = XOR; //different is 1
		// @TODO Test basic functinality	
		a = 16'b0000000000000001;
		b = 16'b0000000000000001;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON XOR Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b0111111111111111; // max int
		b = 16'b1000000000000000; // min int
		#50
		if (y != 16'b1111111111111111) 
			begin
			$display("ERROR ON XOR Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON XOR Test 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

			
		a = 16'b0000000000000000;
		b = 16'b0000000000000000;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON XOR Test 4");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		op = NOT;
		// Test basic functinality
		a = 16'b0000000000000000;
		b = 0;
		#50
		if (y != 16'b1111111111111111) 
			begin
			$display("ERROR ON NOT Test 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b1111111111111111;
		b = 0;
		#50
		if (y != 16'b0000000000000000) 
			begin
			$display("ERROR ON NOT Test 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		op = LSH;
		// Check that the result is multiplied by 2
		a = 16'b0000000000000001;
		b = 0; // doesn't matter
		#50
      if (y != 16'b0000000000000010)
			begin
			$display("ERROR ON LSH TEST 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// check to see if it goes to zero
		a = 16'b1000000000000000;
		b = 0; // doesn't matter
		#50
		
      if (y != 16'b0000000000000000)
			begin
			$display("ERROR ON LSH TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end

			
		op = LSHI;
		// @TODO Check that the result is multiplied by 2
		a = 16'b0000000000000001;
		b = 15; // 15 shifts
		#50

      if (y != 16'b1000000000000000)
			begin
			$display("ERROR ON LSHI TEST 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// check to see if it goes to zero
		a = 16'b1000000000000000;
		b = 0; // shift zero times
		#50

      if (y != 16'b1000000000000000)
			begin
			$display("ERROR ON LSHI TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end		
			
		op = RSH;
		// Check that the result is divided by 2
		a = 16'b1000000010000000;
		b = 0; // doesn't matter
		#50

      if (y != 16'b0100000001000000)
			begin
			$display("ERROR ON RSH TEST 1");

			$display("%b", y);
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// check to see if it goes to zero
		a = 16'b0000000000000001;
		b = 0; // doesn't matter
		#50

      if (y != 16'b0000000000000000)
			begin
			$display("ERROR ON RSH TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
	
		op = RSHI;
		//  Shift 15 times, check if is result zero
		a = 16'b1000000000000000;
		b = 15; // 15 shifts
		#50

      if (y != 16'b0000000000000001)
			begin
			$display("ERROR ON RSHI TEST 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		// check to see if it goes to zero
		a = 16'b1000000000000000;
		b = 0; // shift zero times
		#50

      if (y != 16'b1000000000000000)
			begin
			$display("ERROR ON RSHI TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		op = ALSH;
		// @TODO Check that the result is multiplies by 2
		a = 16'b1000000000000001;
		b = 15;
		#50
		
		if (y != 16'b1000000000000000)
			begin
			$display("ERROR ON ALSH TEST 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b1000000000000001;
		b = 14;
		#50
		
		if (y != 16'b1100000000000000)
			begin
			$display("ERROR ON ALSH TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b0111111111111111;
		b = 15;
		#50
		
		if (y != 16'b0000000000000000)
			begin
			$display("ERROR ON ALSH TEST 3");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		a = 16'b0101010111001111;
		b = 7;
		#50
		
		if (y != 16'b0110011110000000)
			begin
			$display("ERROR ON ALSH TEST 4");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
		
		op = ARSH;
		a = 16'b1000000000000000;
		b = 15;
		#50
		
		if (y != 16'b1111111111111111)
			begin
			$display("ERROR ON ARSH TEST 1");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
			
		a = 16'b0111111111111111;
		b = 15;
		#50
		
		if (y != 16'b0000000000000000)
			begin
			$display("ERROR ON ARSH TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end
			
		a = 16'b0101010111001111;
		b = 7;
		#50
		
		if (y != 16'b0000000010101011)
			begin
			$display("ERROR ON ARSH TEST 2");
			$display("A: %0d, B: %0d, OPCODE: %0d, C: %0d, L: %0d, F: %0d, Z: %0d, N: %0d, time:%0d", a, b, op, C, L, F, Z, N, $time );
			end


	end
      
endmodule

