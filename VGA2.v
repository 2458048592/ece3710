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
	
	wire [11:0] addr1, addr2;
	
	
	//pixelGen2 _pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out );
	pixelGen3 _pixelGen( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr1, addr2, d_out1, d_out2 );
	
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

// This module displays the entire alphabet on each line
module pixelGen2( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr1, d_out1 );
	input CLK, CLR;
	input [9:0] HPix, VPix;
	input [9:0] maxH, maxV;
	output reg [7:0] RGB_out;

	output [11:0] addr1;
	wire [11:0] addr2;
	wire [17:0] d_in1, d_in2, d_out2;
	output [17:0] d_out1;
	
	vidMemory vid_mem(CLK, w1, addr1, d_in1, d_out1, CLK, w2, addr2, d_in2, d_out2);
	
	assign addr1 = (HPix == 0 || VPix == 0) ? 12'b0000000000 : 4*((HPix - 1)/8) + (((VPix - 1) % 8)/2);
	
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

// This module remembers a set of glyphs for each line.
// 80 glyphs per row, 27 memory addresses*3 = 81, but only 80
// can be displayed.  27 memory addresses*60 total lines = 1620 memory
// addresses for the full screen.
// 4096 memory addresses for this video memory
// 164 for the alphabet as written, so if we start at address 256,
// we stop at 1875
module pixelGen3( CLK, CLR, maxH, maxV, HPix, VPix, RGB_out, addr1, addr2, d_out1, d_out2 );
	input CLK, CLR;
	input [9:0] HPix, VPix;
	input [9:0] maxH, maxV;
	output reg [7:0] RGB_out;

	output [11:0] addr2;
	output reg [11:0] addr1;
	//wire [11:0] addr2;
	wire [17:0] d_in1, d_in2;
	output [17:0] d_out1, d_out2;
	
	wire w1, w2;
	assign w1 = 0;
	assign w2 = 0;
	assign d_in1 = 0;
	assign d_in2 = 0;
	
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
	assign addr2 = 256 + (HPix - 1)/24 + ((VPix - 1)/8)*27;	
	
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
	
	always @ (*) begin
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
		
	//vidMemory vid_mem(CLK, w1, addr1, d_in1, d_out1, w2, addr2, d_in2, d_out2);
	
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
