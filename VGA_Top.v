`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA_Top( CLK, CLR, hSync, nhSync, hBright, vSync, nvSync, vBright, VidOut, Hcnt, Vcnt );
	input CLK, CLR;
	output hSync, nhSync, hBright, vSync, nvSync, vBright, VidOut;
	
	assign nhSync = ~hSync;
	assign nvSync = ~vSync;
	assign VidOut = hBright && vBright;	
	
	output [11:0] Hcnt;
	output [20:0] Vcnt;

	hVideo h1( CLK, CLR, hSync, vBright, hBright, Hcnt );
	vVideo v1( CLK, CLR, vSync, vBright, Vcnt );

endmodule
