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
	input clr
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
	 parameter State16 = 16;

	 // Declare states
	 reg [5:0] PS, NS;

	// Output 
	always@(PS, ext_input) begin
		case(PS)
			State0 : begin
			  // load 1 into r0 
			  
			end
			State1 : begin
			  // Load 1 into r1
			 
			end
			State2 : begin
			  // r2 = r1 + r0
			  // 2  = 1  + 1
			  
			end
			State3 : begin
			  // r3 = r2 + r1
			  // 3  = 2  + 1
			  
			end
			State4 : begin
			  // r4 = r3 + r2
			  // 5  = 3  + 2
			 
			end
			State5 : begin
			  // r5 = r4 + r3
			  // 8  = 5  + 3
			  
			end
			State6 : begin
			  // r6 = r5 + r4
			  // 13 = 8  + 5
			 
			end
			State7 : begin
			  // r7 = r6 + r5
			  // 21 = 13 + 8
			  
			end
			State8 : begin
			  // r8 = r7 + r6
			  // 34 = 21 + 13
			 
			end
			State9 : begin
			  // r9 = r8 + r7
			  // 55 = 34 + 21
			  
			end
			State10 : begin
			  // r10 = r9 + r8
			  // 89 = 55 + 34
			  
			end
			State11 : begin
			  // r11 = r10 + r9
			  // 144 = 89  + 55
			  
			end
			State12 : begin
			  // r12 = r11 + r10
			  // 233 = 144 + 89
			 
			end
			State13 : begin
			  // r13 = r12 + r11
			  // 377 = 233 + 144
			 
			end
			State14 : begin
			  // r14 = r13 + r12
			  // 610 = 377 + 233
			  
			end
			State15 : begin
			  // r15 = r14 + r13
			  // 987 = 610 + 377
			 
			end
			State16 : begin
				// State16 is the final state in the Controller.
				// ext_input determines which register value to display on the 7 segment displays.
				// values of 0-15 on ext_input selects r0-r15
				
			end
			default: begin 
			  // r15 = r15 | r15
			  // 1597= 1597| 1597
			 
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
			State16 : NS = State16;
			default : NS = State0;
		endcase

endmodule
