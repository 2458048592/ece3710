`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:59:36 11/03/2013
// Design Name:   CPU
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/CPU_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test;

	// Inputs
	reg CLK;
	reg CLR;

	// Outputs
	wire PC_inc;
	wire set_addr;
	wire [15:0] B;
	wire [15:0] aluOut;
	wire [17:0] a_din;
	wire [17:0] a_dout;
	wire [17:0] b_din;
	wire [17:0] b_dout;
	wire [14:0] a_addr;
	wire [14:0] b_addr;
	wire [4:0] FLAGS;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.PC_inc(PC_inc), 
		.set_addr(set_addr), 
		.B(B), 
		.aluOut(aluOut), 
		.a_din(a_din), 
		.a_dout(a_dout), 
		.b_din(b_din), 
		.b_dout(b_dout), 
		.a_addr(a_addr), 
		.b_addr(b_addr), 
		.FLAGS(FLAGS)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CLR = 1;
		#9 CLR = 0;
        
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;

      
endmodule

