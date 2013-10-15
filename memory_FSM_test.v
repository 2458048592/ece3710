`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:19:32 10/15/2013
// Design Name:   memory_FSM
// Module Name:   /home/dan/Documents/xilinx_projects/projects/lab2/memory_FSM_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_FSM_test;

	// Inputs
	reg clk;
	reg clr;
	reg [4:0] ext_input;
	reg button;

	// Outputs
	wire [6:0] seg7;
	wire [3:0] select;
	 wire [14:0] addr0;
 	 wire [14:0] addr1;
	 wire [15:0] data0;
	 wire [15:0] data1;
	// Instantiate the Unit Under Test (UUT)
	memory_FSM uut (
		.clk(clk), 
		.clr(clr), 
		.ext_input(ext_input), 
		.button(button), 
		.seg7(seg7), 
		.select(select),
		.addr0(addr0),
		.addr1(addr1),
		.data0(data0),
		.data1(data1)
	);
	integer i;

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		ext_input = 0;
		button = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		clr = 1;
		#2 clr = 0;
		#500
		for (i =0; i < 2**5; i = i + 1) begin
			ext_input = i;
			#800000;
		end
		// Add stimulus here

	end
      
	always
		#1 clk = ~clk;
endmodule

