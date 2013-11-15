`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:00 11/14/2013 
// Design Name: 
// Module Name:    gun_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module gun_top(
    input CLK,
    input CLR,
    input trigger,
	 output reg LED
   // output [6:0] seg7,
   // output [3:0] select
    );
	 	reg [26:0] regCLKCount;
	reg regCLK;
	always @ (*) begin
		if (CLR) begin regCLKCount = 27'b0; regCLK = 0; end
		else begin
			if (regCLKCount < 1) begin regCLKCount = regCLKCount + 1'b1; regCLK = 0; end
			else begin regCLKCount = 27'b0; regCLK = 1'b1; end
		end
	end
	 
	gun da_gun(CLK,CLR,trigger,LED);
	//SSD_decoder decoder(CLK, CLR, {15'b0, display}, seg7, select);

endmodule
