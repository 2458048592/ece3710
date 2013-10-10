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
	 parameter State4 = 4; parameter State5 = 5;
	 parameter State6 = 6; parameter State7 = 7; 
	 parameter State8 = 8; parameter State9 = 9; 
	 parameter State10 = 10; parameter State11 = 11; 
	 parameter State12 = 12; parameter State13 = 13; 
	 parameter State14 = 14; parameter State15 = 15; 
	 parameter State16 = 16; parameter State17 = 17; 
	 parameter State18 = 18; parameter State19 = 19; 
	 parameter State20 = 20; parameter State21 = 21; 
	 parameter State22 = 22; parameter State23 = 23; 
	 parameter State24 = 24; parameter State25 = 25; 
	 parameter State26 = 26; parameter State27 = 27; 
	 parameter State28 = 28; parameter State29 = 29; 
	 parameter State30 = 30; parameter State31 = 31; 
	 

	 // Declare states
	 reg [4:0] PS, NS;
	 reg [14:0] count;
	 reg [4:0] block_count;
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
			  addr0 = addr0;
			  addr1 = addr0 + 1023;
			  data0 = {0,5'b1010};
			  data1 = {0,5'b1110};	
			end
			State2 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {1,5'b1010};
				data1 = {1,5'b1110};
				
			end
			State3 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {2,5'b1010};
				data1 = {2,5'b1110};
				
			end
			State4 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {3,5'b1010};
				data1 = {3,5'b1110};
				
			end
			State5 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {4,5'b1010};
				data1 = {4,5'b1110};
				
			end
			State6 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {5,5'b1010};
				data1 = {5,5'b1110};
				
			end
			State7 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {6,5'b1010};
				data1 = {6,5'b1110};
				
			end
			State8 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {7,5'b1010};
				data1 = {7,5'b1110};
				
			end
			State9 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {8,5'b1010};
				data1 = {8,5'b1110};
				
			end
			State10 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {9,5'b1010};
				data1 = {9,5'b1110};
				
			end
			State11 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {10,5'b1010};
				data1 = {10,5'b1110};
				
			end
			State12 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {11,5'b1010};
				data1 = {11,5'b1110};
				
			end
			State13 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {12,5'b1010};
				data1 = {12,5'b1110};
				
			end
			State14 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {13,5'b1010};
				data1 = {13,5'b1110};
				
			end
			State15 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {14,5'b1010};
				data1 = {14,5'b1110};
				
			end
			State16 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {15,5'b1010};
				data1 = {15,5'b1110};
				
			end
			State17 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {16,5'b1010};
				data1 = {16,5'b1110};
				
			end
			State18 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {17,5'b1010};
				data1 = {17,5'b1110};
				
			end
			State19 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {18,5'b1010};
				data1 = {18,5'b1110};
				
			end
			State20 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {19,5'b1010};
				data1 = {19,5'b1110};
				
			end
			State21 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {20,5'b1010};
				data1 = {20,5'b1110};
				
			end
			State22 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {21,5'b1010};
				data1 = {21,5'b1110};
				
			end
			State23 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {22,5'b1010};
				data1 = {22,5'b1110};
				
			end
			State24 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {23,5'b1010};
				data1 = {23,5'b1110};
				
			end
			State25 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {24,5'b1010};
				data1 = {24,5'b1110};
				
			end
			State26 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {25,5'b1010};
				data1 = {25,5'b1110};
				
			end
			State27 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {26,5'b1010};
				data1 = {26,5'b1110};
				
			end
			State28 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {27,5'b1010};
				data1 = {27,5'b1110};
				
			end
			State29 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {28,5'b1010};
				data1 = {28,5'b1110};
				
			end
			State30 : begin
				w0 = 1;
				w1 = 1;
				addr0 = addr0 + 1024;
				addr1 = addr0 + 1023;
				data0 = {29,5'b1010};
				data1 = {29,5'b1110};
				
			end
			State31 : begin
				w0 = 0;
				w1 = 0;
				addr0 = ext_input[5:0] * 1024;
				addr1 = ext_input[5:0] * 1024 + 1023;
				data0 = {29,5'b1010};
				data1 = {29,5'b1110};
				
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
			else
				PS <= NS;
	end
		
		// Next state
	always@(PS)
		case(PS)
			State0 : NS = State1;
			State1 : NS = State2;
			State2 : NS = State3;
			State3 : NS = State4;
			State4 : NS = State5;
			State5 : NS = State6;
			State6 : NS = State7;
			State7 : NS = State8;
			State8 : NS = State9;
			State9 : NS = State10;
			State10 : NS = State11;
			State11 : NS = State12;
			State12 : NS = State13;
			State13 : NS = State14;
			State14 : NS = State15;
			State15 : NS = State16;
			State16 : NS = State17;
			State17 : NS = State18;
			State18 : NS = State19;
			State19 : NS = State20;
			State20 : NS = State21;
			State21 : NS = State22;
			State22 : NS = State23;
			State23 : NS = State24;
			State24 : NS = State25;
			State25 : NS = State26;
			State26 : NS = State27;
			State27 : NS = State28;
			State28 : NS = State29;
			State29 : NS = State30;
			State30 : NS = State31;
			State31 : NS = State31;
			default : NS = State0;
		endcase

endmodule
