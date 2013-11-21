`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:00 11/20/2013
// Design Name:   Address_map
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/vga_controller_address_map_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Address_map
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_controller_address_map_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg bright;
	reg [10:0] addr1;
	reg [17:0] d_in1;
	reg w1;
	reg [9:0] hCount;
	reg [9:0] vCount;

	// Outputs
	wire [17:0] d_out2;

	// Instantiate the Unit Under Test (UUT)
	Address_map uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.bright(bright), 
		.addr1(addr1), 
		.d_in1(d_in1), 
		.w1(w1), 
		.hCount(hCount), 
		.vCount(vCount), 
		.d_out2(d_out2)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		bright = 0;
		addr1 = 0;
		d_in1 = 0;
		w1 = 0;
		hCount = 0;
		vCount = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		CLR = 1;
		#3 CLR = 0;
		
		bright = 1;
		addr1 = 253;
		d_in1 = 28;
		w1 = 1;
		
		
		#10 w1 = 0;
		
		#3;
		bright = 1;
		addr1 = 252;
		d_in1 = 3;
		w1 = 1;
		
		#10 w1 = 0;

		#3;
		bright = 1;
		addr1 = 251;
		d_in1 = 127;
		w1 = 1;
		#10 w1 =0;
		#20;
		
		hCount = 200;
		vCount = 200;
		
		#20;
		hCount = 400;
		vCount = 400;
		#30 bright = 0;
		#20;
		hCount = 0;
		vCount = 0;
		
		// Add stimulus here

	end
   
	always 
		#1 CLK = ~CLK;
endmodule

