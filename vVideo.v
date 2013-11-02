`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module vVideo( CLK, CLR, vCntEna, vSync, vBright, Vcnt );
	input CLK, CLR, vCntEna;
	output reg vSync, vBright;
	output reg [9:0] Vcnt;

	always @ (posedge CLK, posedge CLR) begin
		if (CLR) begin Vcnt <= 0; vSync <= 1'b0; vBright <= 1'b0; end
		else begin
			if (vCntEna == 1'b1) begin
				if (Vcnt < 555) Vcnt <= Vcnt + 1;
				else Vcnt <= 0;
				
				if (Vcnt < 255 && Vcnt >= 0) vBright <= 1'b1;
				else vBright <= 1'b0;
				
				if (Vcnt > 391 && Vcnt <= 393) vSync <= 1'b1;
				else vSync <= 1'b0;
			end
		end
	end

endmodule
