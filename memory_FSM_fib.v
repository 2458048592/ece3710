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
	input [4:0] ext_input,
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
	reg [1:0] count;
	
	// Output 
	always@(*) begin
		case(PS) 
			State31 : begin
				w0 = 0;
				w1 = 0;
				addr0 = {ext_input[4:0], 10'b0000000000};
				addr1 = {ext_input[4:0], 10'b1111111111};
				data0 = {5'b11111,4'b1010};
				data1 = {5'b11111,4'b1110};	
			end
			default: begin 
			 	w0 = 1;
				w1 = 1;
				addr0 = {PS[4:0],10'b0000000000};
				addr1 = {PS[4:0],10'b1111111111};
				data0 = {PS[4:0],4'b1010};
				data1 = {PS[4:0],4'b1110};
			end
		endcase
	end

	// Present state
	always@(negedge clk) begin
		if (clr)
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
