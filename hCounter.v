`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module hCounter( CLK, CLR, VCntEna, HSync, HPix );
	input CLK, CLR;
	output reg VCntEna;
	output reg HSync;
	output reg [9:0] HPix;
	reg [9:0] HCnt;

	parameter SCANLINE = 800;
	parameter DISPLAY = 640;
	parameter SYNC = 96;
	parameter FRONT_PORCH = 16;
	parameter BACK_PORCH = 48;
	
	always @ (posedge CLK) begin
		if (CLR) begin HCnt = 10'b0; end
		else begin
			if (HCnt < SCANLINE) begin HCnt = HCnt + 1'b1; end
			else begin HCnt = 10'b0; end
		end
	end
	
	always @ (*) begin
		if (HCnt == SCANLINE) begin
			VCntEna = 1'b1;
		end
		else begin
			VCntEna = 1'b0;
		end
	end

	always @ (*) begin
		if (HCnt < SYNC) begin
			HSync = 1'b0;
		end
		else begin
			HSync = 1'b1;
		end
	end
	
	always @ (posedge CLK) begin
		if (CLR) begin HPix = 10'b0; end
		else begin
			if ((HCnt >= (SYNC + BACK_PORCH)) && (HCnt < (SCANLINE - FRONT_PORCH))) begin HPix = HPix + 1'b1; end
			else begin HPix = 10'b0; end
		end
	end

endmodule
