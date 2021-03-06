`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////

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
	 output reg out_sound0,
	 output reg out_sound1,
	 output reg out_sound2,
	 output reg out_sound3,
	 output reg out_sound4,
	 output reg out_sound5,
	 output reg out_sound6,
	 output reg out_sound7,
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
    output reg     		[DATA-1:0]  b_dout,
	 output wire [9:0] rand_out
	 
 );
 
	parameter VGA1 = 2'b10; // 2 msb of b_addr are mapped to VGA memory
	parameter VGA2 = 2'b11;
	parameter p1_trig_addr = 16'h2000; // 
	parameter p1_sen_addr = 16'h2001; // 
	parameter p2_trig_addr = 16'h2002; // 
	parameter p2_sen_addr = 16'h2003; // 
	parameter random_number8bit = 16'h2008; //
	parameter random_number9bit = 16'h2009; //
	parameter random_number10bit = 16'h2010; //
	parameter sound0 = 16'h2020; //
	parameter sound1 = 16'h2021; //
	parameter sound2 = 16'h2022; //
	parameter sound3 = 16'h2023; //
	parameter sound4 = 16'h2024; //
	parameter sound5 = 16'h2025; //
	parameter sound6 = 16'h2026; //
	parameter sound7 = 16'h2027; //

	parameter sound0_off = 16'h2030; //
	parameter sound1_off = 16'h2031; //
	parameter sound2_off = 16'h2032; //
	parameter sound3_off = 16'h2033; //
	parameter sound4_off = 16'h2034; //
	parameter sound5_off = 16'h2035; //
	parameter sound6_off = 16'h2036; //
	parameter sound7_off = 16'h2037; //

	

	wire  [DATA-1:0] b_dout_m;
	reg  [DATA-1:0] b_dout_w;
	reg select;
	
	random_num_gen generator(a_clk, rand_out); 
	gun_top guns(CLK, CLR, p1_trigger, p1_sens, p2_trigger, p2_sens, p1_shot, p1_hit, p2_shot, p2_hit);
 	memory asm_RAM (a_clk, a_wr, a_addr, a_din, a_dout, a_clk, b_wr, b_addr[ADDR-1:0], b_din, b_dout_m);	
	//mux2_to_1_16bit gun_mux(b_dout_m, b_dout_w, select, b_dout);
	always @ (*) begin
		if (select == 1'b1) begin b_dout = b_dout_w; end
		else begin b_dout = b_dout_m; end
	end
	
	always@(*) begin
		if( b_addr == p1_trig_addr || b_addr == p1_sen_addr || b_addr == p2_sen_addr || b_addr == p2_trig_addr) begin
			select = 1'b1;
		end
		else if(b_addr[15:14] == VGA1 || b_addr[15:14] == VGA2) begin 
			select = 1'b1;
		end
		else if(b_addr == random_number10bit || b_addr == random_number9bit || b_addr == random_number8bit  ) begin 
			select = 1'b1;
		end
	//	else if (b_addr == sound0 || b_addr == sound1 || b_addr == sound2 || b_addr == sound3
	//				|| b_addr == sound4 || b_addr == sound5 || b_addr == sound6 || b_addr == sound7) begin
	//		select = 1'b1;
	//	end
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
				out_sound0 <= ~p1_shot;
			end
			else if(b_addr == p1_sen_addr) begin 
				b_dout_w <= p1_hit;
			end
			else if( b_addr == p2_trig_addr) begin
				b_dout_w <= p2_shot;
				out_sound1 <= ~p2_shot;
			end
			else if(b_addr == p2_sen_addr) begin 
				b_dout_w <= p2_hit;
			end
			else if(b_addr[15:14] == VGA1 || b_addr[15:14] == VGA2) begin 
				b_dout_w <= b_din;
			end
			else if(b_addr == random_number8bit) begin 
				b_dout_w <= rand_out[7:0];
			end
			else if(b_addr == random_number9bit) begin 
				b_dout_w <= rand_out[8:0];
			end
			else if(b_addr == random_number10bit) begin 
				b_dout_w <= rand_out;
			end
			else if (b_addr == sound0) begin 
				out_sound0 <= 1'b1;
			end
			else if (b_addr == sound1) begin 
				out_sound1 <= 1'b1;
			end
			else if (b_addr == sound2) begin 
				out_sound2 <= 1'b1;
			end
			else if (b_addr == sound3) begin 
				out_sound3 <= 1'b1;
			end
			else if (b_addr == sound4) begin 
				out_sound4 <= 1'b1;
			end
			else if (b_addr == sound5) begin 
				out_sound5 <= 1'b1;
			end
			else if (b_addr == sound6) begin 
				out_sound6 <= 1'b1;
			end
			else if (b_addr == sound7) begin 
				out_sound7 <= 1'b1;
			end
			else if (b_addr == sound0_off) begin 
				out_sound0 <= 1'b0;
			end
			else if (b_addr == sound1_off) begin 
				out_sound1 <= 1'b0;
			end
			else if (b_addr == sound2_off) begin 
				out_sound2 <= 1'b0;
			end
			else if (b_addr == sound3_off) begin 
				out_sound3 <= 1'b0;
			end
			else if (b_addr == sound4_off) begin 
				out_sound4 <= 1'b0;
			end
			else if (b_addr == sound5_off) begin 
				out_sound5 <= 1'b0;
			end
			else if (b_addr == sound6_off) begin 
				out_sound6 <= 1'b0;
			end
			else if (b_addr == sound7_off) begin 
				out_sound7 <= 1'b0;
			end
			else begin
				b_dout_w <= 18'b0;
			end

		end
	end	
	
endmodule

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
	//$readmemh("hailstone.mem", mem);
	//$readmemh("videotest.mem", mem);
	$readmemh("glyphMove.mem", mem);
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

module debugMemory#(
    parameter DATA = 18,
    parameter ADDR = 13
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
	//$readmemb("sprites.mem", mem);
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
    parameter ADDR = 12
	 //parameter ADDR = 11
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
initial begin
	//$readmemb("glyphmap.mem", mem);
	$readmemb("vid.mem", mem);
end
 
// Shared memory
reg [DATA-1:0] mem [(2**ADDR)-1:0];
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
//
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
	//$readmemb("sprites.mem", mem);
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
//
//module glyphROM(CLK, CLR, gAddr1, gD_out1);
//	input CLK, CLR;
//	input [7:0] gAddr1;
//	output reg [17:0] gD_out1;
//		
//	reg [17:0] glyph_mem [255:0];
//	
//	initial begin
//		$readmemb("glyphs.mem", glyph_mem);
//	end
//	
//	always @ (posedge CLK) begin
//		if (CLR) begin gD_out1 = 18'b0; end
//		else begin
//			gD_out1 = glyph_mem[gAddr1];
//		end
//	end
//endmodule
