`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module instruction_FSM_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg [15:0] inst;
	reg [4:0] _FLAGS;

	// Outputs
	wire PC_inc;
	wire JAddrSelect;
	wire loadReg;
	wire [4:0] FLAGS;

	// Instantiate the Unit Under Test (UUT)
	instruction_FSM uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.inst(inst), 
		._FLAGS(_FLAGS),
		.PC_inc(PC_inc), 
		.JAddrSelect(JAddrSelect), 
		.loadReg(loadReg)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		inst = 0;
		_FLAGS = 0;

		// Wait 100 ns for global reset to finish
		#8;
		// Add stimulus here
		// ADD r1 r0
		inst = 16'b0000000101010000;
		#6;
		// ADDC r2 r1
		inst = 16'b0000001001110001;
		#6;
		// CMP r3 r15
		inst = 16'b0000001110111111;
		#6;
		// RSH r1 r2
		inst = 16'b1000000111000010;
		#6;
		// LUI r1 16
		inst = 16'b1111000100010000;
		#6;
		// JUC r5
		inst = 16'b0100010111001110;
		#6;
		// BEQ r1 // Should Jump after 3 cycles (6ns)
		_FLAGS = 5'b00010;
		inst = 16'b0100000111000000;
		#4;
		_FLAGS = 5'b00000;
		#2;
		// BEQ r1 // Should NOT Jump after 3 cycles (6ns)
		_FLAGS = 5'b00000;
		inst = 16'b0100000111000000;
		#4;
		_FLAGS = 5'b00010;
		#2;
		// BNEQ r14 // Should Jump after 3 cycles (6ns)
		_FLAGS = 5'b00000;
		inst = 16'b0100111011000001;
		#4;
		_FLAGS = 5'b00010;
		#2;
		// BNEQ r14 // Should NOT Jump after 3 cycles (6ns)
		_FLAGS = 5'b00010;
		inst = 16'b0100111011000001;
		#4;
		_FLAGS = 5'b00000;
		#2;
		// LOAD r15 r4
		inst = 16'b0100111100000100;
		#8;
		// STOR r15 r4
		inst = 16'b0100111101000100;
		#8;
		$finish;
	end
	
	always begin CLK = ~CLK; #1; end
      
endmodule

