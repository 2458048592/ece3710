`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:11 12/07/2013 
// Design Name: 
// Module Name:    random_num_gen 
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
module random_num_gen(
  input clk,
  output reg [9:0] data);
  wire [4:0] low;
  wire [4:0] high;
  
  fibonacci_lfsr_5bit first(clk, low);
  
  always @(posedge clk)
	begin
			data <= {low,low};
	end
		
			
endmodule

module fibonacci_lfsr_5bit(
  input clk,
  output reg [4:0] data
);
initial begin
	data = 5'h1f;
end
reg [4:0] data_next;

always @* begin
  data_next[4] = data[4]^data[1];
  data_next[3] = data[3]^data[0];
  data_next[2] = data[2]^data_next[4];
  data_next[1] = data[1]^data_next[3];
  data_next[0] = data[0]^data_next[2];
end

always @(posedge clk)
    data <= data_next;

endmodule


