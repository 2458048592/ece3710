`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module decoder_tb;

	// Inputs
	reg [17:0] inst;

	// Outputs
	wire [7:0] op;
	wire [15:0] Imm;
	wire selectImm;
	wire selectResult;
	wire w1;
	wire [3:0] readRegA;
	wire [3:0] readRegB;
	wire [3:0] loadReg;

	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.inst(inst), 
		.op(op), 
		.Imm(Imm), 
		.selectImm(selectImm), 
		.selectResult(selectResult), 
		.w1(w1), 
		.readRegA(readRegA), 
		.readRegB(readRegB), 
		.loadReg(loadReg)
	);

	initial begin
		// Initialize Inputs
		inst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add st;imulus here
		inst = 16'b001101000100010100;
		#10;
		inst = 16'b000110001111001000;
		#10;
		inst = 16'b000100000101000011;
		#10;
		inst = 16'b000000010000110100;
		#10;
		inst = 16'b000100001000000001;
		#10;
		inst = 16'b000110001000000001;
		#10;
		inst = 16'b001001001000001010;
		#10;
		$finish;
	end
      
endmodule

