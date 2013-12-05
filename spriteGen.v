`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//////////////////////////////////////////////////////////////////////////////////
module spriteGen(CLK, CLR, spriteHPix, spriteVPix, alpha, sprite);
	input CLK, CLR;
	input [5:0] spriteHPix, spriteVPix;
	output [7:0] sprite;
	
	reg [9:0] addr1;
	reg [17:0] d_out1;
	//memory _spritemem(CLK, 1'b0, addr1, d_in1, d_out1, CLK, 1'b0, addr2, d_in2, d_out2);
	reg [17:0] _spriteROM [1023:0];
	
	initial begin
		//$readmemb("sprites.mem", _spriteROM);
		$readmemh("duck64.mem", _spriteROM);
	end
	
	always @ (posedge CLK) begin
		if (CLR) begin d_out1 = 18'b0; end
		else begin
			d_out1 = _spriteROM[addr1];
		end
	end
	
	always @ (*) begin
		addr1 = spriteHPix[5:2] + {spriteVPix, 4'b0};
	end
	
	output reg alpha;
	reg [2:0] color;
	
	wire [3:0] pix1, pix2, pix3, pix4;
	assign pix1 = d_out1[15:12];
	assign pix2 = d_out1[11:8];
	assign pix3 = d_out1[7:4];
	assign pix4 = d_out1[3:0];
	
	always @ (*) begin
		case (spriteHPix[1:0])
			2'b00: {alpha, color} = pix1;
			2'b01: {alpha, color} = pix2;
			2'b10: {alpha, color} = pix3;
			2'b11: {alpha, color} = pix4;
			default: {alpha, color} = 4'b0;
		endcase
	end
	assign sprite = { color[2], color[2], color[2], color[1], color[1], color[1], color[0], color[0] };
endmodule
