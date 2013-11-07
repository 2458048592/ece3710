`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name:    controller 
// Description: controller turns the 8-bit Imm value into a 16-bit immediate value
//      Signed instructions will have a sign-extended immediate value, Unsigned
//      instructions will have eight 0's added to Imm[15:8].  LUI will shift the
//		  8-bit Imm value up to Imm[15:8] and add eight 0's to fill Imm[7:0].
//
//////////////////////////////////////////////////////////////////////////////////
module decoder(
    input [17:0] inst,
    output reg [7:0] op,
	 output reg [15:0] Imm, // Imm needs to be sign-extended or 0-extended when applicable
	 output reg selectImm, selectResult, w1, //e1,
	 output reg [3:0] memAddr,
	 output reg [3:0] readRegA,
	 output reg [3:0] readRegB,
	 output reg [3:0] loadReg
    );
	
	parameter RTYPE = 4'b0000;
	//parameter ADD_0 = 4'b0000; 
	parameter ADD_1 = 4'b0101;
	parameter ADDI = 4'b0101;
	//parameter ADDU_0 = 4'b0000;
	parameter ADDU_1 = 4'b0110;
	parameter ADDUI = 8'b0110;
	//parameter ADDC_0 = 4'b0000;
	parameter ADDC_1 = 4'b0111;
	//parameter ADDCU_0 = 4'b0000;
	parameter ADDCU_1 = 4'b0100;
	parameter ADDCUI = 4'b1010; // Replaces SUBCI
	parameter ADDCI = 4'b0111;
	//parameter SUB_0 = 4'b0000;
	parameter SUB_1 = 4'b1001;
	parameter SUBI = 4'b1001;
	//parameter CMP_0 = 4'b0000;
	parameter CMP_1 = 4'b1011;
	parameter CMPI = 4'b1011;
	parameter CMPUI = 4'b1110; // Replaces MULI
	//parameter AND_0 = 4'b0000;
	parameter AND_1 = 4'b0001;
	//parameter OR_0 = 4'b0000;
	parameter OR_1 = 4'b0010;
	//parameter XOR_0 = 4'b0000;
	parameter XOR_1 = 4'b0011;
	//parameter NOT_0 = 4'b0000;
	parameter NOT_1 = 4'b1111;
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
	
	parameter MEM = 4'b0100;
	parameter LOAD_1 = 4'b0000;
	parameter STOR_1 = 4'b0100;
	parameter LUI = 4'b1111;
	// MOV_0 = 4'b0000;
	parameter MOV_1 = 4'b1101;
	parameter MOVI = 4'b1101;
	
	//parameter LOAD = 2'b10; // This is a read instruction and reads the value in memory[RAddr] and stores in RDest
	//parameter STOR = 2'b11; // This is a write instruction and writes the value in RDest to memory[RAddr]
	
	// MEM is the opcode, JCOND and SCOND are the secondary codes, JUC through BLE are stored in bits [3:0]
	// JCOND will be absolute memory jumps
	// SCOND will be relative memory jumps
	parameter JCOND = 4'b1100; // JCOND uses unsigned comparison for BEQ through BLT
	//parameter SCOND = 4'b0100; // SCOND is the same as the MEM and is a signed comparison for BEQ through BLE
	parameter JUC = 4'b1110; // JUC jumps directly 
	parameter BEQ = 4'b0000;
	parameter BNEQ = 4'b0001;
	//parameter BGT = 4'b0110;
	//parameter BLT = 4'b0111;
	//parameter BGE = 4'b1101;
	//parameter BLE = 4'b1100;
	
	
	always @ (*) begin
		w1 <= 1'b0;
		selectResult <= 1'b0;
		selectImm <= 1'b0;
		Imm <= 16'b0000000000000000;
		//e1 <= 1'b0;
		op <= 8'b00000000;
		readRegA <= inst[11:8];
		readRegB <= inst[3:0];
		loadReg <= inst[11:8];
		memAddr <= 4'b1010;
		if (inst[17:16] == 2'b00) begin
			case (inst[15:12])
				RTYPE: begin
					case (inst[7:4])
						ADD_1: begin
								op <= {RTYPE, ADD_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						ADDU_1: begin
								op <= {RTYPE, ADDU_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						ADDC_1: begin
								op <= {RTYPE, ADDC_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						ADDCU_1: begin
								op <= {RTYPE, ADDCU_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						SUB_1: begin
								op <= {RTYPE, SUB_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						CMP_1: begin
								op <= {RTYPE, CMP_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						AND_1: begin
								op <= {RTYPE, AND_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						OR_1: begin
								op <= {RTYPE, OR_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						NOT_1: begin
								op <= {RTYPE, NOT_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						XOR_1: begin
								op <= {RTYPE, XOR_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						MOV_1: begin
								op <= {RTYPE, MOV_1};
								readRegA <= inst[3:0];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						default: begin
								op <= {RTYPE, OR_1};
								readRegA <= inst[11:8];
								readRegB <= inst[11:8];
								loadReg <= inst[11:8];
							end
					endcase
				end
				ADDI: begin
						op <= {ADDI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7:0]};
					end
				ADDUI: begin
						op <= {ADDUI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {8'b00000000, inst[7:0]};
					end
				ADDCUI: begin
						op <= {ADDCUI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {8'b00000000, inst[7:0]};
					end
				ADDCI: begin
						op <= {ADDCI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7:0]};
					end
				SUBI: begin
						op <= {SUBI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7:0]};
					end
				CMPI: begin
						op <= {CMPI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7], inst[7:0]};
					end
				CMPUI: begin
						op <= {CMPUI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {8'b00000000, inst[7:0]};
					end
				MOVI: begin
						op <= {MOVI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {8'b00000000, inst[7:0]};
					end
				LUI: begin
						op <= {LUI, inst[7:4]};
						readRegA <= inst[11:8];
						readRegB <= inst[3:0];
						loadReg <= inst[11:8];
						selectImm <= 1'b1;
						Imm <= {inst[7:0], 8'b00000000};
					end
				SHIFT: begin
					case (inst[7:4])
						LSH_1: begin
								op <= {SHIFT, LSH_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						LSHI_1: begin
								op <= {SHIFT, LSHI_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
								selectImm <= 1'b1;
								Imm <= {12'b000000000000, inst[3:0]};
							end
						RSH_1: begin
								op <= {SHIFT, RSH_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						RSHI_1: begin
								op <= {SHIFT, RSHI_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
								selectImm <= 1'b1;
								Imm <= {12'b000000000000, inst[3:0]};
							end
						ALSH_1: begin
								op <= {SHIFT, ALSH_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						ARSH_1: begin
								op <= {SHIFT, ARSH_1};
								readRegA <= inst[11:8];
								readRegB <= inst[3:0];
								loadReg <= inst[11:8];
							end
						default: begin
								op <= {RTYPE, OR_1};
								readRegA <= inst[11:8];
								readRegB <= inst[11:8];
								loadReg <= inst[11:8];
							end
					endcase
				end
				MEM: begin
					// LOAD and STOR take two cycles to complete, so duplicate the LOAD instruction, and use
					// a NOP instruction on the STOR instruction
					case (inst[7:4])
						LOAD_1: begin
							// LOAD takes the value stored in mem[RAddr] and loads it into RDest
							// where RAddr = inst[3:0] and RDest = inst[11:8]
							op <= {RTYPE, OR_1};
							memAddr <= inst[3:0];
							readRegA <= inst[3:0];
							readRegB <= inst[3:0];
							loadReg <= inst[11:8];
							// selectResult selects the value out of the memory
							selectResult <= 1'b1;
							//e1 <= 1'b1;
						end
						STOR_1: begin
							// STOR takes the value stored in RDest and stores it in mem[RAddr]
							// where RAddr = inst[11:8] and RDest = inst[3:0]
							op <= {RTYPE, OR_1};
							memAddr <= inst[11:8];
							readRegA <= inst[3:0];
							readRegB <= inst[3:0];
							loadReg <= inst[11:8];
							w1 <= 1'b1;
							//e1 <= 1'b1;
						end
						JCOND: begin
							// These should all essentially be the same
							memAddr <= inst[11:8];
							case (inst[3:0])
								JUC: begin
									// get the address out of inst[11:8] and throw it up to the PC counter
									op <= {RTYPE, OR_1};
									readRegA <= inst[11:8];
									readRegB <= inst[11:8];
									loadReg <= inst[11:8];
								end
								BEQ: begin
									// Check the flags after a CMP operation
									// get the address out of inst[11:8] and throw it up the PC counter if
									// Z <= 1
								
									op <= {RTYPE, OR_1};
									readRegA <= inst[11:8];
									readRegB <= inst[11:8];
									loadReg <= inst[11:8];
								end
								BNEQ: begin
									// Check the flags after a CMP operation
									// get the address out of inst[11:8] and throw it up to the PC counter if
									// Z <= 0;
								
									op <= {RTYPE, OR_1};
									readRegA <= inst[11:8];
									readRegB <= inst[11:8];
									loadReg <= inst[11:8];
								end
								default: begin
									op <= {RTYPE, OR_1};
									readRegA <= inst[11:8];
									readRegB <= inst[11:8];
									loadReg <= inst[11:8];
								end
							endcase
						end
//						BCOND: begin
//							
//						end
						default: begin
							op <= {RTYPE, OR_1};
							readRegA <= inst[11:8];
							readRegB <= inst[11:8];
							loadReg <= inst[11:8];
						end
					endcase
				end
				default: begin
					op <= {RTYPE, OR_1};
					readRegA <= inst[11:8];
					readRegB <= inst[11:8];
					loadReg <= inst[11:8];
				end
			endcase
		end
		else begin
			case (inst[17:16])
				2'b11: begin
					// might be useful to always load the result into the same register so we can use
					// all 16 bits for the LI.
					op <= {LUI, inst[7:4]};
					readRegA <= inst[11:8];
					readRegB <= inst[11:8];
					loadReg <= inst[11:8];
					selectImm <= 1'b1;
					Imm <= inst[15:0];
				end
				default: begin
					op <= {RTYPE, OR_1};
					readRegA <= inst[11:8];
					readRegB <= inst[11:8];
					loadReg <= inst[11:8];
				end
			endcase
		end
	end

endmodule
