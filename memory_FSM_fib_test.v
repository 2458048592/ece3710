`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:03:21 10/10/2013
// Design Name:   memory_FSM_fib
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/memory_FSM_fib_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_FSM_fib
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_FSM_fib_test;

	// Inputs
	reg clk;
	reg clr;
	reg [5:0] ext_input;

	// Outputs
	wire [14:0] addr0;
	wire [14:0] addr1;
	wire w0;
	wire w1;
	wire [15:0] data0;
	wire [15:0] data1;

	// Instantiate the Unit Under Test (UUT)
	memory_FSM_fib uut (
		.clk(clk), 
		.clr(clr), 
		.ext_input(ext_input), 
		.addr0(addr0), 
		.addr1(addr1), 
		.w0(w0), 
		.w1(w1), 
		.data0(data0), 
		.data1(data1)
	);
	integer i;
	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		ext_input = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#5 clr = 1;
		#1 clr = 0;
		for (i =0; i < 2**5; i = i + 1) begin
			ext_input = i;
			#2;
		end
        
		// Add stimulus here

	end
      
	always
		#1 clk = ~clk;
endmodule

