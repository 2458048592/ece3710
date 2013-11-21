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
	$readmemh("cpu_inst.mem", mem);
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
	$readmemb("glyphmap.mem", mem);
	//$readmemb("vid.mem", mem);
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

module glyphMemory#(
    parameter DATA = 18,
    parameter ADDR = 10
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
	$readmemb("glyphs.mem", mem);
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

// guns
	input   wire 						CLK, 
	 input   wire 						CLR, 
	 input 	wire						p1_trigger,
	 input 	wire						p1_sens,
	 input 	wire						p2_trigger,
	 input 	wire						p2_sens,
	 output 								p1_shot,
	 output 								p1_hit,
	 output 								p2_shot,
	 output 								p2_hit,
 // Port A
	
    input   wire                a_clk,
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output       [DATA-1:0]  a_dout,
	 
 // Port B
    input   wire                b_clk,
    input   wire                b_wr,
    input   wire    [15:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output      		[DATA-1:0]  b_dout
	 
 );
 
	parameter VGA = 4'hf; // 4 msb of b_addr are mapped to VGA memory
	parameter p1_trig_addr = 14'd254; // 254
	parameter p1_sen_addr = 14'd255; // 255
	wire  [DATA-1:0] b_dout_m;
	reg  [DATA-1:0] b_dout_w;
	reg select;
// output      		[DATA-1:0]  b_dout_m,
//	   output      reg		[DATA-1:0]  b_dout_w

	gun_top guns(CLK, CLR, p1_trigger, p1_sens, p2_trigger, p2_sens, p1_shot, p1_hit, p2_shot, p2_hit);
 	memory asm_RAM (a_clk, a_wr, a_addr, a_din, a_dout, a_clk, b_wr, b_addr[ADDR-1:0], b_din, b_dout_m);	
	
	mux2_to_1_16bit gun_mux(b_dout_m, b_dout_w, select, b_dout);
	
	always@(*) begin
		if( b_addr == p1_trig_addr) begin
			select = 1'b1;
		end
		else if(b_addr == p1_sen_addr) begin 
			select = 1'b1;
		end
		else if(b_addr[15:12] == VGA) begin 
			select = 1'b1;
		end
		else begin
			select = 0;
		end
	
	end
	
	always@(posedge a_clk) begin
		if(CLR) begin 
			b_dout_w <= 0;
		end
		else begin
			if( b_addr == p1_trig_addr) begin
				b_dout_w <= p1_shot;
			end
			else if(b_addr == p1_sen_addr) begin 
				b_dout_w <= p1_hit;
			end
			else if(b_addr[15:12] == VGA) begin 
				b_dout_w <= b_din;
			end
			else begin
				b_dout_w <= 18'b0;
			end

		end
	end	
	
endmodule
			
	
