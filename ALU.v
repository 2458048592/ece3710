`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineers: Plan B
// 
// Create Date:    15:55:46 08/29/2013 
// Design Name: 
// Module Name:    ALU 
// Project Name: Lab 1
// Target Devices: Nexys 3
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	 input c,
    input signed [15:0] a,
    input signed [15:0] b,
	 input [7:0] op,
    output reg [15:0] y,
    output reg C, L, F, Z, N
    );
	 
	 // ADD, ADDI, ADDU, ADDUI, ADDC, ADDCU, ADDCUI, ADDCI
	 // SUB, SUBI, CMP, CMPI, CMPU/I, AND, OR, XOR, NOT
	 // LSH, LSHI, RSH, RSHI, ALSH, ARSH, NOP/WAIT
	 
	 parameter ADD = 8'b00000101;
	 parameter ADDI = 8'b0101xxxx;
	 parameter ADDU = 8'b00000110;
	 parameter ADDUI = 8'b0110xxxx;
	 parameter ADDC = 8'b00000111;
	 parameter ADDCU = 8'b00000100;
	 parameter ADDCUI = 8'b1010xxxx; // Replaces SUBCI
	 parameter ADDCI = 8'b0111xxxx;
	 parameter SUB = 8'b00001001;
	 parameter SUBI = 8'b1001xxxx;
	 parameter CMP = 8'b00001011;
	 parameter CMPI = 8'b1011xxxx;
	 parameter CMPUI = 8'b1110xxxx; // Replaces MULI
	 parameter AND = 8'b00000001;
	 parameter OR = 8'b00000010;
	 parameter XOR = 8'b00000011;
	 parameter NOT = 8'b00001111;
	 parameter LSH = 8'b10000100; 
	 parameter LSHI = 8'b10000000; // Imm is unsigned
	 parameter RSH = 8'b10001100;
	 parameter RSHI = 8'b10000001; // Imm is unsigned
	 parameter ALSH = 8'b10000101; // Interprets RSrc as Unsigned
	 parameter ARSH = 8'b10001101; // Interprets RSrc as Unsigned
	
	always @ (*) begin
		C = 0; L = 0; F = 0; Z = 0; N = 0; y = 0;
		casex(op)
			ADD: 
				begin
					// Signed
					{C, y} = a + b;
					if (a[15] == b[15] && y[15] != b[15])
						F = 1;
				end
			ADDI: 
				begin
					{C, y} = a + b; // a is Rdest, b contains imm
					if (a[15] == b[15] && y[15] != b[15])
						F = 1;
				end
			ADDU:
				begin 
					// Unsigned
					y = $unsigned(a) + $unsigned(b);
				end
			ADDUI: 
				begin
					{C, y} = $unsigned(a) + $unsigned(b);
				end
			ADDC: 
				begin
					{C, y} = b + a + {c, 16'b0};
					if (a[15] == b[15] && y[15] != b[15])
						F = 1;
				end
			ADDCU: 
				begin
					{C, y} = $unsigned(b) + $unsigned({c, a});
				end
			ADDCUI: 
				begin
					{C, y} = $unsigned(b) + $unsigned({c, a});
				end
			ADDCI: 
				begin
					{C, y} = b + {c, a};
					if (a[15] == b[15] && y[15] != b[15])
						F = 1;
				end
			SUB: 
				begin
					{C, y}  = a - b;
					if (((a[15] == b[15]) && (y[15] != b[15]) && y!= 0) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
						F = 1;
				end
			SUBI: 
				begin
					{C, y} = a - b;
					if (((a[15] == b[15]) && (y[15] != b[15]) && y!= 0) || (~(a[15]) && b[15] && y[15]) || (a[15] && ~(b[15]) && ~(y[15])))
						F = 1;
				end
			CMP: 
				begin
					y = a - b;
					if (y == 0)
						Z = 1;
					if (a < b)
						N = 1; 					
				end
			CMPI: 
				begin
					y = a - b;
					if (y == 0)
						Z = 1;
					if (a < b)
						N = 1;	
				end
			CMPUI: 
				begin
					y = $unsigned(a) - $unsigned(b);
					if (y == 0)
						Z = 1;
					if ($unsigned(a) < $unsigned(b))
						L = 1;
				end
			AND: 
				begin
					y = a & b;
				end
			OR: 
				begin
					y = a | b;
				end
			XOR: 
				begin
					y = a ^ b;
				end
			NOT: 
				begin
					y = ~a;
				end
			LSH:
				begin
					y = a << 1;
				end
			LSHI: 
				begin
					y = a << $unsigned(b[3:0]);			
				end
			RSH: 
				begin
					y = a >> 1;					
				end
			RSHI: 
				begin
					y = a >> $unsigned(b[3:0]);							
				end
			ALSH:
				begin
					y = {a[15], a[14:0] <<< $unsigned(b)};		
				end
			ARSH: 
				begin
					y = a >>> $unsigned(b);				
				end
			default: 
				begin 
					y = 0;
				end
		endcase
		if (y == 0)
			Z = 1;
		
	end

endmodule
