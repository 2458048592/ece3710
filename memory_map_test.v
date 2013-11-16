`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:54:44 11/16/2013
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
	reg p2_trigger;
	reg p2_sens;
	reg a_clk;
	reg a_wr;
	reg [13:0] a_addr;
	reg [17:0] a_din;
	reg b_clk;
	reg b_wr;
	reg [13:0] b_addr;
	reg [17:0] b_din;

	// Outputs
	wire p1_shot;
	wire p1_hit;
	wire p2_shot;
	wire p2_hit;
	wire [17:0] a_dout;
	wire [17:0] b_dout;

	// Instantiate the Unit Under Test (UUT)
	memory_map uut (
		.CLR(CLR), 
		.p1_trigger(p1_trigger), 
		.p1_sens(p1_sens), 
		.p2_trigger(p2_trigger), 
		.p2_sens(p2_sens), 
		.p1_shot(p1_shot), 
		.p1_hit(p1_hit), 
		.p2_shot(p2_shot), 
		.p2_hit(p2_hit), 
		.a_clk(a_clk), 
		.a_wr(a_wr), 
		.a_addr(a_addr), 
		.a_din(a_din), 
		.a_dout(a_dout), 
		.b_clk(b_clk), 
		.b_wr(b_wr), 
		.b_addr(b_addr), 
		.b_din(b_din), 
		.b_dout(b_dout)
	);

	initial begin
		// Initialize Inputs
		CLR = 0;
		p1_trigger = 0;
		p1_sens = 0;
		p2_trigger = 0;
		p2_sens = 0;
		a_clk = 0;
		a_wr = 0;
		a_addr = 0;
		a_din = 0;
		b_clk = 0;
		b_wr = 0;
		b_addr = 0;
		b_din = 0;

	#100;		CLR = 1;
		#3 CLR = 0;
		
		p1_trigger = 1;
		p1_sens = 1;
		#12;
		b_addr = 8'd254;
		#6;
		b_addr = 8'd10;
		p1_trigger = 0;
      #12;
		b_addr = 8'd254; 
		 #12;
		b_addr = 8'd255;
		p1_sens = 0;		
		 #12;
		b_addr = 8'd255; 
		// Add stimulus here

	end
	
	always
		#1 a_clk = ~a_clk;

      
endmodule

