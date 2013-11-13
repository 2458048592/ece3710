`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA2( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, RGB_out, HSync, VSync );
	input CLK, CLR;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
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
	pixelGen3 _pixelGen( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, HPix, VPix, RGB_out );
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
module pixelGen3( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, HPix, VPix, RGB_out );
	input CLK, CLR;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
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
	
	reg [5:0] val1, val2, val3, val4, val5;
	
	always @ (*) begin
		case (count)
			1: begin
				val1 = inst[17:16] + 1'b1;
				val2 = inst[15:12] + 1'b1;
				val3 = inst[11:8] + 1'b1;
				val4 = inst[7:4] + 1'b1;
				val5 = inst[3:0] + 1'b1;
			end
			2: begin
				val1 = inst[17:16] + 1'b1;
				val2 = inst[15:12] + 1'b1;
				val3 = inst[11:8] + 1'b1;
				val4 = inst[7:4] + 1'b1;
				val5 = inst[3:0] + 1'b1;
			end
			3: begin
				val1 = 1'b0;
				val2 = r0[15:12] + 1'b1;
				val3 = r0[11:8] + 1'b1;
				val4 = r0[7:4] + 1'b1;
				val5 = r0[3:0] + 1'b1;
			end
			4: begin
				val1 = 1'b0;
				val2 = r0[15:12] + 1'b1;
				val3 = r0[11:8] + 1'b1;
				val4 = r0[7:4] + 1'b1;
				val5 = r0[3:0] + 1'b1;
			end
			5: begin
				val1 = 1'b0;
				val2 = r1[15:12] + 1'b1;
				val3 = r1[11:8] + 1'b1;
				val4 = r1[7:4] + 1'b1;
				val5 = r1[3:0] + 1'b1;
			end
			6: begin
				val1 = 1'b0;
				val2 = r1[15:12] + 1'b1;
				val3 = r1[11:8] + 1'b1;
				val4 = r1[7:4] + 1'b1;
				val5 = r1[3:0] + 1'b1;
			end
			7: begin
				val1 = 1'b0;
				val2 = r2[15:12] + 1'b1;
				val3 = r2[11:8] + 1'b1;
				val4 = r2[7:4] + 1'b1;
				val5 = r2[3:0] + 1'b1;
			end
			8: begin
				val1 = 1'b0;
				val2 = r2[15:12] + 1'b1;
				val3 = r2[11:8] + 1'b1;
				val4 = r2[7:4] + 1'b1;
				val5 = r2[3:0] + 1'b1;
			end
			9: begin
				val1 = 1'b0;
				val2 = r3[15:12] + 1'b1;
				val3 = r3[11:8] + 1'b1;
				val4 = r3[7:4] + 1'b1;
				val5 = r3[3:0] + 1'b1;
			end
			10: begin
				val1 = 1'b0;
				val2 = r3[15:12] + 1'b1;
				val3 = r3[11:8] + 1'b1;
				val4 = r3[7:4] + 1'b1;
				val5 = r3[3:0] + 1'b1;
			end
			11: begin
				val1 = 1'b0;
				val2 = r4[15:12] + 1'b1;
				val3 = r4[11:8] + 1'b1;
				val4 = r4[7:4] + 1'b1;
				val5 = r4[3:0] + 1'b1;
			end
			12: begin
				val1 = 1'b0;
				val2 = r4[15:12] + 1'b1;
				val3 = r4[11:8] + 1'b1;
				val4 = r4[7:4] + 1'b1;
				val5 = r4[3:0] + 1'b1;
			end
			13: begin
				val1 = 1'b0;
				val2 = r5[15:12] + 1'b1;
				val3 = r5[11:8] + 1'b1;
				val4 = r5[7:4] + 1'b1;
				val5 = r5[3:0] + 1'b1;
			end
			14: begin
				val1 = 1'b0;
				val2 = r5[15:12] + 1'b1;
				val3 = r5[11:8] + 1'b1;
				val4 = r5[7:4] + 1'b1;
				val5 = r5[3:0] + 1'b1;
			end
			15: begin
				val1 = 1'b0;
				val2 = r6[15:12] + 1'b1;
				val3 = r6[11:8] + 1'b1;
				val4 = r6[7:4] + 1'b1;
				val5 = r6[3:0] + 1'b1;
			end
			16: begin
				val1 = 1'b0;
				val2 = r6[15:12] + 1'b1;
				val3 = r6[11:8] + 1'b1;
				val4 = r6[7:4] + 1'b1;
				val5 = r6[3:0] + 1'b1;
			end
			17: begin
				val1 = 1'b0;
				val2 = r7[15:12] + 1'b1;
				val3 = r7[11:8] + 1'b1;
				val4 = r7[7:4] + 1'b1;
				val5 = r7[3:0] + 1'b1;
			end
			18: begin
				val1 = 1'b0;
				val2 = r7[15:12] + 1'b1;
				val3 = r7[11:8] + 1'b1;
				val4 = r7[7:4] + 1'b1;
				val5 = r7[3:0] + 1'b1;
			end
			19: begin
				val1 = 1'b0;
				val2 = r8[15:12] + 1'b1;
				val3 = r8[11:8] + 1'b1;
				val4 = r8[7:4] + 1'b1;
				val5 = r8[3:0] + 1'b1;
			end
			20: begin
				val1 = 1'b0;
				val2 = r8[15:12] + 1'b1;
				val3 = r8[11:8] + 1'b1;
				val4 = r8[7:4] + 1'b1;
				val5 = r8[3:0] + 1'b1;
			end
			21: begin
				val1 = 1'b0;
				val2 = r9[15:12] + 1'b1;
				val3 = r9[11:8] + 1'b1;
				val4 = r9[7:4] + 1'b1;
				val5 = r9[3:0] + 1'b1;
			end
			22: begin
				val1 = 1'b0;
				val2 = r9[15:12] + 1'b1;
				val3 = r9[11:8] + 1'b1;
				val4 = r9[7:4] + 1'b1;
				val5 = r9[3:0] + 1'b1;
			end
			23: begin
				val1 = 1'b0;
				val2 = r10[15:12] + 1'b1;
				val3 = r10[11:8] + 1'b1;
				val4 = r10[7:4] + 1'b1;
				val5 = r10[3:0] + 1'b1;
			end
			24: begin
				val1 = 1'b0;
				val2 = r10[15:12] + 1'b1;
				val3 = r10[11:8] + 1'b1;
				val4 = r10[7:4] + 1'b1;
				val5 = r10[3:0] + 1'b1;
			end
			25: begin
				val1 = 1'b0;
				val2 = r11[15:12] + 1'b1;
				val3 = r11[11:8] + 1'b1;
				val4 = r11[7:4] + 1'b1;
				val5 = r11[3:0] + 1'b1;
			end
			26: begin
				val1 = 1'b0;
				val2 = r11[15:12] + 1'b1;
				val3 = r11[11:8] + 1'b1;
				val4 = r11[7:4] + 1'b1;
				val5 = r11[3:0] + 1'b1;
			end
			27: begin
				val1 = 1'b0;
				val2 = r12[15:12] + 1'b1;
				val3 = r12[11:8] + 1'b1;
				val4 = r12[7:4] + 1'b1;
				val5 = r12[3:0] + 1'b1;
			end
			28: begin
				val1 = 1'b0;
				val2 = r12[15:12] + 1'b1;
				val3 = r12[11:8] + 1'b1;
				val4 = r12[7:4] + 1'b1;
				val5 = r12[3:0] + 1'b1;
			end
			29: begin
				val1 = 1'b0;
				val2 = r13[15:12] + 1'b1;
				val3 = r13[11:8] + 1'b1;
				val4 = r13[7:4] + 1'b1;
				val5 = r13[3:0] + 1'b1;
			end
			30: begin
				val1 = 1'b0;
				val2 = r13[15:12] + 1'b1;
				val3 = r13[11:8] + 1'b1;
				val4 = r13[7:4] + 1'b1;
				val5 = r13[3:0] + 1'b1;
			end
			31: begin
				val1 = 1'b0;
				val2 = r14[15:12] + 1'b1;
				val3 = r14[11:8] + 1'b1;
				val4 = r14[7:4] + 1'b1;
				val5 = r14[3:0] + 1'b1;
			end
			32: begin
				val1 = 1'b0;
				val2 = r14[15:12] + 1'b1;
				val3 = r14[11:8] + 1'b1;
				val4 = r14[7:4] + 1'b1;
				val5 = r14[3:0] + 1'b1;
			end
			33: begin
				val1 = 1'b0;
				val2 = r15[15:12] + 1'b1;
				val3 = r15[11:8] + 1'b1;
				val4 = r15[7:4] + 1'b1;
				val5 = r15[3:0] + 1'b1;
			end
			34: begin
				val1 = 1'b0;
				val2 = r15[15:12] + 1'b1;
				val3 = r15[11:8] + 1'b1;
				val4 = r15[7:4] + 1'b1;
				val5 = r15[3:0] + 1'b1;
			end
			default: begin
				val1 = 0;
				val2 = 0;
				val3 = 0;
				val4 = 0;
				val5 = 0;
			end
		endcase
	end
	
	always @ (*) begin
		if (VPix == 0) begin
			w1 = 1;
			if (count % 2 == 1) begin
				d_in1 = {val1, val2, val3};
			end
			else begin
				d_in1 = {val4, val5, 6'b0};
			end
			// when HPix or VPix is 0, we can safely write to the memory
			// Instruction should be written at address 314
			// R0 should be written at 341
			// R1 should be written at 368
			// so add 27 to the previous register to display the values
			case (count)
				1: addr1 = 314;
				2: addr1 = 315;
				3: addr1 = 341;
				4: addr1 = 342;
				5: addr1 = 368;
				6: addr1 = 369;
				7: addr1 = 395;
				8: addr1 = 396;
				9: addr1 = 422;
				10: addr1 = 423;
				11: addr1 = 449;
				12: addr1 = 450;
				13: addr1 = 476;
				14: addr1 = 477;
				15: addr1 = 503;
				16: addr1 = 504;
				17: addr1 = 530;
				18: addr1 = 531;
				19: addr1 = 557;
				20: addr1 = 558;
				21: addr1 = 584;
				22: addr1 = 585;
				23: addr1 = 611;
				24: addr1 = 612;
				25: addr1 = 638;
				26: addr1 = 639;
				27: addr1 = 665;
				28: addr1 = 666;
				29: addr1 = 692;
				30: addr1 = 693;
				31: addr1 = 719;
				32: addr1 = 720;
				33: addr1 = 746;
				34: addr1 = 747;
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
				if (count <= 34) begin
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
