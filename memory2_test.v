`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:27:36 10/08/2013
// Design Name:   memory2
// Module Name:   C:/Users/Zach/Documents/Xilinx/ALU/memory2_test.v
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

module memory2_test;

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

	integer i, j; // for the forloop calculating FIBONACCI
	integer fib1;
	integer fib2;
	integer temp_fib;


	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		w0 = 0; // instruction write enable 
		w1 = 0; // data write enable
		addr0 = 0;
		addr1 = 0; // data address
		data0 = 0;
		data1 = 0;

		// Wait 100 ns for global reset to finish
		#10;
        
		// Add stimulus here

		// *** WRITE THE DATA TO THE ADDRESSES ***
		w0 = 1;
		w1 = 1; // enable data write
		for(j=0; j<=29; j=j+1) begin
			for (i=0; i<=1023; i=i+1) begin
				addr1 = {j[4:0], i[9:0]};
				addr0 = {j[4:0], i[9:0]};
				data1 = {j[4:0], i[9:0]};
				data0 = {j[4:0], i[9:0]};
				#2;
			end
		end
		w0 = 0;
		
		// max number to go up to is a 16-bit fibonacci
		// max normal number is 32767, maxfib number is 28657 (23 fibonacci sequences)
		for(j = 0; j <= 29; j=j+1) begin
			
			fib1 = 0;
			fib2 = 1;
			for(i = 0; i<23; i=i+1)
			begin
				temp_fib = fib1 + fib2;
				addr1 = {j,temp_fib[9:0]}; // fibonnaci sequence;
				data1 = temp_fib; // write the fib number to the same address in memory
				// Update the fib sequence
				fib1 = fib2;
				fib2 = temp_fib;
				#2;
			end
		end

		// *** CHECK THAT THE DATA WRITTEN IS CORRENT ***
		w1 = 0;
		data1 = 0;
		for(j=0; j<=29; j=j+1) begin
			fib1 = 0;
			fib2 = 1;
			for(i=0; i<23; i=i+1)
			begin
				temp_fib = fib1 + fib2;
				addr1 = {j,temp_fib[9:0]};
				#2;
				if(temp_fib != out1)
				begin
					$display("Error with writing memory");
					$display("ADDR1: %0d, OUT1: %0d", addr1, out1);
				end
				fib1 = fib2;
				fib2 = temp_fib;
			end
		end
	end

	always
		#1 CLK = ~CLK;
      
endmodule
