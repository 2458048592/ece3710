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

module memory_test;

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
        
		a_wr = 1;
		// Add stimulus here
		a_addr = 0;
		a_din = 18'b000000000000000010;
		
	/*	for(i=0; i<30720; i=i+1)
		begin
			a_addr = i;
			a_din = i;
			#2;
		end
		
		//Check that the reading was correct
		for(i=0; i<30; i=i+1)
		begin
			#2;
			a_addr = i;
			#2;
			//if(i != out0)
				//begin
					$display("A_ADDR: %0d, A_DOUT: %0d", a_addr, a_dout);
				//end
		end
	$display("done");
*/
	end
	
	always
		#1 a_clk = ~a_clk;
      
endmodule

