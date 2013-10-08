`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:15:45 10/08/2013
// Design Name:   memory2
// Module Name:   C:/Users/Zach/Documents/Xilinx/ALU/memory2_test_file_readin.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memory2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memory2_test_file_readin;

	// Inputs
	reg CLK;
	reg CLR;
	reg w0;
	reg w1;
	reg [14:0] addr0;
	reg [14:0] addr1;
	reg [17:0] data0;
	reg [17:0] data1;

	// Outputs
	wire [17:0] out0;
	wire [17:0] out1;

	// Instantiate the Unit Under Test (UUT)
	memory2 uut (
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
	
	integer i;
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
        
		// Add stimulus here
		//Write the number for the address into the address
		w1=1;
		for(i=0; i<2**15; i=i+1)
		begin
			addr1 = i;
			data1 = i;
			#2;
		end
		
		//Check that the reading was correct
		w1 = 0;
		for(i=0; i<2**15; i=i+1)
		begin
			#2;
			addr1 = i;
			data1 = i;
			#2;
		end

	end
      
endmodule

