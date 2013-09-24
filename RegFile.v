`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module Name:    RegFile 
// Description: RegFile instantiates 16 16-bit registers.
//
// Module Name:	   reg16
// Description: reg16 is a 16-bit register
//
// Module Name:    mux16_to_1_16bit
// Description: mux16_to_1_16bit is a 16-bit wide 16 to 1 selector mux for reading from the RegFile
//
// Module Name:    mux2_to_1_16bit
// Description: mux2_to_1_16bit is a 16-bit wide 2 to 1 selector mux for selecting either the value
//      from the RegFile or an Immediate.
//
// Module Name:    block_Mem
// Description: block_Mem is an incomplete memory module.  Currently unused.
//
//////////////////////////////////////////////////////////////////////////////////
module RegFile(
	 input CLK,
	 input [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in, enWrite, reset,
	 output [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out
    );
	// Instantiate all 16-bit registers with the correct write-enable and reset inputs
	reg16 r0(CLK, enWrite[0], reset[0], r0in, r0out);
	reg16 r1(CLK, enWrite[1], reset[1], r1in, r1out);
	reg16 r2(CLK, enWrite[2], reset[2], r2in, r2out);
	reg16 r3(CLK, enWrite[3], reset[3], r3in, r3out);
	reg16 r4(CLK, enWrite[4], reset[4], r4in, r4out);
	reg16 r5(CLK, enWrite[5], reset[5], r5in, r5out);
	reg16 r6(CLK, enWrite[6], reset[6], r6in, r6out);
	reg16 r7(CLK, enWrite[7], reset[7], r7in, r7out);
	reg16 r8(CLK, enWrite[8], reset[8], r8in, r8out);
	reg16 r9(CLK, enWrite[9], reset[9], r9in, r9out);
	reg16 r10(CLK, enWrite[10], reset[10], r10in, r10out);
	reg16 r11(CLK, enWrite[11], reset[11], r11in, r11out);
	reg16 r12(CLK, enWrite[12], reset[12], r12in, r12out);
	reg16 r13(CLK, enWrite[13], reset[13], r13in, r13out);
	reg16 r14(CLK, enWrite[14], reset[14], r14in, r14out);
	reg16 r15(CLK, enWrite[15], reset[15], r15in, r15out);
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

// this is an incomplete block memory to be completed later
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
