`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Company: 

// Engineer: 

// 

// Create Date:    15:31:13 09/12/2013 

// Design Name: 

// Module Name:    dataPath 

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

module dataPath(

	input CLK, CLR, selectImm,

	input [3:0] loadReg, readRegA, readRegB,

	input [7:0] Imm, op,

	output [15:0] A, B, Z,

	output [4:0] flags

    );



	ALU _alu(flags[4], A, B, op, Z, flags[4], flags[3], flags[2], flags[1], flags[0]);

	RegFile _regfile(CLK, CLR, selectImm, Z, Imm, readRegA, readRegB, loadReg, A, B);



	always @ (*) begin

		

	end

endmodule



	//module ALU(
	//input c,
   //input signed [15:0] a, b,
	//input [7:0] op,
   //output reg [15:0] y,
   //output reg C, L, F, Z, N
   //);

	 

	//module RegFile(

	//input CLK, CLR, selectImm,

	//input [15:0] data,

	//input [7:0] Imm,

	//input [3:0] selectA, selectB, selectWrite,

	//output reg [15:0] A, B

   //);

