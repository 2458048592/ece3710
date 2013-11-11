`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA2( CLK, CLR, RGB_in, HPix, VPix, RGB_out, HSync, VSync );
	input CLK, CLR;
	input [7:0] RGB_in;
	output [7:0] RGB_out;
	output HSync, VSync;
	output [9:0] HPix, VPix;
	
	wire [9:0] maxH, maxV;
	
	assign maxH = 640;
	assign maxV = 480;
	
	reg [1:0] clkCount;
	reg pixCLK;
	
	pixelGen2 _pixelGen( pixCLK, CLR, maxH, maxV, HPix, VPix, RGB_out );
	
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

module pixelGen2( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr1, d_out1 );
	input CLK, CLR;
	input [9:0] HPix, VPix;
	input [9:0] maxH, maxV;
	output reg [7:0] RGB_out;

	output [9:0] addr1;
	wire [9:0] addr2;
	wire [17:0] d_in1, d_in2, d_out2;
	output [17:0] d_out1;
	
	vidMemory vid_mem(CLK, w1, addr1, d_in1, d_out1, CLK, w2, addr2, d_in2, d_out2);
	
	assign addr1 = (HPix == 0 || VPix == 0) ? 10'b0000000000 : 4*((HPix - 1)/8) + (((VPix - 1) % 8)/2);
	//assign RGB_out = (HPix == 0 || VPix == 0) ? 8'b00000000 : (d_out1[2 + ((HPix  - 1) % 8 + (((VPix - 1) % 2) * 8))] == 1'b1) ? 8'b11111111 : 8'b00000000;
	
	/*
	Assume the addresses are correct
	Assume VPix = 1
	HPix 1-8 
	
	*/
	
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

module pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out );
	input CLK, CLR;
	input [9:0] HPix, VPix;
	input [9:0] maxH, maxV;
	output reg [7:0] RGB_out;
		
	//memory vid_mem(CLK, w1, addr1, d_in1, d_out1, w2, addr2, d_in2, d_out2);
	
	wire [1:0] x;
	assign x = (HPix/32 + VPix/32) % 4;
	
	always @ (*) begin
		if (HPix == 0) begin RGB_out = 8'b00000000; end
		else if (VPix == 0) begin RGB_out = 8'b00000000; end
		else
			case (x)
				2'b00: RGB_out = 8'b00000000;
				2'b01: RGB_out = 8'b00011100;
				2'b10: RGB_out = 8'b11100000;
				2'b11: RGB_out = 8'b11111111;
			endcase
	end
endmodule
