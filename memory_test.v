`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:09 10/03/2013
// Design Name:   memory
// Module Name:   /home/shelese/Documents/dan/xilinx/projects/ece3710/lab2/memory_test.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg w0;
	reg w1;
	reg [9:0] addr0;
	reg [9:0] addr1;
	reg [17:0] data0;
	reg [17:0] data1;

	// Outputs
	wire [17:0] out0;
	wire [17:0] out1;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.w0(w0), 
		.w1(w1), 
		.addr0(addr0), 
		.addr1(addr1), 
		.data0(data0), 
		.data1(data1), 
		.out0(out0), 
		.out1(out1)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		w0 = 0;
		w1 = 0;
		addr0 = 0;
		addr1 = 0;
		data0 = 0;
		data1 = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
		
		// Write the data to the address
		w0 = 1;
		data0 = 42;
		addr0 = 1;
		#2;
		// Read the data from the address
		w0 = 0;
		data0 = 0;
		addr0 = 1;
		#2;
        
		// Add stimulus here
		
		/* TODO
		when enable is zero, is the output still what was written
		
		2 writes
		
		constantly read and write to same addresss
		
		*/

	end
      
	always
		#1 CLK = ~CLK;
		
endmodule

