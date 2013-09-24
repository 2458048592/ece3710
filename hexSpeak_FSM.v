`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// Module Name:    hexSpeak_FSM 
// Description: hexSpeak_FSM is a finite state machine which generates hex codes
//      which appear to be words.
//
//////////////////////////////////////////////////////////////////////////////////
module hexSpeak_FSM(
	 input clk,
	 input clr,
	 input [3:0] ext_input,
	 output reg selectImm,
	 output reg[4:0] loadReg,
    output reg[3:0] readRegA, readRegB,
    output reg[7:0] Imm, op
    );
	 
	 
	 parameter ADDU = 8'b00000110;
	 parameter ADDUI = 8'b01100000;
	 parameter AND = 8'b00000001;
	 parameter OR = 8'b00000010;
	 parameter NOT = 8'b00001111;
	 parameter XOR = 8'b00000011;
	 parameter LSHI = 8'b10000000; // Imm is unsigned
	 parameter RSHI = 8'b10000001; // Imm is unsigned
	 
	// create 8BAD in r2.
	parameter state0 = 0; // ADDI r14, 01110100 and store in r14
	parameter state1 = 1; // NOT r14 and store in r14
	parameter state2 = 2; // LSHI r14, 8'b00001000
	parameter state3 = 3; // ADDI r7, 10101101
	parameter state4 = 4; // ADDI r0, 11111111
	parameter state5 = 5; // XOR r0, r7 store in r7
	parameter state6 = 6; // LSHI r7 by 8, store in r7
	parameter state7 = 7; // RSHI r7 by 8, store in r7
	parameter state8 = 8; // ADD r14, r7 and store in r2
	// create F00D in r3.
	parameter state9 = 9; // LSHI r0 (11111111) by 00001100 and store in r12
	parameter state10 = 10; // ADDI r13, 00001101 and store in r13
	parameter state11 = 11; // AND r0, r13 and store in r13
	parameter state12 = 12; // ADD r12, r13 and store in r3
	// create DEAD in r11.
	parameter state13 = 13; // ADDI r4 (16'b0) with 11010000 and store in r5
	parameter state14 = 14; // ADDI r4 (16'b0) with 00001110 and store in r6
	parameter state15 = 15; // OR r5, r6 and store in r11
	parameter state16 = 16; // LSHI r11, 8'b00001000 and store in r11
	parameter state17 = 17; // ADDI r4, 8'b10101101 and store in r8
	parameter state18 = 18; // LSHI r8, 8'b00001000 and store in r8
	parameter state19 = 19; // RSHI r8, 8'b00001000 and store in r8
	parameter state20 = 20; // ADD r8, r11, and store in r11
	// create BEEF in r15.
	parameter state21 = 21; // ADDI r6 (00001110) with 10110000 and store in r5
	parameter state22 = 22; // LSHI r5, 8'b00001000 and store in r5
	parameter state23 = 23; // LSHI r6, 8'b00000100 and store in r6
	parameter state24 = 24; // ADDI r6, 8'b00001111 and store in r15
	//parameter state25 = 25; // LSHI r6, 8'b00001000 and store in r6
	//parameter state26 = 26; // RSHI r6, 8'b00001000 and store in r15
	parameter state25 = 25; // ADD r5, r15 and store in r15
	// clear out temp registers NOT NECESSARY
	//parameter state28 = 28; // NOT r0 and store in r0
	//parameter state29 = 29; // ADDI r0, 0 and store in r5
	//parameter state30 = 30; // ADDI r0, 0 and store in r6
	//parameter state31 = 31; // ADDI r0, 0 and store in r14
	//parameter state32 = 32; // ADDI r0, 0 and store in r7
	//parameter state33 = 33; // ADDI r0, 0 and store in r12
	//parameter state34 = 34; // ADDI r0, 0 and store in r13
	// Display state.  Use ext_input to display the values in r2 and r3
	parameter state26 = 26;
	
	reg [4:0] PS, NS;
	
	always @ (PS, ext_input) begin
		case (PS)
			state0: begin
				// ADDI r14, 01110100 and store in r14
				op = ADDUI;
				loadReg = 5'b01110;
				readRegA = 4'b1110;
				readRegB = 4'b1110;
				selectImm = 1'b1;
				Imm = 8'b01110100;
			end
			state1: begin
				// NOT r14 and store in r14
				op = NOT;
				loadReg = 5'b01110;
				readRegA = 4'b1110;
				readRegB = 4'b1110;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state2: begin
				// LSHI r14, 8'b00001000 store in r14
				op = LSHI;
				loadReg = 5'b01110;
				readRegA = 4'b1110;
				readRegB = 4'b1110;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state3: begin
				// ADDI r7, 10101101
				op = ADDUI;
				loadReg = 5'b00111;
				readRegA = 4'b0111;
				readRegB = 4'b0000;
				selectImm = 1'b1;
				Imm = 8'b01010010;
			end
			state4: begin
				// ADDI r0, 11111111
				op = ADDUI;
				loadReg = 5'b00000;
				readRegA = 4'b0000;
				readRegB = 4'b0000;
				selectImm = 1'b1;
				Imm = 8'b11111111;
			end
			state5: begin
				// XOR r0, r7 store in r7
				op = XOR;
				loadReg = 5'b00111;
				readRegA = 4'b0000;
				readRegB = 4'b0111;
				selectImm = 1'b0;
				Imm = 8'b00000000;
				// Need to LSHI by 8, then RSHI by 8
			end
			state6: begin
				op = LSHI;
				loadReg = 5'b00111;
				readRegA = 4'b0111;
				readRegB = 4'b0111;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state7: begin
				op = RSHI;
				loadReg = 5'b00111;
				readRegA = 4'b0111;
				readRegB = 4'b0111;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state8: begin
				// ADD r14, r7 and store in r2
				op = ADDU;
				loadReg = 5'b00010;
				readRegA = 4'b1110;
				readRegB = 4'b0111;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state9: begin
				// LSHI r0 (11111111) by 00001100 and store in r12
				op = LSHI;
				loadReg = 5'b01100;
				readRegA = 4'b0000;
				readRegB = 4'b0000;
				selectImm = 1'b1;
				Imm = 8'b00001100;
			end
			state10: begin
				// ADDI r13, 00001101 and store in r13
				op = ADDUI;
				loadReg = 5'b01101;
				readRegA = 4'b1101;
				readRegB = 4'b1101;
				selectImm = 1'b1;
				Imm = 8'b00001101;
			end
			state11: begin
				// AND r0, r13 and store in r13
				op = AND;
				loadReg = 5'b01101;
				readRegA = 4'b1101;
				readRegB = 4'b0000;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state12: begin
				// ADD r12, r13 and store in r3
				op = ADDU;
				loadReg = 5'b00011;
				readRegA = 4'b1100;
				readRegB = 4'b1101;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state13: begin
				op = ADDUI;
				loadReg = 5'b00101;
				readRegA = 4'b0100;
				readRegB = 4'b0100;
				selectImm = 1'b1;
				Imm = 8'b11010000;
			end
			state14: begin
				op = ADDUI;
				loadReg = 5'b00110;
				readRegA = 4'b0100;
				readRegB = 4'b0100;
				selectImm = 1'b1;
				Imm = 8'b00001110;
			end
			state15: begin
				op = OR;
				loadReg = 5'b01011;
				readRegA = 4'b0110;
				readRegB = 4'b0101;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state16: begin
				op = LSHI;
				loadReg = 5'b01011;
				readRegA = 4'b1011;
				readRegB = 4'b1011;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state17: begin
				op = ADDUI;
				loadReg = 5'b01000;
				readRegA = 4'b0100;
				readRegB = 4'b0100;
				selectImm = 1'b1;
				Imm = 8'b10101101;
			end
			state18: begin
				op = LSHI;
				loadReg = 5'b01000;
				readRegA = 4'b1000;
				readRegB = 4'b1000;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state19: begin
				op = RSHI;
				loadReg = 5'b01000;
				readRegA = 4'b1000;
				readRegB = 4'b1000;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state20: begin
				op = ADDU;
				loadReg = 5'b01011;
				readRegA = 4'b1011;
				readRegB = 4'b1000;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state21: begin
				op = ADDUI;
				loadReg = 5'b00101;
				readRegA = 4'b0110;
				readRegB = 4'b0110;
				selectImm = 1'b1;
				Imm = 8'b10110000;
			end
			state22: begin
				op = LSHI;
				loadReg = 5'b00101;
				readRegA = 4'b0101;
				readRegB = 4'b0101;
				selectImm = 1'b1;
				Imm = 8'b00001000;
			end
			state23: begin
				op = LSHI;
				loadReg = 5'b00110;
				readRegA = 4'b0110;
				readRegB = 4'b0110;
				selectImm = 1'b1;
				Imm = 8'b00000100;
			end
			state24: begin
				op = ADDUI;
				loadReg = 5'b01111;
				readRegA = 4'b0110;
				readRegB = 4'b0110;
				selectImm = 1'b1;
				Imm = 8'b00001111;
			end
			//state25: begin
			//	op = LSHI;
			//	loadReg = 5'b00110;
			//	readRegA = 4'b0110;
			//	readRegB = 4'b0110;
			//	selectImm = 1'b1;
			//	Imm = 8'b00001000;
			//end
			//state26: begin
			//	op = RSHI;
			//	loadReg = 5'b01111;
			//	readRegA = 4'b0110;
			//	readRegB = 4'b0110;
			//	selectImm = 1'b1;
			//	Imm = 8'b00001000;
			//end
			state25: begin
				op = ADDU;
				loadReg = 5'b01111;
				readRegA = 4'b1111;
				readRegB = 4'b0101;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			state26: begin
				// Use ext_input to display the values in r2 and r3
				op = OR;
				loadReg = 5'b10000;
				readRegA = ext_input;
				readRegB = ext_input;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
			default: begin
				// Use ext_input to display the values in r2 and r3
				op = OR;
				loadReg = 5'b10000;
				readRegA = ext_input;
				readRegB = ext_input;
				selectImm = 1'b0;
				Imm = 8'b00000000;
			end
		endcase
	end
	
	// Present state
	always@(posedge clk) begin
			if (clr)
				PS <= state0;
			else 
				PS <= NS;
	end
		
		// Next state
	always@(PS)
		case(PS)
			state0 : NS = state1;
			state1 : NS = state2;
			state2 : NS = state3;
			state3 : NS = state4;
			state4 : NS = state5;
			state5 : NS = state6;
			state6 : NS = state7;
			state7 : NS = state8;
			state8 : NS = state9;
			state9 : NS = state10;
			state10 : NS = state11;
			state11 : NS = state12;
			state12 : NS = state13;
			state13 : NS = state14;
			state14 : NS = state15;
			state15 : NS = state16;
			state16 : NS = state17;
			state17 : NS = state18;
			state18 : NS = state19;
			state19 : NS = state20;
			state20 : NS = state21;
			state21 : NS = state22;
			state22 : NS = state23;
			state23 : NS = state24;
			state24 : NS = state25;
			state25 : NS = state26;
			state26 : NS = state26;
			//state27 : NS = state28;
			//state28 : NS = state28;
			default : NS = state0;
		endcase

endmodule
