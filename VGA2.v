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
	
	wire [9:0] HPix, VPix;
	//pixelGen3 _pixelGen( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
	//	readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, RGB_out );
	pixelGen4 _pixelGen( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
		readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, RGB_out );
	//wire [11:0] addr11, addr22;
	//wire [9:0] addr3, addr4;
	//wire [17:0] d_out11, d_out22, glyph, glyph2;
	//pixelGen4 _pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr11, addr22, d_out11, d_out22, addr3, addr4, glyph, glyph2 );
	
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
