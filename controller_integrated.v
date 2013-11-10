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
	output [15:0] data1,
	output [4:0] stored_flags,
	output [15:0] A, B, aluOut, // for debugging
	//output [3:0] readRegA, loadReg, // for debugging
	output PC_inc, JAddrSelect

    );
	 	 
	wire [7:0] OP;
	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg, memAddr; // loadReg; // readRegA, 
	wire selectImm, selectResult;
	wire [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out;
	reg [15:0] enWrite, reset;	
	wire [15:0] RegB;
	wire [4:0] FLAGS;
	
	instruction_FSM controller( CLK, CLR, inst, FLAGS, stored_flags PC_inc, JAddrSelect, LR);
	 
	ALU _alu(stored_flags[4], A, B, OP, aluOut, FLAGS[4], FLAGS[3], FLAGS[2], FLAGS[1], FLAGS[0]);

	decoder _decoder(inst, OP, Imm, selectImm, selectResult, w1, memAddr, readRegA, readRegB, loadReg);
		
	RegFile _regfile(CLK, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1,
							 data1, enWrite, reset, r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out);
	
	mux16_to_1_16bit MemSelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, memAddr, addr1);
							
	mux16_to_1_16bit ASelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegA, A);
	
	mux16_to_1_16bit BSelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegB, RegB);

	mux2_to_1_16bit ImmMux(RegB, Imm, selectImm, B);
	mux2_to_1_16bit ResultMux(aluOut, external_din[15:0], selectResult, data1);

	always @ (*) begin
		if (CLR == 1'b1) begin reset <= 16'b1111111111111111; enWrite <= 16'b0; end
		else begin
			reset <= 16'b0000000000000000;
			if (LR == 0) enWrite <= 16'b0000000000000000;
			// loadReg is a 5-bit address/enable vector.  The lower four
			// bits indicate the address of the register to be enabled, but the
			// MSB indicates whether writing is enabled.  This MSB is active-Low,
			// meaning that when it is low, writing is enabled for the register
			// addressed by the lower 4 bits.  When it is high, writing is disabled.
			// This decision was for ease of reading and implementation.
			else
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
