`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module program_counter(
    input CLK,
    input CLR,
	 input set_addr,
	 input [13:0] in_addr,
	 input PC_inc,
    output reg[13:0] out_addr
    );
	 
	 always @(posedge CLK) begin
		if (CLR)
			out_addr <= 14'b0;
		else begin
			if (set_addr)
				out_addr <= in_addr;
			else
				out_addr <= out_addr + PC_inc;
		end
	 end


endmodule
