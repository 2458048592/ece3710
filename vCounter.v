`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module vCounter( CLK, CLR, VCntEna, VSync, VPix );
	input CLK, CLR, VCntEna;
	output reg VSync;
	output reg [9:0] VPix;
	
	reg [9:0] VCnt;
	
	parameter SCANLINE = 521;
	parameter DISPLAY = 480;
	parameter SYNC = 2;
	parameter FRONT_PORCH = 10;
	parameter BACK_PORCH = 29;
	
	always @ (posedge CLK) begin
		if (CLR) begin VCnt = 10'b0; end
		else begin
			if (VCntEna) begin
				if (VCnt < SCANLINE) begin VCnt = VCnt + 1'b1; end
				else begin VCnt = 10'b0; end
			end
			else begin
				VCnt = VCnt;
			end
		end
	end
	
	always @ (*) begin
		if (VCnt < SYNC) begin
			VSync = 1'b0;
		end
		else begin
			VSync = 1'b1;
		end
	end
	
	always @ (posedge CLK) begin
		if (CLR) begin VPix = 10'b0; end
		else begin
			if (VCntEna) begin
				if ((VCnt >= (SYNC + BACK_PORCH)) && (VCnt < SCANLINE - FRONT_PORCH) && (VPix < DISPLAY)) begin VPix = VPix + 1'b1; end
				else begin VPix = 10'b0; end
			end
			else begin
				VPix = VPix;
			end
		end
	end

endmodule
