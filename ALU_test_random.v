`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module: ALU_random_test
// Description: This test performs 10 random tests per operation, displays errors
//      when they occur, but does not print information for each operation unless there is an error.
//      Waveform is a secondary form of verification.
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_random_test;

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

		.c(c),
		.a(a), 
		.b(b), 
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
	
	integer i,j; //ForLoop Counter

	integer codes[22:0];

	reg Imm;

	reg Shift;

	reg [15:0] temp;

	reg C2, F2, L2, N2, Z2;

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
		Imm = 1'b0;
		Shift = 1'b0;
		temp = 0;
		C2 = 0; F2 = 0; L2 = 0; N2 = 0; Z2 = 0;
		// Wait 10 ns for global reset to finish
		#10;
		
		// Randomized Testing
		// Iterate through each operation code
		for(j=0; j<23; j=j+1) begin
			op = codes[j];
			Imm = 1'b0;
			Shift = 1'b0;
			// Display the operation for debugging purposes:  If there is a problem in the simulation,
			// more information will be displayed.  Since these display statements look alike, the operation
			// printed above the error display will allow for faster debugging.
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

			// perform 10 random tests per operation code
			for(i=0; i<10; i=i+1)
				begin
				temp = 0;
				C2 = 0; F2 = 0; L2 = 0; N2 = 0; Z2 = 0;
				c = 1'b0;
				// set the input carry to 1 on the second 5 tests
				if (i >= 5) c = 1'b1;
				#20;
				a = $signed($random) % (2**16);
				// If the instruction is an immediate instruction, only generate an 8-bit value
				if (Imm == 1'b1) b = $random % (2**8);
				// if the instruction is a shift instruction, only generate a 4-bit value
				else if (Shift == 1'b1) b = $unsigned($random) % (2**4);
				// otherwise if the instruction is anything else, generate a 16-bit value
				else b = $signed($random) % (2**16);
				//op = $random % (2**8);
				// generate expected results for the flags and the result bit-vector
				case (op)
					ADD: begin
						{C2, temp} = $signed(a) + $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (a[15] == b[15] && temp[15] != b[15]) F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					ADDI: begin
						{C2, temp} = $signed(a) + $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (a[15] == b[15] && temp[15] != b[15]) F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					ADDC:begin
						{C2, temp} = {c,a} + b;
						#10;
						if (temp == 0) Z2 = 1;
						if (a[15] == b[15] && temp[15] != b[15]) F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					ADDCI:begin
						{C2, temp} = {c,a} + b;
						#10;
						if (temp == 0) Z2 = 1;
						if (a[15] == b[15] && temp[15] != b[15]) F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					ADDU:begin
						// unsigned addition
						temp = $unsigned(a) + $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($unsigned({C2, temp}) != $unsigned({C, y}) || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, {C, y}, y, C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $unsigned({C2, temp}), $unsigned(temp), C2, F2, Z2, L2, N2); end
						end
					ADDUI:begin
						// unsigned addition
						{C2, temp} = $unsigned(a) + $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($unsigned({C2, temp}) != $unsigned({C, y}) || Z2 != Z) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, {C, y}, y, C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $unsigned({C2, temp}), $unsigned(temp), C2, F2, Z2, L2, N2); end
						end
					ADDCU:begin
						// unsigned addition
						{C2, temp} = $unsigned({c,a}) + $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($unsigned({C2, temp}) != $unsigned({C, y})) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, {C, y}, y, C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					ADDCUI:begin
						// unsigned addition
						{C2, temp} = $unsigned({c,a}) + $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($unsigned({C2, temp}) != $unsigned({C, y})) begin
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, {C, y}, y, C, F, Z, L, N);
							$display("{C2, temp}: %d, temp: %d, C2: %d, F2: %d, Z2: %d, L2: %d, N2: %d", $signed({C2, temp}), $signed(temp), C2, F2, Z2, L2, N2); end
						end
					SUB:begin
						// subtraction is always signed
						{C2, temp} = $signed(a) - $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (((a[15] == b[15]) && (y[15] != b[15])) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
							F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || C2 != C) begin
							$display("%b %b", C2, F2);
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N); end
						end
					SUBI:begin
						// subtraction is always signed
						{C2, temp} = $signed(a) - $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (((a[15] == b[15]) && (y[15] != b[15])) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
							F2 = 1;
						if ($signed({C2, temp}) != $signed({C, y}) || F2 != F || Z2 != Z) begin
							$display("%b %b", C2, F2);
							$display("A: %d, B: %d, {C, y}: %d, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", $signed(a), $signed(b), $signed({C, y}), $signed(y), C, F, Z, L, N); end
						end
					LSH: begin
						temp = a << 1;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, y: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, y, C, F, Z, L, N);
						end
					RSH: begin
						temp = a >> 1;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, y: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, y, C, F, Z, L, N);
						end
					NOT: begin
						temp = ~a;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, y: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, y, C, F, Z, L, N);
						end
					AND: begin
						temp = a & b;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					OR: begin
						temp = a | b;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					XOR: begin
						temp = a ^ b;
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					LSHI: begin
						temp = a << $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					RSHI: begin
						temp = a >> $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					ALSH: begin
						temp = {a[15], a[14:0] <<< $unsigned(b)};
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z)
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					ARSH: begin
						temp = $signed(a) >>> $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if (temp != y || Z2 != Z) begin
							$display("A: %b, B: %b, y, %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N); end
						end
					CMP: begin
						temp = $signed(a) - $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($signed(a) < $signed(b)) N2 = 1;
						if (temp != y || Z2 != Z || N2 != N)
							$display("A: %b, B: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, C, F, Z, L, N);
						end
					CMPI: begin
						temp = $signed(a) - $signed(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($signed(a) < $signed(b)) N2 = 1;
						if (temp != y || Z2 != Z || N2 != N)
							$display("A: %b, B: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, C, F, Z, L, N);
						end
					CMPUI: begin
						temp = $unsigned(a) - $unsigned(b);
						#10;
						if (temp == 0) Z2 = 1;
						if ($unsigned(a) < $unsigned(b)) L2 = 1;
						if (temp != y || Z2 != Z || L2 != L)
							$display("A: %b, B: %b, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, C, F, Z, L, N);
						end
					default: begin
						// This case should never happen
						$display("Else Case occurred");
						$display("A: %b, B: %b, y: %d, C: %d, F: %d, Z: %d, L: %d, N: %d", a, b, y, C, F, Z, L, N);
						end
					endcase

				end // ends the for loop for i
			end // ends the for loop for j

		end // ends the initial begin
endmodule

