`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA_Top( CLK, CLR, hSync, nhSync, hBright, vSync, nvSync, vBright, VidOut );
	input CLK, CLR;
	output hSync, nhSync, hBright, vSync, nvSync, vBright, VidOut;
	
	assign nhSync = ~hSync;
	assign nvSync = ~vSync;
	assign VidOut = hBright && vBright;	
	
	wire [8:0] Hcnt;
	wire [9:0] Vcnt;
	wire [6:0] HA;

	hVideo h1( CLK, CLR, hSync, vCntEna, hBright, Hcnt, HA );
	vVideo v1( CLK, CLR, vCntEna, vSync, vBright, Vcnt );

endmodule
