`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
//
// Module Name:    hexSpeak_with_dataPath 
// Description: hexSpeak_with_dataPath instantiates all modules for Lab 2.
//
//////////////////////////////////////////////////////////////////////////////////
module fibo_and_hex(
    input clk,
    input reset,
	 input [3:0] ext_input,
	 input [1:0] FSM_select,
    output [6:0] seg7,
	 output reg [15:0] A, B, Z,
	 output reg [4:0] flags,
    output [3:0] select
    );
	 
	wire selectImm1, selectImm2;
	reg clk1, clk2;
	wire [3:0] readRegA1, readRegB1, readRegA2, readRegB2;
	wire [4:0] loadReg1, loadReg2, flags1, flags2;
	wire [7:0] Imm1, Imm2, op1, op2;
	wire [15:0] A1, A2, B1, B2, Z1, Z2;
	
	always begin
		case (FSM_select)
			2'b00: begin clk1 = clk; clk2 = 0; flags = flags1; Z = Z1; A = A1; B = B1; end
			2'b10: begin clk1 = 0; clk2 = clk; flags = flags2; Z = Z2; A = A2; B = B2; end
			default: begin clk1 = clk; clk2 = 0; flags = flags1; Z = Z1; A = A1; B = B1; end
		endcase
	end
	
	// Correct input/output ordering for FSM module
	// input clk,
	// input clr,
	// input [3:0] ext_input,
   	// output reg selectImm,
	// output reg[4:0] loadReg,
   	// output reg[3:0] readRegA, readRegB,
   	// output reg[7:0] Imm, op
	FSM fsm(clk1, reset,ext_input, selectImm1, loadReg1, readRegA1, readRegB1, Imm1, op1);
	hexSpeak_FSM hexSpeak(clk2, reset,ext_input, selectImm2, loadReg2, readRegA2, readRegB2, Imm2, op2);
	
	// Correct input/output ordering for datapath module
	//input CLK, CLR, selectImm,
	//input [4:0] loadReg,
	//input [3:0] readRegA, readRegB,
	//input [7:0] Imm, op,
	//output [15:0] A, B, Z,
	//output [4:0] flags
	
	
	dataPath data1(clk1, reset, selectImm1, loadReg1, readRegA1, readRegB1, Imm1, op1, A1, B1, Z1, flags1);
	dataPath data2(clk2, reset, selectImm2, loadReg2, readRegA2, readRegB2, Imm2, op2, A2, B2, Z2, flags2);
	
	// Correct input/output ordering for SSD_decoder module
	//input clk,
	// input clr,
   	// input [15:0] number,
   	// output reg [6:0] ssOut,
   	// output reg [3:0] select
	SSD_decoder decoder(clk, reset, Z, seg7, select);

endmodule
