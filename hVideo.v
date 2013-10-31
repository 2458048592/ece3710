`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module hVideo( CLK, CLR, hSync, vCntEna, hBright, Hcnt, HA );
	// CLK is a 10MHz square-wave clock
	input CLK, CLR;
	output reg hSync, vCntEna, hBright;
	output [6:0] HA;
	output reg [8:0] Hcnt; // counter from 0 to 299
	
	always @ (posedge CLK, posedge CLR) begin
		if (CLR) begin Hcnt <= 0; hSync <= 1'b1; vCntEna <= 1'b0; hBright <= 1'b0; end
		else begin
			if (Hcnt < 299) begin 
				Hcnt <= Hcnt + 1; hSync <= 1'b1; vCntEna <= 1'b0; hBright <= 1'b0;
			
				if (Hcnt == 1) hSync <= 1'b0;
				else if (Hcnt  < 20) hSync <= 1'b0;
				else hSync <= 1'b1;
			
				if (Hcnt == 5) vCntEna <= 1'b1;
				else vCntEna <= 1'b0;

				if (Hcnt == 127) hBright <= 1'b1;
				else if (Hcnt < 255 && Hcnt > 127) hBright <= 1'b1;
				else hBright <= 1'b0;
			end
			else begin Hcnt <= 0; hSync <= 1'b1; vCntEna <= 1'b0; hBright <= 1'b0; end
		end
	end
	
	assign HA = Hcnt[6:0];

endmodule
