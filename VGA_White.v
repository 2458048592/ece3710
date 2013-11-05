`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module VGA_White( CLK, CLR, r0, r1, r2, g0, g1, g2, b0, b1, hSync, vSync, _CLK );
	input CLK, CLR;
	//input [7:0] pixel;
	output r0, r1, r2, g0, g1, g2, b0, b1;
	output hSync, vSync;
	
	wire [11:0] Hcnt;
	wire [20:0] Vcnt;
	wire [7:0] pixel;
	reg [2:0] count;
	output reg _CLK;
	
	initial _CLK = 1'b0;
	initial count = 3'b000;
		
	reg [8:0] lines;
	reg [1:0] pixCount;
	initial lines = 0;
	initial pixCount = 0;
	
	always @ (posedge CLK, posedge CLR) begin
		if (CLR) pixCount = 0;
		else begin
			if (pixCount < 3) pixCount = pixCount + 1;
			else pixCount = 0;
		end
	end
	
	always @ (posedge hBright) begin
		if (CLR) lines <= 9'b000000000;
		else begin
			if (lines < 479) lines <= lines + 1;
			else lines <= 9'b000000000;
		end
	end
	wire bit1;
	assign bit1 = (!(!(pixCount % 4))) && (!(!(lines % 4)));
	assign pixel = {bit1, bit1, bit1, bit1, bit1, bit1, bit1, bit1} ;
	
	assign {r0, r1, r2, g0, g1, g2, b0, b1} = pixel;
	
	VGA_Top vga( CLK, CLR, hSync, nhSync, hBright, vSync, nvSync, vBright, VidOut, Hcnt, Vcnt );

endmodule
