`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:42 11/19/2013
// Design Name:   sensor
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/gun_sens_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sensor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gun_sens_test;

	// Inputs
	reg clk;
	reg CLR;
	reg sensor;

	// Outputs
	wire hit;

	// Instantiate the Unit Under Test (UUT)
	sensor uut (
		.clk(clk), 
		.CLR(CLR), 
		.sensor(sensor), 
		.hit(hit)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		CLR = 0;
		sensor = 0;
		
		
		// Wait 100 ns for global reset to finish
		#100;
		
		CLR = 1;
		#10 CLR = 0;
		
		#10;
		sensor = 1;
		#10 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#1 sensor = 0;
		#1 sensor =1;
		#2 sensor = 0;
		#2 sensor =1;
		#2 sensor = 0;
		#2 sensor =1;
		#2 sensor = 0;
		
        
		// Add stimulus here

	end
	
	always
		#1 clk = ~clk;
      
endmodule

