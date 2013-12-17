`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:56:15 11/20/2013
// Design Name:   VGA
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/VGA_controller_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: VGA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module VGA_controller_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg [15:0] addr1;
	reg [17:0] d_in1;
	reg w1;

	// Outputs
	wire HSync;
	wire VSync;
	wire [7:0] RGB_out;
	wire 	[17:0] d_out2;
		wire [10:0] addr2;



	// Instantiate the Unit Under Test (UUT)
	VGA uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.addr1(addr1), 
		.d_in1(d_in1), 
		.w1(w1), 
		.HSync(HSync), 
		.VSync(VSync), 
		.RGB_out(RGB_out),
		.d_out2(d_out2),
		.addr2(addr2)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		addr1 = 0;
		d_in1 = 0;
		w1 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		CLR = 1;
		#3 CLR = 0;
		
		addr1 = 16'hf0fd;
		d_in1 = 28;
		w1 = 1;
		#3
		w1 = 0;
		
        
		// Add stimulus here

	end
     
	always
		#1 CLK = ~CLK;
endmodule

