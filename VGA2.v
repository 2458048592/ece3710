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
	
	reg [1:0] clkCount;
	reg pixCLK;
	
	always @ (posedge CLK) begin
		if (CLR) begin pixCLK = 1'b0; clkCount = 2'b0; end
		else begin
			if (clkCount < 2'b11) begin pixCLK = 1'b0; clkCount = clkCount + 1'b1; end
			else begin pixCLK = 1'b1; clkCount = 2'b0; end
		end
	end
	
	wire pix;
	assign pix = !(HPix/320) ^ !(VPix/240);
	
	assign RGB_out = {pix,pix,pix,pix,pix,pix,pix,pix};
	
	hCounter _hCounter( pixCLK, CLR, VCntEna, HSync, HPix );
	vCounter _vCounter( pixCLK, CLR, VCntEna, VSync, VPix );

endmodule
