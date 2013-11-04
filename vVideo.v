`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module vVideo( CLK, CLR, vSync, vBright, Vcnt );
	input CLK, CLR;
	output reg vSync, vBright;
	output reg [20:0] Vcnt;
	
	parameter VSYNC = 6000; // 6000 10ns clock cycles = 0.06ms
	parameter VBACK_PORCH = 102000; // 102000 10ns clock cycles = 1.02ms
	parameter VFRONT_PORCH = 35000; // 35000 10ns clock cycles = 0.35ms
	parameter VDISPLAY = 1525000; // 1525000 10ns clock cycles = 15.25ms
	parameter SCANTIME = 1668000; // 1668000 10ns clock cycles = 16.68ms
	
	initial begin
		vSync = 1'b1;
		vBright = 1'b0;
		Vcnt = 1'b0;
	end

	always @ (posedge CLK) begin
		if (CLR) begin Vcnt <= 0; end
		else begin
			if (Vcnt < SCANTIME)	Vcnt <= Vcnt + 1;
			else Vcnt <= 0;
		end
	end
	
	always @ (Vcnt) begin
		if (Vcnt < (SCANTIME - VFRONT_PORCH) && Vcnt > (VSYNC + VBACK_PORCH)) vBright <= 1'b1;
		else vBright <= 1'b0;
	end

	always @ (Vcnt) begin
		if (Vcnt < VSYNC) vSync <= 1'b1;
		else vSync <= 1'b0;
	end

endmodule
