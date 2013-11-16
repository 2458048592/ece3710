`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:02 11/16/2013
// Design Name:   memory_map
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/memory_map_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory_map
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_map_test;

	// Inputs
	reg CLR;
	reg p1_trigger;
	reg p1_sens;
	reg a_clk;
	reg a_wr;
	reg [13:0] a_addr;
	reg [17:0] a_din;
	reg b_clk;
	reg b_wr;
	reg [13:0] b_addr;
	reg [17:0] b_din;

	// Outputs
	wire [17:0] a_dout;
	wire [17:0] b_dout;
	wire [17:0] b_dout_m;
	wire [17:0] b_dout_w;

	// Instantiate the Unit Under Test (UUT)
	memory_map uut (
		.CLR(CLR), 
		.p1_trigger(p1_trigger), 
		.p1_sens(p1_sens), 
		.a_clk(a_clk), 
		.a_wr(a_wr), 
		.a_addr(a_addr), 
		.a_din(a_din), 
		.a_dout(a_dout), 
		.b_clk(b_clk), 
		.b_wr(b_wr), 
		.b_addr(b_addr), 
		.b_din(b_din), 
		.b_dout(b_dout), 
		.b_dout_m(b_dout_m), 
		.b_dout_w(b_dout_w)
	);

	initial begin
		// Initialize Inputs
		CLR = 0;
		p1_trigger = 0;
		p1_sens = 0;
		a_clk = 0;
		a_wr = 0;
		a_addr = 0;
		a_din = 0;
		b_clk = 0;
		b_wr = 0;
		b_addr = 0;
		b_din = 0;

			#10;
		CLR = 1;
		#3 CLR = 0;
		
		p1_trigger = 1;
		p1_sens = 1;
		#2;
		b_addr = 8'd254;
		#2;
		b_addr = 8'd10;
		
        
		// Add stimulus here

	end
	
	always
		#1 a_clk = ~a_clk;
      
endmodule

