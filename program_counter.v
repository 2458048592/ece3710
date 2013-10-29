`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:52 10/29/2013 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
    input CLK,
    input CLR,
	 input set_addr,
	 input [14:0] in_addr,
    output reg[14:0] out_addr
    );
	 
	 always @(posedge CLK) begin
		if (CLR)
			out_addr <= 15'b0;
		else begin
			if (set_addr)
				out_addr <= in_addr;
			else
				out_addr <= out_addr + 15'b000000000000001;
		end
	 end


endmodule
