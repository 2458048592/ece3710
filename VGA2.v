`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA2( CLK, CLR, DEBUG, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, readRegA, readRegB, loadReg, memAddr, 
	data_addr, data_in, inst_addr, A, B, FLAGS, RGB_out, HSync, VSync );
	input CLK, CLR, DEBUG;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
	input [3:0] readRegA, readRegB, loadReg, memAddr;
	input [15:0] data_addr, data_in, A, B, inst_addr;
	input [4:0] FLAGS;
	output reg [7:0] RGB_out;
	output HSync, VSync;
	
	reg [1:0] clkCount;
	reg pixCLK;
	
	wire [11:0] addr1, addr2;
	wire [9:0] HPix, VPix;
	wire [7:0] RGB_outD;
	
	pixelGen5 _pixelGen5( CLK, CLR, DEBUG, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
		readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, RGB_outD );
	
	wire [3:0] spriteHPix, spriteVPix;
	
	// spriteHPix is calculated by taking HPix - XLocation % Sprite size
	assign spriteHPix = (HPix - 68)%16;
	// spriteHPix is calculated by taking VPix - YLocation % Sprite size
	assign spriteVPix = (VPix - 124)%16;
	wire [7:0] sprite1;
	spriteGen _spriteGen(CLK, CLR, spriteHPix, spriteVPix, alpha, sprite1);
		
	always @ (*) begin
		if (DEBUG == 1'b1) begin
			RGB_out = RGB_outD;
		end
		else begin
			if (HPix >= 68 && HPix < 84 && VPix >= 124 && VPix < 140 && alpha == 1'b1) begin
				RGB_out = sprite1;
			end
			else begin
				RGB_out = RGB_outD;
			end
		end
	end
	
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
