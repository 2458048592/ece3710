`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:21:21 10/29/2013
// Design Name:   controller_integrated
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/controller_integrated_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_integrated
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_integrated_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg [17:0] inst;
	reg [17:0] out1;

	// Outputs
	wire w1;
	wire e1;
	wire [15:0] addr1;
	wire [15:0] data1;
	wire [4:0] FLAGS;

	// Instantiate the Unit Under Test (UUT)
	controller_integrated uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.inst(inst), 
		.out1(out1), 
		.w1(w1), 
		.e1(e1), 
		.addr1(addr1), 
		.data1(data1), 
		.FLAGS(FLAGS)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		inst = 0;
		out1 = 0;

		CLR = 1;
		#3 CLR = 0;
		// Wait 100 ns for global reset to finish
		#100;
		inst = 16'b0101000100000001; //        addi 1, $1
		#6;
		if(data1 != 16'b00000000000000001)
				begin
					$display("ERROR: A was %0d; expected 1", data1);
				end
		
		inst = 16'b0000000101010010;  //add $2, $1

        
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;
      
endmodule

