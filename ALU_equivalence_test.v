`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// Module Name: ALU_Miter_test_random
// Description: runs the random tests on both the behavioral and synthesized models
//      of the ALU for comparison.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Miter_test_random;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg c;
	reg [7:0] op;

	// Outputs
	wire [15:0] y1;
	wire [15:0] y2;
	wire [4:0] flags1;
	wire [4:0] flags2;

	// Instantiate the Unit Under Test (UUT)
	equiv_check uut (
		.a1(a), 
		.a2(a),
		.b1(b), 
		.b2(b),  
		.c1(c),
		.c2(c),  
		.op1(op), 
		.op2(op),
		.y1(y1), 
		.y2(y2), 
		.flags1(flags1), 
		.flags2(flags2)
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
	
	integer i,j; //ForLoop Counter
	integer codes[22:0];
	reg Imm;
	reg Shift;

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
		a = 0;
		b = 0;
		c = 0;
		op = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here
		for(j=0; j<23; j=j+1) begin
			op = codes[j];
			Imm = 1'b0;
			Shift = 1'b0;
			case(op)
				ADD: $display("ADD");
				ADDI: begin $display("ADDI"); Imm = 1'b1; end
				ADDU: $display("ADDU");
				ADDUI: begin $display("ADDUI"); Imm = 1'b1; end
				ADDC: $display("ADDC");
				ADDCU: $display("ADDCU");
				ADDCUI: begin $display("ADDCUI"); Imm = 1'b1; end
				ADDCI: begin $display("ADDCI"); Imm = 1'b1; end
				SUB: $display("SUB");
				SUBI: begin $display("SUBI"); Imm = 1'b1; end
				CMP: $display("CMP");
				CMPI: begin $display("CMPI"); Imm = 1'b1; end
				CMPUI: begin $display("CMPUI"); Imm = 1'b1; end
				AND: $display("AND");
				OR: $display("OR");
				XOR: $display("XOR");
				NOT: $display("NOT");
				LSH: $display("LSH");
				LSHI: begin $display("LSHI"); Shift = 1'b1; end
				RSH: $display("RSH");
				RSHI: begin $display("RSHI"); Shift = 1'b1; end
				ALSH: begin $display("ALSH"); Shift = 1'b1; end // This is just to show that the Arithmetic Shifts work as desired, but it will work with any 16 bit number
				ARSH: begin $display("ARSH"); Shift = 1'b1; end // This is just to show that the Arithmetic Shifts work as desired, but it will work with any 16 bit number
			endcase
				for(i=0; i<20; i=i+1) begin
					// set the input carry to 1 on the second 5 tests
					if (i >= 5) c = 1'b1;
					a = $signed($random) % (2**16);
					if (Imm == 1'b1) b = $random % (2**8);
					else if (Shift == 1'b1) b = $unsigned($random) % (2**4);
					else b = $signed($random) % (2**16);
					#20;
					if (y1 != y2 || flags1 != flags2) begin
						$display("A: %b, B: %b, y1: %b, y2: %b, flags1: %b, flags2: %b", a, b, y1, y2, flags1, flags2);
					end
				end
		end
	end
      
endmodule

