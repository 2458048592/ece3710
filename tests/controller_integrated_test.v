`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:59:44 11/23/2013
// Design Name:   controller_integrated
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/controller_integrated_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_integrated
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_integrated_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg [17:0] inst;
	reg [17:0] external_din;

	// Outputs
	wire w1;
	wire [15:0] addr1;
	wire [15:0] data1;
	wire [4:0] stored_flags;
	wire [15:0] A;
	wire [15:0] B;
	wire [15:0] aluOut;
	wire PC_inc;
	wire JAddrSelect;
	wire [15:0] r0out;
	wire [15:0] r1out;
	wire [15:0] r2out;
	wire [15:0] r3out;
	wire [15:0] r4out;
	wire [15:0] r5out;
	wire [15:0] r6out;
	wire [15:0] r7out;
	wire [15:0] r8out;
	wire [15:0] r9out;
	wire [15:0] r10out;
	wire [15:0] r11out;
	wire [15:0] r12out;
	wire [15:0] r13out;
	wire [15:0] r14out;
	wire [15:0] r15out;
	wire [3:0] readRegA;
	wire [3:0] readRegB;
	wire [3:0] loadReg;
	wire [3:0] memAddr;

	// Instantiate the Unit Under Test (UUT)
	controller_integrated uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.inst(inst), 
		.external_din(external_din), 
		.w1(w1), 
		.addr1(addr1), 
		.data1(data1), 
		.stored_flags(stored_flags), 
		.A(A), 
		.B(B), 
		.aluOut(aluOut), 
		.PC_inc(PC_inc), 
		.JAddrSelect(JAddrSelect), 
		.r0out(r0out), 
		.r1out(r1out), 
		.r2out(r2out), 
		.r3out(r3out), 
		.r4out(r4out), 
		.r5out(r5out), 
		.r6out(r6out), 
		.r7out(r7out), 
		.r8out(r8out), 
		.r9out(r9out), 
		.r10out(r10out), 
		.r11out(r11out), 
		.r12out(r12out), 
		.r13out(r13out), 
		.r14out(r14out), 
		.r15out(r15out), 
		.readRegA(readRegA), 
		.readRegB(readRegB), 
		.loadReg(loadReg), 
		.memAddr(memAddr)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		inst = 0;
		external_din = 0;

		CLR = 1;
		#3 CLR = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		inst = 16'h6aff; //        addui 255, $10
		#6;
		if(data1 != 16'b000000011111111)
				begin
					$display("ERROR1: data1 was %0d; expected 255", data1);
				end
		
		inst = 16'hfb01; // lui 1, $11
		#6;
		
		inst = 16'h0a2b; // or $10, $11
		#5;
		
		inst = 16'h6a00;  // addui 0, $10
		#6;
		if(addr1 != 16'b000000111111111)
				begin
					$display("ERROR2: Addr1 was %0d; expected 511", addr1);
				end
      #6;
		inst =  16'hd114; // movi 20, $1
		#6;
		
		inst = 16'h0232; //xor $2, $2
		#6;
		if(data1 != 16'b0)
				begin
					$display("ERROR3: data1 was %0d; expected 0", data1);
				end
				
		inst = 16'h522a; // addi 42, $2
		#6;
		
		inst = 16'h0212; // and $2, $2
		#6;
		if(data1 != 8'h2a) // 42
				begin
					$display("ERROR3.1: data1 was %0d; expected 42", data1);
				end
		
		inst =  16'hde63; // movi 99, $14
		#6;
		
		inst = 16'h4142; // stor $1, $2
		#6;
		if(addr1 != 16'b0000000000010100)
				begin
					$display("ERROR5: Addr1 was %0d; expected 20", addr1);
				end
				
		inst = 16'h0212; // and $2, $2
		#6;
		if(data1 != 8'h2a) // 42
				begin
					$display("ERROR5.1: data1 was %0d; expected 42", data1);
				end
		
		inst =  16'hdf64; // movi 100, $15
		#6;
		
			
		inst =  16'hd114; // movi 20, $1
		#6;
		inst = 16'h4201;  //load $2, $1
		#6;
		if(addr1 != 16'b0000000000010100)
				begin
					$display("ERROR6: addr1 was %0d; expected 20", addr1);
				end
				
		inst = 16'h0212; //xor $2, $2
		// Add stimulus here
		#6;
		$finish;
	end
	
	always 
		#1 CLK = ~CLK;
      
endmodule

