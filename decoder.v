`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name:    controller 
//
//////////////////////////////////////////////////////////////////////////////////

/* ** TODO **
	This actually needs to be fixed for a 5-bit loadReg.  I forgot to use our optimization
	that allows us to not write to the Regfile for Nop Instructions.  In addition, we need
	a strategy for dealing with LW (load word) and SW (store word) instructions, and likely
	will want LI (load immediate) and SI (store immediate) instructions.  Once I figure these
	out, I will email everyone.
*/
module decoder(
    input [15:0] inst,
    output reg [7:0] op, Imm,
	 output reg selectImm,
	 output reg [3:0] readRegA,
	 output reg [3:0] readRegB,
	 output reg [3:0] loadReg
    );

	// R-Type instructions
	parameter RTYPE = 4'b0000;
	//parameter ADD_0 = 4'b0000; 
	parameter ADD_1 = 4'b0101;
	//parameter ADDU_0 = 4'b0000;
	parameter ADDU_1 = 4'b0110;
	//parameter ADDC_0 = 4'b0000;
	parameter ADDC_1 = 4'b0111;
	//parameter ADDCU_0 = 4'b0000;
	parameter ADDCU_1 = 4'b0100;
	//parameter SUB_0 = 4'b0000;
	parameter SUB_1 = 4'b1001;
	//parameter CMP_0 = 4'b0000;
	parameter CMP_1 = 4'b1011;
	//parameter AND_0 = 4'b0000;
	parameter AND_1 = 4'b0001;
	//parameter OR_0 = 4'b0000;
	parameter OR_1 = 4'b0010;
	//parameter XOR_0 = 4'b0000;
	parameter XOR_1 = 4'b0011;
	//parameter NOT_0 = 4'b0000;
	parameter NOT_1 = 4'b1111;
	
	// I-Type instructions
	parameter ADDI = 4'b0101;
	parameter ADDUI = 8'b0110;
	parameter ADDCUI = 4'b1010; // Replaces SUBCI
	parameter ADDCI = 4'b0111;
	parameter SUBI = 4'b1001;
	parameter CMPI = 4'b1011;
	parameter CMPUI = 4'b1110; // Replaces MULI
	
	// Shift instructions
	parameter SHIFT = 4'b1000;
	//parameter LSH_0 = 4'b1000;
	parameter LSH_1 = 4'b0100; 
	//parameter LSHI_0 = 4'b1000;
	parameter LSHI_1 = 4'b0000; // Imm is unsigned
	//parameter RSH_0 = 4'b1000;
	parameter RSH_1 = 4'b1100;
	//parameter RSHI_0 = 4'b1000;
	parameter RSHI_1 = 4'b0001; // Imm is unsigned
	//parameter ALSH_0 = 4'b1000;
	parameter ALSH_1 = 4'b0101; // Interprets RSrc as Unsigned
	//parameter ARSH_0 = 4'b1000;
	parameter ARSH_1 = 4'b1101; // Interprets RSrc as Unsigned

	always begin
		case (inst[15:12])
			RTYPE: begin
				case (inst[7:4])
					ADD_1: begin
							op = {RTYPE, ADD_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					ADDU_1: begin
							op = {RTYPE, ADDU_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					ADDC_1: begin
							op = {RTYPE, ADDC_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					ADDCU_1: begin
							op = {RTYPE, ADDCU_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					SUB_1: begin
							op = {RTYPE, SUB_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					CMP_1: begin
							op = {RTYPE, CMP_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					AND_1: begin
							op = {RTYPE, ADD_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					OR_1: begin
							op = {RTYPE, OR_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					NOT_1: begin
							op = {RTYPE, NOT_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					XOR_1: begin
							op = {RTYPE, XOR_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					default: begin
							op = {ADDI, inst[7:4]};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b1;
							Imm = 8'b00000000;
						end
				endcase
			end
			ADDI: begin
					op = {ADDI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			ADDUI: begin
					op = {ADDUI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			ADDCUI: begin
					op = {ADDCUI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			ADDCI: begin
					op = {ADDCI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			SUBI: begin
					op = {SUBI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			CMPI: begin
					op = {CMPI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			CMPUI: begin
					op = {CMPUI, inst[7:4]};
					readRegA = inst[11:8];
					readRegB = inst[3:0];
					loadReg = inst[11:8];
					selectImm = 1'b1;
					Imm = inst[7:0];
				end
			SHIFT: begin
				case (inst[7:4])
					LSH_1: begin
							op = {SHIFT, LSH_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					LSHI_1: begin
							op = {SHIFT, LSHI_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b1;
							Imm = {4'b0000, inst[3:0]};
						end
					RSH_1: begin
							op = {SHIFT, RSH_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					RSHI_1: begin
							op = {SHIFT, RSHI_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b1;
							Imm = {4'b0000, inst[3:0]};
						end
					ALSH_1: begin
							op = {SHIFT, ALSH_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					ARSH_1: begin
							op = {SHIFT, ARSH_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b0;
							Imm = 8'b00000000;
						end
					default: begin
							op = {SHIFT, RSH_1};
							readRegA = inst[11:8];
							readRegB = inst[3:0];
							loadReg = inst[11:8];
							selectImm = 1'b1;
							Imm = 8'b00000000;
						end
				endcase
				end
			default: begin 
				op = {ADDI, inst[7:4]};
				readRegA = inst[11:8];
				readRegB = inst[3:0];
				loadReg = inst[11:8];
				selectImm = 1'b1;
				Imm = 8'b00000000;
			end
		endcase
	end

endmodule
