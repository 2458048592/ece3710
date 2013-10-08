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
	output reg[14:0] address
    );
// Give names to states
	 parameter State0 = 0; parameter State1 = 1;
	 parameter State2 = 2; parameter State3 = 3; 
	 

	 // Declare states
	 reg [1:0] PS, NS;

	// Output 
	always@(PS) begin
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
			State1 : NS = State0;
			State2 : NS = State3;
			State3 : NS = State4;
			default : NS = State0;
		endcase

endmodule
