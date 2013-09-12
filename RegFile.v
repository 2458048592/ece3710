`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:54 09/10/2013 
// Design Name: 
// Module Name:    RegFile 
// Project Name: 
// Target Devices: 
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
module RegFile(
	 input CLK, CLR, selectImm,
	 input [15:0] data,
	 input [7:0] Imm,
	 input [3:0] selectA, selectB, selectWrite,
	 output [15:0] A, B
    );
	 
	 reg [15:0] reset;
	 reg [15:0] enWrite;
	 
	 wire [15:0] r0out;
	 wire [15:0] r1out;
	 wire [15:0] r2out;
	 wire [15:0] r3out;
	 wire [15:0] r4out;
	 wire [15:0] r5out;
	 wire [15:0] r6out;
	 wire [15:0] r7out;
	 wire [15:0] r8out;
	 wire [15:0] r9out;
	 wire [15:0] r10out;
	 wire [15:0] r11out;
	 wire [15:0] r12out;
	 wire [15:0] r13out;
	 wire [15:0] r14out;
	 wire [15:0] r15out;
	 wire [15:0] RegSelect;
	 
	reg16 r0(CLK, enWrite[0], reset[0], data, r0out);
	reg16 r1(CLK, enWrite[1], reset[1], data, r1out);
	reg16 r2(CLK, enWrite[2], reset[2], data, r2out);
	reg16 r3(CLK, enWrite[3], reset[3], data, r3out);
	reg16 r4(CLK, enWrite[4], reset[4], data, r4out);
	reg16 r5(CLK, enWrite[5], reset[5], data, r5out);
	reg16 r6(CLK, enWrite[6], reset[6], data, r6out);
	reg16 r7(CLK, enWrite[7], reset[7], data, r7out);
	reg16 r8(CLK, enWrite[8], reset[8], data, r8out);
	reg16 r9(CLK, enWrite[9], reset[9], data, r9out);
	reg16 r10(CLK, enWrite[10], reset[10], data, r10out);
	reg16 r11(CLK, enWrite[11], reset[11], data, r11out);
	reg16 r12(CLK, enWrite[12], reset[12], data, r12out);
	reg16 r13(CLK, enWrite[13], reset[13], data, r13out);
	reg16 r14(CLK, enWrite[14], reset[14], data, r14out);
	reg16 r15(CLK, enWrite[15], reset[15], data, r15out);
	
	mux16_to_1_16bit ALUBusA(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out, selectA, A);
	mux16_to_1_16bit ALUBusB(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out, selectB, RegSelect);
	
	mux2_to_1_16bit ImmMux(RegSelect, {Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm}, selectImm, B);
	
	always @ (posedge CLK) begin
		if (CLR == 1'b1) begin reset <= 16'b1111111111111111; enWrite <= 16'b0; end
		else begin
			reset <= 16'b0;
			case(selectWrite)
				0: enWrite <=  16'b0000000000000001;
				1: enWrite <=  16'b0000000000000010;
				2: enWrite <=  16'b0000000000000100;
				3: enWrite <=  16'b0000000000001000;
				4: enWrite <=  16'b0000000000010000;
				5: enWrite <=  16'b0000000000100000;
				6: enWrite <=  16'b0000000001000000;
				7: enWrite <=  16'b0000000010000000;
				8: enWrite <=  16'b0000000100000000;
				9: enWrite <=  16'b0000001000000000;
				10: enWrite <= 16'b0000010000000000;
				11: enWrite <= 16'b0000100000000000;
				12: enWrite <= 16'b0001000000000000;
				13: enWrite <= 16'b0010000000000000;
				14: enWrite <= 16'b0100000000000000;
				15: enWrite <= 16'b1000000000000000;
				default: enWrite <= 16'b0;
			endcase
		end
	end
endmodule

module reg16(
	input CLK,
	input enable,
	input reset,
	input [15:0] d,
	output reg [15:0] q
	);
	
	always @ (posedge CLK) begin
		if (reset) q <= 16'b0;
		else begin
			if (enable) q <= d;
			else q <= q;
		end
	end
	
endmodule

module mux16_to_1_16bit(
	input [15:0] a0,
	input [15:0] a1,
	input [15:0] a2,
	input [15:0] a3,
	input [15:0] a4,
	input [15:0] a5,
	input [15:0] a6,
	input [15:0] a7,
	input [15:0] a8,
	input [15:0] a9,
	input [15:0] a10,
	input [15:0] a11,
	input [15:0] a12,
	input [15:0] a13,
	input [15:0] a14,
	input [15:0] a15,
	input [3:0] select,
	output reg [15:0] out
	);
	
	always @ (*) begin
		case(select)
			0: out = a0;
			1: out = a1;
			2: out = a2;
			3: out = a3;
			4: out = a4;
			5: out = a5;
			6: out = a6;
			7: out = a7;
			8: out = a8;
			9: out = a9;
			10: out = a10;
			11: out = a11;
			12: out = a12;
			13: out = a13;
			14: out = a14;
			15: out = a15;
			default: out = a0;
		endcase
	end
	
endmodule

module mux2_to_1_16bit(
	input [15:0] a0,
	input [15:0] a1,
	input sel,
	output reg [15:0] b
	);
	
	always @ (*) begin
		case (sel)
			0: b = a0;
			1: b = a1;
			default: b = 16'b0;
		endcase
	end
endmodule

// this is a block memory
module block_Mem(
	input CLK, CLR, w,
	input [3:0] addr,
	input [15:0] data,
	output [15:0] out
	);
	
	reg [15:0] RAM [15:0];
	assign out = RAM[addr];
	
	always @ (posedge CLK) begin
		//TODO: CLR
		if (w) RAM[addr] <= data;
	end
endmodule
