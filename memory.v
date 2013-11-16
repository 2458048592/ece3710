`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:16:09 10/31/2013 
// Design Name: 
// Module Name:    memory_testing_block 
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
module memory#(
    parameter DATA = 18,
    parameter ADDR = 14
) (
    // Port A
    input   wire                a_clk,
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  reg     [DATA-1:0]  a_dout,
     
    // Port B
    input   wire                b_clk,
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  reg     [DATA-1:0]  b_dout
);
 
// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
initial begin
	$readmemh("hailstone.mem", mem);
end
// Port A
always @(posedge a_clk) begin
    a_dout      <= mem[a_addr];
    if(a_wr) begin
        a_dout      <= a_din;
        mem[a_addr] <= a_din;
    end
end
 
// Port B
always @(posedge b_clk) begin
    b_dout      <= mem[b_addr];
    if(b_wr) begin
        b_dout      <= b_din;
        mem[b_addr] <= b_din;
    end
end
 
endmodule
module vidMemory#(
    parameter DATA = 18,
    parameter ADDR = 11
) (
    // Port A
    input   wire                a_clk,
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  reg     [DATA-1:0]  a_dout,
     
    // Port B
    input   wire                b_clk,
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  reg     [DATA-1:0]  b_dout
);
 
// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
initial begin
	$readmemb("vid.mem", mem);
end
// Port A
always @(posedge a_clk) begin
    a_dout      <= mem[a_addr];
    if(a_wr) begin
        a_dout      <= a_din;
        mem[a_addr] <= a_din;
    end
end
 
// Port B
always @(posedge b_clk) begin
    b_dout      <= mem[b_addr];
    if(b_wr) begin
        b_dout      <= b_din;
        mem[b_addr] <= b_din;
    end
end
 
endmodule

module memory_map#(

		parameter DATA = 18,

		parameter ADDR = 14

		) (

			// Port A
			input   wire 						CLR, 
			input 	wire						p1_trigger,
			input 	wire						p1_sens,
			input   wire                a_clk,
			input   wire                a_wr,
			input   wire    [ADDR-1:0]  a_addr,
			input   wire    [DATA-1:0]  a_din,
			output       [DATA-1:0]  a_dout,

			// Port B

			input   wire                b_clk,

			input   wire                b_wr,

			input   wire    [ADDR-1:0]  b_addr,

			input   wire    [DATA-1:0]  b_din,

			output      [DATA-1:0]  b_dout
			);

			parameter p1_trig = 14'd254; // 254
			parameter p1_sen = 14'd255; // 255

			gun_top guns(a_clk, CLR, p1_trigger, p1_sens, 1'b0, 1'b0, p1_shot, p1_hit, p2_shot, p2_hit);
			memory asm_RAM (a_clk, a_wr, a_addr, a_din, a_dout, a_clk, b_wr, b_addr, b_din, b_dout_m);	


			reg select;


			mux2_to_1_16bit gun_mux(b_dout_m, b_dout_w, select, b_dout);

	always@(*) begin
case (b_addr) 
	p1_trig: begin
	if( p1_shot) begin
	select = 1'b1;
	end
	end
	p1_sen: begin
	if(p1_hit) begin 
	select = 1'b1;
	end
	end
	default: begin
	select = 0;
	end
	endcase
	end

	always@(posedge a_clk) begin
	if(CLR) begin 
	b_dout_w <= 0;
	end
	else begin
	if( p1_shot) begin
	b_dout_w <= 3;
	end		
	else if (p1_hit) begin
	b_dout_w <= 18'd4;
	end
	else begin
	b_dout_w <= 18'b0;
	end
	end
	end	

	endmodule
