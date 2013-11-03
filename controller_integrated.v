`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Module Name:    controller_integrated 
//
//////////////////////////////////////////////////////////////////////////////////
module controller_integrated(
	input CLK, CLR,
	input [17:0] inst, out1,
	output w1,  // w1 is writeToMemory
	output [15:0] addr1, // A[14:0] is addr1 for the memory module
	output [15:0] data1,
	output [4:0] FLAGS,
	output [15:0] B, aluOut // for debugging

    );
	 	 
	// wire [15:0] A, B, aluOut;
	 wire [7:0] OP;
	 //wire [15:0]
	 
	 ALU _alu(FLAGS[4], addr1, B, OP, aluOut, FLAGS[4], FLAGS[3], FLAGS[2], FLAGS[1], FLAGS[0]);
//	module ALU(
//	 input c,
//    input signed [15:0] a,
//    input signed [15:0] b,
//	 input [7:0] op,
//    output reg [15:0] y,
//    output reg C, L, F, Z, N
//    );

	//wire w0, w1;
	//wire [14:0] addr0, addr1;
	//wire [17:0] data0, data1, out0, out1;

	//memory2 _RAM(CLK, CLR, w0, w1, A[14:0], A[14:0], data0, data1, out0, out1);
//	module memory2(
//	input CLK, CLR, w0, w1,
//	input [14:0] addr0, addr1,
//	input [17:0] data0, data1,
//	output reg [17:0] out0, out1
//	);

	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg;
	wire selectImm, selectResult;
	
	decoder _decoder(inst, OP, Imm, selectImm, selectResult, w1, readRegA, readRegB, loadReg);
//	module decoder(
//    input [17:0] inst,
//    output reg [7:0] op,
//	 output reg [15:0] Imm, // Imm needs to be sign-extended or 0-extended when applicable
//	 output reg selectImm, selectResult, w1,
//	 output reg [3:0] readRegA,
//	 output reg [3:0] readRegB,
//	 output reg [3:0] loadReg
//    );
	
	//wire [15:0] result;
	wire [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out;
	reg [15:0] enWrite, reset;
	
	RegFile _regfile(CLK, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1, data1,
							 data1, enWrite, reset, r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out);
//	module RegFile(
//	 input CLK,
//	 input [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in, enWrite, reset,
//	 output [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out
//    );
	
	mux16_to_1_16bit ASelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegA, addr1);
	
	
	wire [15:0] RegB;
	mux16_to_1_16bit BSelect(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
							r9out, r10out, r11out, r12out, r13out, r14out, r15out, readRegB, RegB);
//	module mux16_to_1_16bit(
//	input [15:0] a0,
//	input [15:0] a1,
//	input [15:0] a2,
//	input [15:0] a3,
//	input [15:0] a4,
//	input [15:0] a5,
//	input [15:0] a6,
//	input [15:0] a7,
//	input [15:0] a8,
//	input [15:0] a9,
//	input [15:0] a10,
//	input [15:0] a11,
//	input [15:0] a12,
//	input [15:0] a13,
//	input [15:0] a14,
//	input [15:0] a15,
//	input [3:0] select,
//	output reg [15:0] out
//	);

	mux2_to_1_16bit ImmMux(RegB, Imm, selectImm, B);
	mux2_to_1_16bit ResultMux(aluOut, out1[15:0], selectResult, data1);
//	module mux2_to_1_16bit(
//	input [15:0] a0,
//	input [15:0] a1,
//	input sel,
//	output reg [15:0] b
//	);

//	always @ (*) begin
//		data1 <= result;
//		addr1 <= A[14:0];
//	end

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
