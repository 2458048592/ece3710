`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:35:14 11/02/2013
// Design Name:   memory
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/memory_test.v
// Project Name:  CPU
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

module memory_test_file_readin;

	// Inputs
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

	// Instantiate the Unit Under Test (UUT)
	memory uut (
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
	integer i;
	initial begin
		// Initialize Inputs
		a_clk = 0;
		a_wr = 0;
		a_addr = 0;
		a_din = 0;
		b_clk = 0;
		b_wr = 0;
		b_addr = 0;
		b_din = 0;
		

		// Wait 100 ns for global reset to finish
		#100;
    
		//Check that the reading was correct
		for(i=0; i< 10; i=i+1)
		begin
			a_addr = i;
			#2;

			$display("A_ADDR: %0d, A_DOUT: %16b", a_addr, a_dout);

			
		end
	$display("done");

	end
	
	always begin
		#1 a_clk = ~a_clk;
		b_clk = ~b_clk;
	end
      
endmodule

