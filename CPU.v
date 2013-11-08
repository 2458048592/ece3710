`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:09:46 10/29/2013 
// Design Name: 
// Module Name:    CPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPU(
    input CLK,
    input CLR,
	 input button,
    output [6:0] seg7,
    output [3:0] select,
	 output PC_inc, set_addr, divclk,
	 output [15:0] A, B, aluOut, // for debugging
	 output [17:0] a_din, a_dout, b_din, b_dout, // for debugging
	 output [15:0] a_addr, b_addr, // for debugging
	 output [4:0] FLAGS
    );
	 
	reg divclk;
	reg [16: 0] count = 0; 
	reg newCLK;

	// clk divider
  always@(posedge CLK, posedge CLR) begin
		if (CLR) 
			divclk <= 0;
		else begin
			if (count == 100000) begin // set to 100000 for every 1 ms
				count <= 0;
				divclk <= divclk + 1'b1;
			end
			else begin
				count <= count + 1;
			end
		end
  end
	 
	 always @ (*)
		begin
			case (divclk)
				1'b0: begin newCLK = 1; end
				1'b1: begin newCLK = 0; end
			endcase
		end

	wire [15:0] Imm;
	wire [3:0] readRegA, readRegB, loadReg;
	wire selectImm, selectResult;
	wire [17:0] /*inst,*/ out1;
	wire [14:0] pc_load_addr = 0;
	wire [13:0] /* pc_addr,*/ c_addr, d_addr;

	// b_addr is the output of the controller_integrated, which comes from RegA input to
	// the ALU.
	program_counter counter(newCLK,CLR,set_addr, b_addr[13:0], PC_inc, a_addr[13:0]);
		
	memory asm_RAM (newCLK, 1'b0, a_addr, a_din, a_dout, newCLK, b_wr, b_addr, b_din, b_dout);
	//memory game_RAM (CLK, 1'b0, c_addr, c_din, c_dout, CLK, 1'b0, d_addr, d_din, d_dout);

/*module controller_integrated(
	input CLK, CLR,
	input [17:0] inst, external_din,
	output w1,  // w1 is writeToMemory
	output [15:0] addr1, // A[14:0] is addr1 for the memory module
	output [15:0] data1,
	output [4:0] FLAGS,
	output [15:0] A, B, aluOut, // for debugging
	//output [3:0] readRegA, loadReg, // for debugging
	output PC_inc, JAddrSelect);*/
	controller_integrated controller(newCLK,CLR,a_dout,b_dout,b_wr,/*b_addr,*/b_addr, b_din[15:0],FLAGS, A,B,aluOut, PC_inc, set_addr);

	//mux2_to_1_16bit muxX(aluOut,a_addr,button,display);
	SSD_decoder decoder(newCLK, CLR, aluOut, seg7, select);

endmodule
