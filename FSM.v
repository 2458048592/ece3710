`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:04 04/17/2013 
// Design Name: 
// Module Name:    FSM 
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
module FSM(
	 input clk,
	 input clr,
    output reg[1:0] ALU_cont,
    output reg[2:0] en_reg,
    output reg[4:0] en_buffer,
	 output tri [3:0] data_out
    );
	 
	 // Give names to states
	 parameter State0 = 0; parameter State1 = 1;
	 parameter State2 = 2; parameter State3 = 3; 
	 parameter State4 = 4; parameter State5 = 5;
	 parameter State6 = 6; parameter State7 = 7;
	 parameter State8 = 8; parameter State9 = 9;
	 parameter State10 = 10; parameter State11 = 11;
	 parameter State12 = 12; parameter State12 = 12;
	 parameter State13 = 13; parameter State13 = 13;
	 parameter State13 = 14; parameter State13 = 15;

	 // Declare states
	 reg [3:0] PS, NS;
	// Output
	assign data_out = (PS == State2) ? 3 : 4'bz;
	always@(*) begin
		case(PS)
			State0 : begin
				// resets all registers
				en_reg <= 3'b000;
				en_buffer <= 5'b00000;
				ALU_cont <= 2'b00;
			end
			State1 : begin
				// loads external data in R1
				en_reg <= 3'b100; // enable reg 1
				en_buffer <= 5'b11000; // enable buffer 1 and 2
				ALU_cont <= 2'b00;

			end
			State2 : begin
				// load 3 in R2
				en_reg <= 3'b010; // enable R2
				en_buffer <= 5'b00100; // enable buffer 3
				ALU_cont <= 2'b00;

			end
			State3 : begin
				// Rout <= R1 + R2
				en_reg <= 3'b001; //enable Rout
				ALU_cont <= 2'b11; //select add
				en_buffer <= 5'b00000;
			end
			State4 : begin
				// R2 <- Rout
				en_buffer <= 5'b00110; // enable buffer 4 and 3
				en_reg <= 3'b010; // enable R2
				ALU_cont <= 2'b00;

			end
			State5 : begin
				// Rout <- R1 | R2
				en_reg <= 3'b001; //enable Rout
				ALU_cont <= 2'b01; //select or
				en_buffer <= 5'b00000;
				
			end
			State6 : begin
				// R1 <- Rout
				en_buffer <= 5'b01010; // enable buffer 4 and 2
				en_reg <= 3'b100; // enable R1
				ALU_cont <= 2'b00;

			end
			State7 : begin
				// Rout <- ~R1
				en_reg <= 3'b001; //enable Rout
				ALU_cont <= 2'b00; //select not
				en_buffer <= 5'b00000;
			end
			State8 : begin
				// R1 <- Rout
				en_buffer <= 5'b01010; // enable buffer 4 and 2
				en_reg <= 3'b100; // enable R1
				ALU_cont <= 2'b00;

				
			end
			State9 : begin
				// Rout <- R1 ^ R2
				en_reg <= 3'b001; //enable Rout
				ALU_cont <= 2'b10; //select xor
				en_buffer <= 5'b00001; // enable buffer 5
			end
			default: begin 
				en_reg <= 3'b000;
				en_buffer <= 5'b00000;
				ALU_cont <= 2'b00;
			end
		endcase
	end
	// Present state
	always@(posedge clk) begin
			if (clr)
				PS <= State0;
			else 
				PS <= NS;
	end
		
		// Next state
	always@(*)
		case(PS)
			State0 : NS <= State1;
			State1 : NS <= State2;
			State2 : NS <= State3;
			State3 : NS <= State4;
			State4 : NS <= State5;
			State5 : NS <= State6;
			State6 : NS <= State7;
			State7 : NS <= State8;
			State8 : NS <= State9;
			State9 : NS <= State9;// display
			default : NS <= State0;
		endcase
				
endmodule