`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:17:08 10/29/2013
// Design Name:   CPU
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/CPU_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg load_program;
	reg [14:0] addr0_ext;
	reg [17:0] write_data0;

	// Outputs
	wire [15:0] addr1;
	wire [15:0] B;
	wire [15:0] aluOut;
	wire [17:0] inst;
	wire [14:0] pc_addr;
	wire [4:0] FLAGS;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.load_program(load_program),
		.addr0_ext(addr0_ext),
		.write_data0(write_data0),
		.addr1(addr1), 
		.B(B), 
		.aluOut(aluOut),
		.inst(inst),
		.pc_addr(pc_addr),
		.FLAGS(FLAGS)
	);
	reg [17:0] mem [4:0];
	 
	integer i;
	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		load_program = 0;
		
		
		$readmemb("test1.dat", mem);
		#100;
		#1 load_program = 1;
		#3;
		for(i=0;i<5;i=i+1)
			begin
				addr0_ext = i[14:0];
				write_data0 = mem[i];
				#2;
           //$display("%b",mem[i]);
			  
			end
		load_program = 0;
		CLR = 1;
		#3 CLR = 0;
		// Add stimulus here

	end
	always 
		#1 CLK = ~CLK;
      

  //use 
endmodule

