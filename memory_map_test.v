`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:06:46 12/11/2013
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
	reg CLK;
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
	reg [15:0] b_addr;
	reg [17:0] b_din;

	// Outputs
	wire p1_shot;
	wire p1_hit;
	wire p2_shot;
	wire p2_hit;
	wire out_sound0;
	wire out_sound1;
	wire out_sound2;
	wire out_sound3;
	wire out_sound4;
	wire out_sound5;
	wire out_sound6;
	wire out_sound7;
	wire [17:0] a_dout;
	wire [17:0] b_dout;
	wire [9:0] rand_out;

	// Instantiate the Unit Under Test (UUT)
	memory_map uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.p1_trigger(p1_trigger), 
		.p1_sens(p1_sens), 
		.p2_trigger(p2_trigger), 
		.p2_sens(p2_sens), 
		.p1_shot(p1_shot), 
		.p1_hit(p1_hit), 
		.p2_shot(p2_shot), 
		.p2_hit(p2_hit), 
		.out_sound0(out_sound0), 
		.out_sound1(out_sound1), 
		.out_sound2(out_sound2), 
		.out_sound3(out_sound3), 
		.out_sound4(out_sound4), 
		.out_sound5(out_sound5), 
		.out_sound6(out_sound6), 
		.out_sound7(out_sound7), 
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
		.rand_out(rand_out)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
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
		#3p1_trigger = 0;
		
		b_addr = 16'h2020;
		#12;
		b_addr = 16'h2021;
		#12;
		b_addr = 16'h2030;
		#12;
		b_addr = 16'h2031;
		#12;
		b_addr = 16'h2032;
		#12;
		b_addr = 16'h2023;
		#12;
		b_addr = 16'h2010;
		#12;
		b_addr = 16'h2010;
		#12;
		b_addr = 16'h2010;
		#12;
		
		p1_trigger = 1;
		p1_sens = 1;
		b_din = 28;
		#12;
		b_addr = 16'hf0fd;
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

