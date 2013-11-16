`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA2( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, readRegA, readRegB, loadReg, memAddr, 
	data_addr, data_in, inst_addr, A, B, FLAGS, RGB_out, HSync, VSync );
	input CLK, CLR;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
	input [3:0] readRegA, readRegB, loadReg, memAddr;
	input [15:0] data_addr, data_in, A, B, inst_addr;
	input [4:0] FLAGS;
	output [7:0] RGB_out;
	output HSync, VSync;
	//output [9:0] HPix, VPix;
	
	wire [9:0] maxH, maxV;
	
	assign maxH = 640;
	assign maxV = 480;
	
	reg [1:0] clkCount;
	reg pixCLK;
	
	wire [11:0] addr1, addr2;
	
	//pixelGen2 _pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out );
	//pixelGen3 _pixelGen( CLK, CLR, HPix, VPix, RGB_out );
	wire [9:0] HPix, VPix;
	pixelGen3 _pixelGen( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
		readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, RGB_out );
	//pixelGen4 _pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr1, addr2, d_out1, d_out2 );
	
	always @ (posedge CLK) begin
		if (CLR) begin pixCLK = 1'b0; clkCount = 2'b0; end
		else begin
			if (clkCount < 2'b11) begin pixCLK = 1'b0; clkCount = clkCount + 1'b1; end
			else begin pixCLK = 1'b1; clkCount = 2'b0; end
		end
	end
	
	hCounter _hCounter( pixCLK, CLR, VCntEna, HSync, HPix );
	vCounter _vCounter( pixCLK, CLR, VCntEna, VSync, VPix );

endmodule

// This module remembers a set of glyphs for each line.
// 80 glyphs per row, 27 memory addresses*3 = 81, but only 80
// can be displayed.  27 memory addresses*60 total lines = 1620 memory
// addresses for the full screen.
// 4096 memory addresses for this video memory
// 164 for the alphabet as written, so if we start at address 256,
// we stop at 1875
module pixelGen3( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
		readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, RGB_out );
	input CLK, CLR;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, data_addr, data_in, A, B, inst_addr;
	input [3:0] readRegA, readRegB, loadReg, memAddr;
	input [4:0] FLAGS;
	input [9:0] HPix, VPix;
	output reg [7:0] RGB_out;

	wire [10:0] addr2;
	reg [10:0] addr1;
	//wire [11:0] addr2;
	wire [17:0] d_in2, d_out1, d_out2;
	//output [17:0] d_out1, d_out2;
	
	reg [17:0] d_in1;
	
	reg w1;
	wire w2;
	//assign w1 = 0;
	assign w2 = 0;
	//assign d_in1 = 0;
	//assign d_in2 = 0;

	parameter RTYPE = 4'b0000;
	parameter ADD = 4'b0101;
	parameter ADDU = 4'b0110;
	parameter ADDC = 4'b0111;
	parameter ADDCU = 4'b0100;
	parameter SUB = 4'b1001;
	parameter CMP = 4'b1011;
	parameter AND = 4'b0001;		
	parameter OR = 4'b0010;
	parameter XOR = 4'b0011;
	parameter NOT = 4'b1111;
	parameter MOV = 4'b1101;
	
	parameter ADDI = 4'b0101;
	parameter ADDCUI = 4'b1010;
	parameter ADDCI = 4'b0111;
	parameter ADDUI = 8'b0110;
	parameter SUBI = 4'b1001;
	parameter MOVI = 4'b1101;
	parameter LUI = 4'b1111;
	parameter CMPI = 4'b1011;
	parameter CMPUI = 4'b1110;
	
	parameter SHIFT = 4'b1000;
	parameter LSH = 4'b0100;
	parameter LSHI = 4'b0000;
	parameter RSH = 4'b1100;
	parameter RSHI = 4'b0001;
	parameter ALSH = 4'b0101;
	parameter ARSH = 4'b1101;
	
	// MEM is the opcode, JCOND and SCOND are the secondary codes, JUC through BLE are stored in bits [3:0]
	parameter MEM = 4'b0100;
	parameter LOAD = 4'b0000;
	parameter STOR = 4'b0100;
	parameter JCOND = 4'b1100; // JCOND uses unsigned comparison for BEQ through BLT
	parameter JUC = 4'b1110; // JUC jumps directly 
	parameter BEQ = 4'b0000;
	parameter BNEQ = 4'b0001;
	
	vidMemory vid_mem(CLK, w1, addr1, d_in1, d_out1, CLK, w2, addr2, d_in2, d_out2);
	
	//assign addr1 = (HPix == 0 || VPix == 0) ? 12'b0000000000 : 4*((HPix - 1)/8) + (((VPix - 1) % 8)/2);
	
	// Find a way to set the correct address from the glyph map
	// so HPix 1 VPix 1 starts us with memory address 256
	
	// addr2 will be used to pull glyph row information from d_out2.  d_out2 will
	// be used to generate addr1 for all glyph pixel information to generate
	// RGB_out from d_out1
	
	// So, addr2 can be calculated by finding (HPix - 1) / 24 to get the first and second VPix rows,
	// but VPix will also have to be divided.  (VPix - 1) / 8 will give us the correct row, but we have to
	// multiple the result of that by 27 since there are 27 glyphs per row.
	// Once we add in our starting address, we should be good to go.
	
	//assign addr2 = 9'd256 + (HPix - 1'b1)/(5'd24) + ((VPix - 1'b1)/2)*(5'd27);
	assign addr2 = 9'd256 + (HPix - 1'b1)/5'd24 + ((VPix - 1'b1)/4'd8)*5'd27;	
	
	// Now that addr2 has been set correctly, we need to get addr1 from d_out2
	// VPix has already been taken into account and ensures that we are on the
	// correct row, but we need to find out which character we are displaying.
	// (HPix - 1) % 24 will give us a number from 0-23 and depending on the
	// result, we can obtain the correct pixel.  Since glyphs consist of 6bits,
	// HPix 0-7 will correspond to the top 6 bits of the 18-bit data, or 17-12
	// HPix 8-15 will correspond to the second 6 bits of the 18-bit data, or 11-6
	// HPix 16-23 will correspond to the last 6 bits of the 18-bit data, or 5-0
	
	// Need to take into account VPix.  2 rows per address, 4 addresses per glyph.
	// Remember to multiply the glyph code by 4 (since each glyph takes up
	// 4 addresses.
	
	reg [5:0] val1, val2, val3, val4, val5, val6;
	
	always @ (*) begin
		if (count == 1 || count == 2) begin
				val1 = inst[17:16] + 1'b1;
				val2 = inst[15:12] + 1'b1;
				val3 = inst[11:8] + 1'b1;
				val4 = inst[7:4] + 1'b1;
				val5 = inst[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 3 || count == 4) begin
				val1 = 1'b0;
				val2 = r0[15:12] + 1'b1;
				val3 = r0[11:8] + 1'b1;
				val4 = r0[7:4] + 1'b1;
				val5 = r0[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 5 || count == 6) begin
				val1 = 1'b0;
				val2 = r1[15:12] + 1'b1;
				val3 = r1[11:8] + 1'b1;
				val4 = r1[7:4] + 1'b1;
				val5 = r1[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 7 || count == 8) begin
				val1 = 1'b0;
				val2 = r2[15:12] + 1'b1;
				val3 = r2[11:8] + 1'b1;
				val4 = r2[7:4] + 1'b1;
				val5 = r2[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 9 || count == 10) begin
				val1 = 1'b0;
				val2 = r3[15:12] + 1'b1;
				val3 = r3[11:8] + 1'b1;
				val4 = r3[7:4] + 1'b1;
				val5 = r3[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 11 || count == 12) begin
				val1 = 1'b0;
				val2 = r4[15:12] + 1'b1;
				val3 = r4[11:8] + 1'b1;
				val4 = r4[7:4] + 1'b1;
				val5 = r4[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 13 || count == 14) begin
				val1 = 1'b0;
				val2 = r5[15:12] + 1'b1;
				val3 = r5[11:8] + 1'b1;
				val4 = r5[7:4] + 1'b1;
				val5 = r5[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 15 || count == 16) begin
				val1 = 1'b0;
				val2 = r6[15:12] + 1'b1;
				val3 = r6[11:8] + 1'b1;
				val4 = r6[7:4] + 1'b1;
				val5 = r6[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 17 || count == 18) begin
				val1 = 1'b0;
				val2 = r7[15:12] + 1'b1;
				val3 = r7[11:8] + 1'b1;
				val4 = r7[7:4] + 1'b1;
				val5 = r7[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 19 || count == 20) begin
				val1 = 1'b0;
				val2 = r8[15:12] + 1'b1;
				val3 = r8[11:8] + 1'b1;
				val4 = r8[7:4] + 1'b1;
				val5 = r8[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 21 || count == 22) begin
				val1 = 1'b0;
				val2 = r9[15:12] + 1'b1;
				val3 = r9[11:8] + 1'b1;
				val4 = r9[7:4] + 1'b1;
				val5 = r9[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 23 || count == 24) begin
				val1 = 1'b0;
				val2 = r10[15:12] + 1'b1;
				val3 = r10[11:8] + 1'b1;
				val4 = r10[7:4] + 1'b1;
				val5 = r10[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 25 || count == 26) begin
				val1 = 1'b0;
				val2 = r11[15:12] + 1'b1;
				val3 = r11[11:8] + 1'b1;
				val4 = r11[7:4] + 1'b1;
				val5 = r11[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 27 || count == 28) begin
				val1 = 1'b0;
				val2 = r12[15:12] + 1'b1;
				val3 = r12[11:8] + 1'b1;
				val4 = r12[7:4] + 1'b1;
				val5 = r12[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 29 || count == 30) begin
				val1 = 1'b0;
				val2 = r13[15:12] + 1'b1;
				val3 = r13[11:8] + 1'b1;
				val4 = r13[7:4] + 1'b1;
				val5 = r13[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 31 || count == 32) begin
				val1 = 1'b0;
				val2 = r14[15:12] + 1'b1;
				val3 = r14[11:8] + 1'b1;
				val4 = r14[7:4] + 1'b1;
				val5 = r14[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 33 || count == 34) begin
				val1 = 1'b0;
				val2 = r15[15:12] + 1'b1;
				val3 = r15[11:8] + 1'b1;
				val4 = r15[7:4] + 1'b1;
				val5 = r15[3:0] + 1'b1;
				val6 = 6'b000000;
		end
		else if (count == 39 || count == 40) begin
			val1 = 1'b0;
			val2 = data_addr[15:12] + 1'b1;
			val3 = data_addr[11:8] + 1'b1;
			val4 = data_addr[7:4] + 1'b1;
			val5 = data_addr[3:0] + 1'b1;
			val6 = 6'b000000;
		end
		else if (count == 41 || count == 42) begin
			val1 = 1'b0;
			val2 = A[15:12] + 1'b1;
			val3 = A[11:8] + 1'b1;
			val4 = A[7:4] + 1'b1;
			val5 = A[3:0] + 1'b1;
			val6 = 6'b000000;
		end
		else if (count == 43 || count == 44) begin
			val1 = 1'b0;
			val2 = B[15:12] + 1'b1;
			val3 = B[11:8] + 1'b1;
			val4 = B[7:4] + 1'b1;
			val5 = B[3:0] + 1'b1;
			val6 = 6'b000000;
		end
		else if (count == 45 || count == 46) begin
			val1 = 1'b0;
			val2 = data_in[15:12] + 1'b1;
			val3 = data_in[11:8] + 1'b1;
			val4 = data_in[7:4] + 1'b1;
			val5 = data_in[3:0] + 1'b1;
			val6 = 6'b000000;
		end
		else if (count == 47 || count == 48) begin
			val1 = 1'b0;
			val2 = inst_addr[15:12] + 1'b1;
			val3 = inst_addr[11:8] + 1'b1;
			val4 = inst_addr[7:4] + 1'b1;
			val5 = inst_addr[3:0] + 1'b1;
			val6 = 6'b000000;
		end
		else if (count == 49 || count == 50) begin
			val1 = (FLAGS[4] == 1'b1) ? 6'b001101 : 6'b000000;
			val2 = (FLAGS[3] == 1'b1) ? 6'b010110 : 6'b000000;
			val3 = (FLAGS[2] == 1'b1) ? 6'b010000 : 6'b000000;
			val4 = (FLAGS[1] == 1'b1) ? 6'b100100 : 6'b000000;
			val5 = (FLAGS[0] == 1'b1) ? 6'b011000 : 6'b000000;
			val6 = 6'b000000;
		end
		else if (count == 51 || count == 52) begin
			case (inst[15:12])
				RTYPE: begin
					case (inst[7:4])
						ADD: begin
							val1 = 6'b001011;
							val2 = 6'b001110;
							val3 = 6'b001110;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						ADDU: begin
							val1 = 6'b001011;
							val2 = 6'b001110;
							val3 = 6'b001110;
							val4 = 6'b011111;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						ADDC: begin
							val1 = 6'b001011;
							val2 = 6'b001110;
							val3 = 6'b001110;
							val4 = 6'b001101;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						ADDCU: begin
							val1 = 6'b001011;
							val2 = 6'b001110;
							val3 = 6'b001110;
							val4 = 6'b001101;
							val5 = 6'b011111;
							val6 = 6'b000000;
						end
						SUB: begin
							val1 = 6'b011101;
							val2 = 6'b011111;
							val3 = 6'b001100;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						CMP: begin
							val1 = 6'b001101;
							val2 = 6'b010111;
							val3 = 6'b011010;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						AND: begin
							val1 = 6'b001011;
							val2 = 6'b011000;
							val3 = 6'b001110;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						OR: begin
							val1 = 6'b011001;
							val2 = 6'b011100;
							val3 = 6'b000000;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						XOR: begin
							val1 = 6'b100010;
							val2 = 6'b011001;
							val3 = 6'b011100;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						NOT: begin
							val1 = 6'b011000;
							val2 = 6'b011001;
							val3 = 6'b011110;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						MOV: begin
							val1 = 6'b010111;
							val2 = 6'b011001;
							val3 = 6'b100000;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						default: begin
							val1 = 6'b000000;
							val2 = 6'b000000;
							val3 = 6'b000000;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
					endcase
				end
				SHIFT: begin
					case (inst[7:4])
						LSH: begin
							val1 = 6'b010110;
							val2 = 6'b011101;
							val3 = 6'b010010;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						LSHI: begin
							val1 = 6'b010110;
							val2 = 6'b011101;
							val3 = 6'b010010;
							val4 = 6'b010011;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						RSH: begin
							val1 = 6'b011100;
							val2 = 6'b011101;
							val3 = 6'b010010;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						RSHI: begin
							val1 = 6'b011100;
							val2 = 6'b011101;
							val3 = 6'b010010;
							val4 = 6'b010011;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						ALSH: begin
							val1 = 6'b001011;
							val2 = 6'b010110;
							val3 = 6'b011101;
							val4 = 6'b010010;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						ARSH: begin
							val1 = 6'b001011;
							val2 = 6'b011100;
							val3 = 6'b011101;
							val4 = 6'b010010;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						default: begin
							val1 = 6'b000000;
							val2 = 6'b000000;
							val3 = 6'b000000;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
					endcase
				end
				MEM: begin
					case (inst[7:4])
						LOAD: begin
							val1 = 6'b010110;
							val2 = 6'b011001;
							val3 = 6'b001011;
							val4 = 6'b001110;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						STOR: begin
							val1 = 6'b011101;
							val2 = 6'b011110;
							val3 = 6'b011001;
							val4 = 6'b011100;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
						JCOND: begin
							case (inst[3:0])
								JUC: begin
									val1 = 6'b010100;
									val2 = 6'b011111;
									val3 = 6'b001101;
									val4 = 6'b000000;
									val5 = 6'b000000;
									val6 = 6'b000000;
								end
								BEQ: begin
									val1 = 6'b001100;
									val2 = 6'b001111;
									val3 = 6'b011011;
									val4 = 6'b000000;
									val5 = 6'b000000;
									val6 = 6'b000000;
								end
								BNEQ: begin
									val1 = 6'b001100;
									val2 = 6'b011000;
									val3 = 6'b001111;
									val4 = 6'b011011;
									val5 = 6'b000000;
									val6 = 6'b000000;
								end
								default: begin
									val1 = 6'b000000;
									val2 = 6'b000000;
									val3 = 6'b000000;
									val4 = 6'b000000;
									val5 = 6'b000000;
									val6 = 6'b000000;
								end
							endcase
						end
						default: begin
							val1 = 6'b000000;
							val2 = 6'b000000;
							val3 = 6'b000000;
							val4 = 6'b000000;
							val5 = 6'b000000;
							val6 = 6'b000000;
						end
					endcase
				end
				ADDI: begin
					val1 = 6'b001011;
					val2 = 6'b001110;
					val3 = 6'b001110;
					val4 = 6'b010011;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
				ADDUI: begin
					val1 = 6'b001011;
					val2 = 6'b001110;
					val3 = 6'b001110;
					val4 = 6'b011111;
					val5 = 6'b010011;
					val6 = 6'b000000;
				end
				ADDCI: begin
					val1 = 6'b001011;
					val2 = 6'b001110;
					val3 = 6'b001110;
					val4 = 6'b001101;
					val5 = 6'b010011;
					val6 = 6'b000000;
				end
				ADDCUI: begin
					val1 = 6'b001011;
					val2 = 6'b001110;
					val3 = 6'b001110;
					val4 = 6'b001101;
					val5 = 6'b011111;
					val6 = 6'b010011;
				end
				SUBI: begin
					val1 = 6'b011101;
					val2 = 6'b011111;
					val3 = 6'b001100;
					val4 = 6'b010011;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
				MOVI: begin
					val1 = 6'b010111;
					val2 = 6'b011001;
					val3 = 6'b100000;
					val4 = 6'b010011;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
				LUI: begin
					val1 = 6'b010110;
					val2 = 6'b011111;
					val3 = 6'b010011;
					val4 = 6'b000000;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
				CMPI: begin
					val1 = 6'b001101;
					val2 = 6'b010111;
					val3 = 6'b011010;
					val4 = 6'b010011;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
				CMPUI: begin
					val1 = 6'b001101;
					val2 = 6'b010111;
					val3 = 6'b011010;
					val4 = 6'b011111;
					val5 = 6'b010011;
					val6 = 6'b000000;
				end
				default: begin
					val1 = 6'b000000;
					val2 = 6'b000000;
					val3 = 6'b000000;
					val4 = 6'b000000;
					val5 = 6'b000000;
					val6 = 6'b000000;
				end
			endcase
		end
		else begin
				val1 = 0;
				val2 = 0;
				val3 = 0;
				val4 = 0;
				val5 = 0;
				val6 = 0;
		end
	end
	
	always @ (*) begin
		if (VPix == 0) begin
			w1 = 1;
			if (count < 35 || (count >= 39 && count < 53)) begin
				if (count % 2 == 1) begin
					d_in1 = {val1, val2, val3};
				end
				else begin
					d_in1 = {val4, val5, 6'b0};
				end
			end
			else if (count == 35) d_in1 = { readRegA + 1'b1,12'b0};
			else if (count == 36) d_in1 = { readRegB + 1'b1, 12'b0};
			else if (count == 37) d_in1 = { loadReg + 1'b1, 12'b0};
			else if (count == 38) d_in1 = { memAddr + 1'b1, 12'b0};
			else d_in1 = 18'b0;
			// when HPix or VPix is 0, we can safely write to the memory
			// Instruction should be written at address 314
			// R0 should be written at 341
			// R1 should be written at 368
			// so add 27 to the previous register to display the values
			case (count)
				1: addr1 = 321; // Inst display addresses.
				2: addr1 = 322; // Display decoded instruction at 324
				3: addr1 = 341; // r0 display addresses
				4: addr1 = 342; 
				5: addr1 = 368; // r1 display addresses
				6: addr1 = 369; 
				7: addr1 = 395; // r2 display addresses
				8: addr1 = 396; 
				9: addr1 = 422; // r3 display addresses
				10: addr1 = 423;
				11: addr1 = 449; // r4 display addresses
				12: addr1 = 450; 
				13: addr1 = 476; // r5 display addresses
				14: addr1 = 477; 
				15: addr1 = 503; // r6 display addresses
				16: addr1 = 504;
				17: addr1 = 530; // r7 display addresses
				18: addr1 = 531;
				19: addr1 = 557; // r8 display addresses
				20: addr1 = 558;
				21: addr1 = 584; // r9 display addresses
				22: addr1 = 585;
				23: addr1 = 611; // r10 display addresses
				24: addr1 = 612;
				25: addr1 = 638; // r11 display addresses
				26: addr1 = 639;
				27: addr1 = 665; // r12 display addresses
				28: addr1 = 666;
				29: addr1 = 692; // r13 display addresses
				30: addr1 = 693;
				31: addr1 = 719; // r14 display addresses
				32: addr1 = 720;
				33: addr1 = 746; // r15 display addresses
				34: addr1 = 747; 
				35: addr1 = 348; // Display RegA at 345.  Display RegA info at 348
				36: addr1 = 375; // Display RegB at 372.  Display RegB info at 375
				37: addr1 = 402; // Display loadReg at 399.  Display loadReg info at 402
				38: addr1 = 429; // Display memAddr at 426.  Display memAddr info at 429
				39: addr1 = 482; // Display addr1 at 480.  Display addr1 info at 482
				40: addr1 = 483;
				41: addr1 = 352; // Display ValA at 350.  Display ValA info at 352
				42: addr1 = 353;
				43: addr1 = 379; // Display ValB at 377.  Display ValB info at 379
				44: addr1 = 380;
				45: addr1 = 487; // Display data1 at 485.  Display data1 info at 487
				46: addr1 = 488;
				47: addr1 = 314; // Display PC at 314.  Display PC info at 315
				48: addr1 = 315;
				49: addr1 = 537; // Display FLAGS at 534.  Display FLAGS info at 536
				50: addr1 = 538;
				51: addr1 = 324; // Display decoded instruction text
				52: addr1 = 325;
				default: addr1 = 1875;
			endcase
		end
		else begin
			w1 = 0;
			d_in1 = 18'b0;
			if ((HPix - 1) % 24 >= 16) begin
				// case for the last 6 bits of data
				addr1 = (d_out2[5:0])*4 + ((VPix - 1) % 8)/2 ;
			end
			else if ((HPix - 1) % 24 >= 8) begin
				// case for the middle 6 bits of data
				addr1 = (d_out2[11:6])*4 + ((VPix - 1) % 8)/2 ;
			end
			else begin
				// case for the first 6 bits of data
				addr1 = (d_out2[17:12])*4 + ((VPix - 1) % 8)/2 ;
			end
		end
	end
	
	reg [6:0] count;
	
	always @ (posedge CLK) begin
		if (CLR) begin count = 0; end
		else begin
			if (VPix == 10'b0) begin
				if (count <= 53) begin
					count = count + 1'b1;
				end
				else begin
					count = 0;
				end
			end
			else begin
				count = 0;
			end
		end
	end
	
	// Now we can safely set the pixels
	always @ (*) begin
		if (HPix == 0 || VPix == 0) begin RGB_out = 8'b00000000; end 
		else begin
			if (d_out1[17 - (2 + ((HPix - 1) % 8 + (((VPix - 1) % 2) * 8)))] == 1) begin
				RGB_out = 8'b11111111;
			end
			else begin
				RGB_out = 8'b00000000;
			end
		end
	end
	
endmodule
