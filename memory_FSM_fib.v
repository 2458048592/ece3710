`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:02 10/03/2013 
// Design Name: 
// Module Name:    memory_FSM_fib 
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
module memory_FSM_fib(
	input clk,
	input clr,
	input [5:0] ext_input,
	output reg[14:0] addr0, addr1,
	output reg w0, w1,
	output reg[15:0] data0, data1
    );
// Give names to states
	 parameter State0 = 0; parameter State1 = 1;
	 parameter State2 = 2; parameter State3 = 3; 
	 

	 // Declare states
	 reg [1:0] PS, NS;
	 reg [14:0] count;
	 reg [4:0] block_count;
	 initial begin
		count = 0;
	end
	// Output 
	always@(*) begin
		case(PS) 
			State0 : begin
			  // load 1 into r0 
			  w0 = 0;
			  w1 = 0;
			  addr0 = 0;
			  addr1 = 1023;
			  data0 = 0;
			  data1 = 0;
			end
			State1 : begin
			  w0 = 1;
			  w1 = 1;
			  addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
			  data0 = {block_count,5'b1010};
			  data1 = {block_count,5'b1110};	
			end
			State2 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {block_count,5'b1010};
				data1 = {block_count,5'b1110};
				
			end
			State3 : begin
				w0 = 0;
				w1 = 0;
				addr0 = 1024 * ext_input[5:0];
				addr1 = 1024 * ext_input[5:0] + 1023;
				data0 = {block_count,5'b1010};
				data1 = {block_count,5'b1110};
			end
			default: begin 
			  w0 = 0;
			  w1 = 0;
			  addr0 = 0;
			  addr1 = 0;
			  data0 = 0;
			  data1 = 0;
			end
		endcase
	end

	// Present state
	always@(posedge clk) begin
			if (clr) begin
				PS <= State0;
				count <= 0;
				block_count <= 0;
			end
			else if (count >= 30720) begin
				PS <= State3;
				count <= 30720;
				block_count <= 30;
			end
			else begin
				block_count <= block_count + 1;
				count <= count + 1024; 
				PS <= NS;
			end
	end
		
		// Next state
	always@(PS)
		case(PS)
			State0 : NS = State1;
			State1 : NS = State2;
			State2 : NS = State1;
			State3 : NS = State3;
			default : NS = State0;
		endcase

endmodule
