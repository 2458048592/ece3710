`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module hVideo( CLK, CLR, hSync, vBright, hBright, Hcnt );
	// CLK is a 10MHz square-wave clock
	input CLK, CLR, vBright;
	output reg hSync, hBright;
	output reg [11:0] Hcnt; // counter from 0 to 2990
	
	parameter HFRONT_PORCH = 94; // 94 10ns clock cycles = 0.94 us
	parameter HBACK_PORCH = 189; // 189 10ns clock cycles = 1.89 us
	parameter HSYNC = 377; // 377 10ns clock cycles = 3.77 us
	parameter HDISPLAY = 2517; // 2517 10ns clock cycles = 25.17 us
	parameter SCANTIME = 3177; // 3177 10ns clock cycles = 31.77 us
	
	initial begin
		hBright = 1'b0;
		hSync = 1'b1;
		Hcnt <= 0;
	end
	
	always @ (posedge CLK) begin
		if (CLR) Hcnt <= 0;
		else begin
			if (vBright) begin
				if (Hcnt < SCANTIME) Hcnt <= Hcnt + 1;
				else Hcnt <= 0;
			end
			else Hcnt <= 0;
		end
	end
	
	always @ (Hcnt) begin
		if (Hcnt < (SCANTIME - HFRONT_PORCH) && Hcnt > (HSYNC + HBACK_PORCH)) hBright <= 1'b1;
		else hBright <= 1'b0;
	end
	
	always @ (Hcnt) begin
		if (Hcnt  < HSYNC) hSync <= 1'b0;
		else hSync <= 1'b1;	
	end

endmodule
