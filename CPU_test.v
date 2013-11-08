`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
////////////////////////////////////////////////////////////////////////////////

module CPU_test;

/*module CPU(
    input CLK,
    input CLR,
	 output PC_inc, set_addr,
	 output [15:0] A, B, aluOut, // for debugging
	 output [17:0] a_din, a_dout, b_din, b_dout, // for debugging
	 output [15:0] a_addr, b_addr, // for debugging
	 output [4:0] FLAGS
    );*/

	// Inputs
	reg CLK;
	reg CLR;
	reg button;

	// Outputs
	wire [6:0] seg7;
   wire [3:0] select;
	wire PC_inc;
	wire set_addr;
	wire [15:0] A;
	wire [15:0] B;
	wire [15:0] aluOut;
	wire [17:0] a_din;
	wire [17:0] a_dout;
	wire [17:0] b_din;
	wire [17:0] b_dout;
	wire [15:0] a_addr;
	wire [15:0] b_addr;
	wire [4:0] FLAGS;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.button(button),
		.seg7(seg7),
		.select(select),
		.PC_inc(PC_inc), 
		.set_addr(set_addr), 
		.divclk(divclk),
		.A(A),
		.B(B), 
		.aluOut(aluOut), 
		.a_din(a_din), 
		.a_dout(a_dout), 
		.b_din(b_din), 
		.b_dout(b_dout), 
		.a_addr(a_addr), 
		.b_addr(b_addr), 
		.FLAGS(FLAGS)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;

		// Wait 100 ns for global reset to finish
		#100;
		CLR = 1;
		#9 CLR = 0;
        
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;

      
endmodule

