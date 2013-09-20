`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:13 09/12/2013 
// Design Name: 
// Module Name:    dataPath 
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
module dataPath(
	input CLK, CLR, selectImm,
	input [4:0] loadReg, // When the MSB is 1, loading is disabled, when 0 loading is enabled.
	input [3:0] readRegA, readRegB,
	input [7:0] Imm, op,
	output [15:0] A, B, Z,
	output [4:0] flags
    );
	 
	wire [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in,
              r11in, r12in, r13in, r14in, r15in, r0out, r1out, r2out, r3out, r4out,
              r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out,
              r14out, r15out, RegSelect; // RegSelect is fed into a 2to1 mux to choose
                                         // between an immediate or B

	reg [15:0] enWrite, reset; // Each bit in enWrite and reset corresponds to
                             // a register E.g. r0 = enWrite[0], reset [0]  
	
	ALU _alu(flags[4], A, B, op, Z, flags[4], flags[3], flags[2], flags[1], flags[0]);
	
  // Write to read file
	decoder_4_to_16_16bit loadBus(Z, loadReg[3:0], r0in, r1in, r2in, r3in, r4in, r5in, r6in,
                                            r7in, r8in, r9in, r10in, r11in, r12in, 
                                            r13in, r14in, r15in);
	
	RegFile _regfile(CLK, r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in,
                        r10in, r11in, r12in, r13in, r14in, r15in,
                        enWrite, reset,
                        r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
                        r9out, r10out, r11out, r12out, r13out, r14out, r15out);
	
  // Read port A
	mux16_to_1_16bit ALUBusA(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out,
                           r8out, r9out, r10out, r11out, r12out, r13out, r14out,
                           r15out, readRegA, A);

  // Read port B
	mux16_to_1_16bit ALUBusB(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out,
                           r8out, r9out, r10out, r11out, r12out, r13out, r14out,
                           r15out, readRegB, RegSelect);
	
  // determines whether an imm or B is loaded (0 selects B, 1 selects Imm)
	mux2_to_1_16bit ImmMux(RegSelect, {Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],
                                     Imm[7],Imm}, selectImm, B);
												 
	//  If the decoder doesn't have blocking statements, zero is always displayed
   // 	on the FPGA and simulation.
	always @ (*) begin
		if (CLR == 1'b1) begin reset = 16'b1111111111111111; enWrite = 16'b0; end
		else begin
			reset = 16'b0;
			case(loadReg) // decodes which register to enable
				0: enWrite =  16'b0000000000000001;
				1: enWrite =  16'b0000000000000010;
				2: enWrite =  16'b0000000000000100;
				3: enWrite =  16'b0000000000001000;
				4: enWrite =  16'b0000000000010000;
				5: enWrite =  16'b0000000000100000;
				6: enWrite =  16'b0000000001000000;
				7: enWrite =  16'b0000000010000000;
				8: enWrite =  16'b0000000100000000;
				9: enWrite =  16'b0000001000000000;
				10: enWrite = 16'b0000010000000000;
				11: enWrite = 16'b0000100000000000;
				12: enWrite = 16'b0001000000000000;
				13: enWrite = 16'b0010000000000000;
				14: enWrite = 16'b0100000000000000;
				15: enWrite = 16'b1000000000000000;
				default: enWrite = 16'b0;
			endcase
		end
	end
endmodule

module decoder_4_to_16_16bit(
	input [15:0] in,
	input [3:0] select,
	output reg [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in);
	
	always @ (*) begin
		case (select)
			0:  begin r0in = in; {r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			1: begin r1in = in; {r0in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			2: begin r2in = in; {r0in, r1in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			3: begin r3in = in; {r0in, r1in, r2in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			4: begin r4in = in; {r0in, r1in, r2in, r3in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			5: begin r5in = in; {r0in, r1in, r2in, r3in, r4in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			6: begin r6in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			7: begin r7in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			8: begin r8in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			9: begin r9in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			10: begin r10in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r11in, r12in, r13in, r14in, r15in} = 0; end
			11: begin r11in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r12in, r13in, r14in, r15in} = 0; end
			12: begin r12in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r13in, r14in, r15in} = 0; end
			13: begin r13in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r14in, r15in} = 0; end
			14: begin r14in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r15in} = 0; end
			15: begin r15in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in} = 0; end
			default: {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0;
		endcase
	end
	
endmodule

	//module ALU(
	//input c,
   //input signed [15:0] a, b,
	//input [7:0] op,
   //output reg [15:0] y,
   //output reg C, L, F, Z, N
   //);
	 
	//module RegFile(
	//input CLK, CLR, selectImm,
	//input [15:0] data,
	//input [7:0] Imm,
	//input [3:0] selectA, selectB, selectWrite,
	//output reg [15:0] A, B
   //);
