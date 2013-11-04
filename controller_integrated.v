`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name:    controller_integrated 
//
//////////////////////////////////////////////////////////////////////////////////
module controller_integrated(
	input CLK, CLR,
	input [17:0] inst, external_din,
	output w1,  // w1 is writeToMemory
	output [15:0] addr1, // A[14:0] is addr1 for the memory module
	output [17:0] data1,
	output [4:0] FLAGS,
	output [15:0] B, aluOut, // for debugging
	output PC_inc, JAddrSelect

    );
	 	 
	// wire [15:0] A, B, aluOut;
	 wire [7:0] OP;
	 //wire [15:0]
	 
	 instruction_FSM controller( CLK, CLR, inst[15:0], FLAGS, PC_inc, JAddrSelect);
	 
	 ALU _alu(FLAGS[4], addr1, B, OP, aluOut, FLAGS[4], FLAGS[3], FLAGS[2], FLAGS[1], FLAGS[0]);


	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg;
	wire selectImm, selectResult;
	
	decoder _decoder(inst, OP, Imm, selectImm, selectResult, w1, readRegA, readRegB, loadReg);
	
	//wire [15:0] result;
	wire [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out;
	reg [15:0] enWrite, reset;
	
	RegFile _regfile(CLK, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1,
							 data1, enWrite, reset, r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out);
	
	mux16_to_1_16bit ASelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegA, addr1);
	
	
	wire [15:0] RegB;
	mux16_to_1_16bit BSelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegB, RegB);


	mux2_to_1_16bit ImmMux(RegB, Imm, selectImm, B);
	mux2_to_1_16bit ResultMux(aluOut, external_din[15:0], selectResult, data1);

	always @ (*) begin
		if (CLR == 1'b1) begin reset <= 16'b1111111111111111; enWrite <= 16'b0; end
		else begin
			// loadReg is a 5-bit address/enable vector.  The lower four
			// bits indicate the address of the register to be enabled, but the
			// MSB indicates whether writing is enabled.  This MSB is active-Low,
			// meaning that when it is low, writing is enabled for the register
			// addressed by the lower 4 bits.  When it is high, writing is disabled.
			// This decision was for ease of reading and implementation.
			case(loadReg) // decodes which register to enable
				0: begin enWrite <=  16'b0000000000000001; reset <= 16'b0; end
				1: begin enWrite <=  16'b0000000000000010; reset <= 16'b0; end
				2: begin enWrite <=  16'b0000000000000100; reset <= 16'b0; end
				3: begin enWrite <=  16'b0000000000001000; reset <= 16'b0; end
				4: begin enWrite <=  16'b0000000000010000; reset <= 16'b0; end
				5: begin enWrite <=  16'b0000000000100000; reset <= 16'b0; end
				6: begin enWrite <=  16'b0000000001000000; reset <= 16'b0; end
				7: begin enWrite <=  16'b0000000010000000; reset <= 16'b0; end
				8: begin enWrite <=  16'b0000000100000000; reset <= 16'b0; end
				9: begin enWrite <=  16'b0000001000000000; reset <= 16'b0; end
				10: begin enWrite <= 16'b0000010000000000; reset <= 16'b0; end
				11: begin enWrite <= 16'b0000100000000000; reset <= 16'b0; end
				12: begin enWrite <= 16'b0001000000000000; reset <= 16'b0; end
				13: begin enWrite <= 16'b0010000000000000; reset <= 16'b0; end
				14: begin enWrite <= 16'b0100000000000000; reset <= 16'b0; end
				15: begin enWrite <= 16'b1000000000000000; reset <= 16'b0; end
				default: begin enWrite <= 16'b0; reset <= 16'b0; end
			endcase
		end
	end
endmodule

// This module contains the necessary logic for stalling for memory operations and selecting
// the correct address based on the FLAGS status following a CMP operation
// Remember: The address for JCond is an absolute memory location.  This will get pulled out of A and pushed
// through a mux with the JAddrSelect mux signal which will select the original PC
// address, or the new Jump/Branch address.
// Currently, Jump and Branch doesn't remember the previous address.
module instruction_FSM ( CLK, CLR, inst, FLAGS, PC_inc, JAddrSelect);
	input CLK, CLR;
	input [15:0] inst;
	input [4:0] FLAGS;
	output reg PC_inc, JAddrSelect;
	
	parameter MEM = 4'b0100;
	parameter LOAD_1 = 4'b0000;
	parameter STOR_1 = 4'b0100;
	
	// MEM is the opcode, JCOND and SCOND are the secondary codes, JUC through BLE are stored in bits [3:0]
	// JCOND will be absolute memory jumps
	// SCOND will be relative memory jumps
	parameter JCOND = 4'b1100; // JCOND uses unsigned comparison for BEQ through BLT
	//parameter SCOND = 4'b0100; // SCOND is the same as the MEM and is a signed comparison for BEQ through BLE
	parameter JUC = 4'b1110; // JUC jumps directly 
	parameter BEQ = 4'b0000;
	parameter BNEQ = 4'b0001;
	
	reg [1:0] PS, NS;
	
	always @ (posedge CLK) begin
		if (CLR) PS <= 2'b00;
		else PS <= NS;
	end
	
	always @ (PS) begin
		case (PS)
			2'b00: NS <= 2'b01;
			2'b01: NS <= 2'b10;
			2'b10: NS <= 2'b11;
			2'b11: NS <= 2'b00;
		endcase
	end
	
	always @ (PS, inst, FLAGS) begin
		PC_inc <= 1'b1;
		JAddrSelect <= 1'b0;
		case (inst[15:12])
			MEM: begin
				case (inst[7:4])
					LOAD_1: begin
						if (PS == 3) begin PC_inc <= 1'b1; end
						else begin PC_inc <= 1'b0; end
					end
					STOR_1: begin
						if (PS == 3) begin PC_inc <= 1'b1; end
						else begin PC_inc <= 1'b0; end
					end
					JCOND: begin
						JAddrSelect <= 1'b1;
						PC_inc <= 1'b1;
						// C, L, F, Z, N
						case (inst[3:0])
							JUC: begin end
							BEQ: begin
								// Remember that the Registers will not be updated until the next clock cycle,
								// so the NOP instruction that gets sent to the ALU will not update the flags
								// until the next posedge CLK
								// Since this is a BEQ, then if the Z Flag is 1, the arguments
								// to the CMP operation were equal
								if (FLAGS[1] != 1) JAddrSelect <= 1'b0;
							end
							BNEQ: begin
								// Since this is a BNEQ, then if the Z Flag is 0, the arguments
								// to the CMP operation were not equal
								if (FLAGS[1] != 0) JAddrSelect <= 1'b0;
							end
							// other functionality can be added easily here to check the other flags for the GE, GT, LE, and LT
							// Branches.
							default: begin end
						endcase
					end
					default: begin end
				endcase
			end
			default: begin end
		endcase
	end
endmodule
