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
   output selectImm,
   output reg[3:0] loadReg, readRegA, readRegB
   output reg[7:0] Imm, op
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
	always@(*) begin
		case(PS)
			State0 : begin
			end
			State1 : begin
			end
			State2 : begin
			end
			State3 : begin
			end
			State4 : begin
			end
			State5 : begin
			end
			State6 : begin
			end
			State7 : begin
			end
			State8 : begin
			end
			State9 : begin
			end
			State10 : begin
			end
			State11 : begin
			end
			State12 : begin
			end
			State13 : begin
			end
			State14 : begin
			end
			State15 : begin
			end
			default: begin 
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
			State9 : NS <= State10;
			State10 : NS <= State11;
			State11 : NS <= State12;
			State12 : NS <= State13;
			State13 : NS <= State14;
			State14 : NS <= State15;
			State15 : NS <= State15;
			default : NS <= State0;
		endcase
				
endmodule
