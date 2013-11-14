`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module CPU(
    input CLK,
    input CLR,
	 //input button,
	 output [7:0] RGB_out,
	 output HSync, VSync
    );
	 
	wire [13:0] data_addr, inst_addr;
	wire [17:0] inst, data_out, a_din, data_in;
	wire [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;

	
	reg [26:0] regCLKCount;
	reg regCLK;
	
	always @ (posedge CLK) begin
		if (CLR) begin regCLKCount = 27'b0; regCLK = 0; end
		else begin
			if (regCLKCount < 99999999) begin regCLKCount = regCLKCount + 1'b1; regCLK = 0; end
			else begin regCLKCount = 27'b0; regCLK = 1'b1; end
		end
	end

	program_counter counter(regCLK,CLR,set_addr, data_addr[13:0], PC_inc, inst_addr[13:0]);
		
	memory asm_RAM (regCLK, 1'b0, inst_addr, a_din, inst, regCLK, b_wr, data_addr, data_in, data_out);	

//module controller_integrated(
//	input CLK, CLR,
//	input [17:0] inst, external_din,
//	output w1,  // w1 is writeToMemory
//	output [15:0] addr1, // A[14:0] is addr1 for the memory module
//	output [15:0] data1,
//	output [4:0] stored_flags,
//	output [15:0] A, B, aluOut, // for debugging
//	output PC_inc, JAddrSelect,
//	output [15:0] r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out, r14out, r15out
//	 );

	wire [4:0] FLAGS;
	wire [3:0] readRegA, readRegB, loadReg, memAddr;
	controller_integrated controller(regCLK,CLR,inst,data_out,b_wr, data_addr, data_in[15:0],FLAGS, A,B,aluOut, PC_inc, set_addr,
		r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, readRegA, readRegB, loadReg, memAddr);

	VGA2 vga( CLK, CLR, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, readRegA, readRegB,
		loadReg, memAddr,data_addr, data_in[15:0], A, B, RGB_out, HSync, VSync );

endmodule
