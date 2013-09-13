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
   output reg selectImm,
   output reg[3:0] loadReg, readRegA, readRegB,
   output reg[7:0] Imm, op
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

   parameter ADD = 8'b00000101;
   parameter OR = 8'b00000010;

	 // Declare states
	 reg [5:0] PS, NS;

	// Output 
	always@(*) begin
		case(PS)
			State0 : begin
			  // load 1 into r0 
			  selectImm <= 1'b1;
			  loadReg <= 4'b0000; 
			  readRegA <= 4'b0000;
			  readRegB <= 4'b0000;
			  Imm <= 8'b00000001;
			  op <= ADD;
			end
			State1 : begin
			  // r1 = r0 + r0
			  selectImm <= 1'b0;
			  loadReg <= 4'b0001; 
			  readRegA <= 4'b0000;
			  readRegB <= 4'b0000;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State2 : begin
			  // r2 = r1 + r0
			  selectImm <= 1'b0;
			  loadReg <= 4'b0010; 
			  readRegA <= 4'b0001;
			  readRegB <= 4'b0000;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State3 : begin
			  // r3 = r2 + r1
			  selectImm <= 1'b0;
			  loadReg <= 4'b0011; 
			  readRegA <= 4'b0010;
			  readRegB <= 4'b0001;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State4 : begin
			  // r4 = r3 + r2
			  selectImm <= 1'b0;
			  loadReg <= 4'b0100; 
			  readRegA <= 4'b0011;
			  readRegB <= 4'b0010;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State5 : begin
			  // r5 = r4 + r3
			  selectImm <= 1'b0;
			  loadReg <= 4'b0101; 
			  readRegA <= 4'b0100;
			  readRegB <= 4'b0011;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State6 : begin
			  // r6 = r5 + r4
			  selectImm <= 1'b0;
			  loadReg <= 4'b0110; 
			  readRegA <= 4'b0101;
			  readRegB <= 4'b0100;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State7 : begin
			  // r7 = r6 + r5
			  selectImm <= 1'b0;
			  loadReg <= 4'b0111; 
			  readRegA <= 4'b0110;
			  readRegB <= 4'b0101;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State8 : begin
			  // r8 = r7 + r6
			  selectImm <= 1'b0;
			  loadReg <= 4'b1000; 
			  readRegA <= 4'b0111;
			  readRegB <= 4'b0110;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State9 : begin
			  // r9 = r8 + r7
			  selectImm <= 1'b0;
			  loadReg <= 4'b1001; 
			  readRegA <= 4'b1000;
			  readRegB <= 4'b0111;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State10 : begin
			  // r10 = r9 + r8
			  selectImm <= 1'b0;
			  loadReg <= 4'b1010; 
			  readRegA <= 4'b1001;
			  readRegB <= 4'b1000;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State11 : begin
			  // r11 = r10 + r9
			  selectImm <= 1'b0;
			  loadReg <= 4'b1011; 
			  readRegA <= 4'b1010;
			  readRegB <= 4'b1001;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State12 : begin
			  // r12 = r11 + r10
			  selectImm <= 1'b0;
			  loadReg <= 4'b1100; 
			  readRegA <= 4'b1011;
			  readRegB <= 4'b1010;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State13 : begin
			  // r13 = r12 + r11
			  selectImm <= 1'b0;
			  loadReg <= 4'b1101; 
			  readRegA <= 4'b1100;
			  readRegB <= 4'b1011;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State14 : begin
			  // r14 = r13 + r12
			  selectImm <= 1'b0;
			  loadReg <= 4'b1110; 
			  readRegA <= 4'b1101;
			  readRegB <= 4'b1100;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State15 : begin
			  // r15 = r14 + r13
			  selectImm <= 1'b0;
			  loadReg <= 4'b1111; 
			  readRegA <= 4'b1110;
			  readRegB <= 4'b1101;
			  Imm <= 8'b00000000;
			  op <= ADD;
			end
			State16 : begin
			  // r15 = r15 | r15
			  selectImm <= 1'b0;
			  loadReg <= 4'b1111; 
			  readRegA <= 4'b1111;
			  readRegB <= 4'b1111;
			  Imm <= 8'b00000000;
			  op <= OR;
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
			State15 : NS <= State16;
			State16 : NS <= State16;
			default : NS <= State0;
		endcase
				
endmodule
