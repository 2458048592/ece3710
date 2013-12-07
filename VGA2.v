`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
module VGA2( CLK, CLR, DEBUG, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, readRegA, readRegB, loadReg, memAddr, 
	data_addr, data_in, inst_addr, A, B, FLAGS, RGB_out, HSync, VSync );
	input CLK, CLR, DEBUG;
	input [17:0] inst;
	input [15:0] r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15;
	input [3:0] readRegA, readRegB, loadReg, memAddr;
	input [15:0] data_addr, data_in, A, B, inst_addr;
	input [4:0] FLAGS;
	output reg [7:0] RGB_out;
	output HSync, VSync;
	
	reg [1:0] clkCount;
	reg pixCLK;
	
	wire [11:0] addr1, addr2;
	wire [9:0] HPix, VPix;
	wire [7:0] RGB_outD;
	
	wire [5:0] sprite1HPix, sprite1VPix;
	reg [9:0] HLocation1, VLocation1;
	reg displayBlack, sprite1On, sprite1White;
	reg [7:0] displayColor;
	reg [7:0] textColor;
	
	pixelGen5 _pixelGen5( CLK, CLR, DEBUG, inst, r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15,
		readRegA, readRegB, loadReg, memAddr, data_addr, data_in, A, B, inst_addr, FLAGS, HPix, VPix, displayColor, textColor, displayBlack, RGB_outD );
	
	always @ (posedge CLK) begin
		if (CLR == 1'b1) begin
			displayBlack = 1'b0;
			displayColor = 8'b00000000;
			textColor = 8'b11111111;
			HLocation1 = 10'b0;
			VLocation1 = 10'b0;
			sprite1On = 1'b1;
			sprite1White = 1'b0;
		end
		else begin
			if (inst[15:12] == 4'b0100 && inst[7:4] == 4'b0100) begin
				if (data_addr[15:14] == 2'b11) begin
					case (data_addr[2:0])
						3'b010: begin
							displayBlack = data_in[0];
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = textColor;
						end
						3'b011: begin
							displayBlack = displayBlack;
							displayColor = data_in[7:0];
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = textColor;
						end
						3'b000: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = data_in[9:0];
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = textColor;
						end
						3'b001: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = data_in[9:0];
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = textColor;
						end
						3'b100: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = data_in[0];
							sprite1White = sprite1White;
							textColor = textColor;
						end
						3'b101: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = data_in[0];
							textColor = textColor;
						end
						3'b110: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = data_in[7:0];
						end
						default: begin
							displayBlack = displayBlack;
							displayColor = displayColor;
							HLocation1 = HLocation1;
							VLocation1 = VLocation1;
							sprite1On = sprite1On;
							sprite1White = sprite1White;
							textColor = textColor;
						end
					endcase
				end
				else begin
					displayBlack = displayBlack;
					displayColor = displayColor;
					HLocation1 = HLocation1;
					VLocation1 = VLocation1;
					sprite1On = sprite1On;
					sprite1White = sprite1White;
					textColor = textColor;
				end
			end
			else begin
				displayBlack = displayBlack;
				displayColor = displayColor;
				HLocation1 = HLocation1;
				VLocation1 = VLocation1;
				sprite1On = sprite1On;
				sprite1White = sprite1White;
				textColor = textColor;
			end
		end
	end
	
	parameter spriteSize = 7'd64;
	
	// sprite1HPix is calculated by taking HPix - XLocation % Sprite size
	assign sprite1HPix = (HPix - HLocation1)%spriteSize;
	// sprite1HPix is calculated by taking VPix - YLocation % Sprite size
	assign sprite1VPix = (VPix - VLocation1)%spriteSize;
	wire [7:0] sprite1;
	spriteGen _spriteGen(CLK, CLR, sprite1HPix, sprite1VPix, alpha, sprite1);
		
	always @ (*) begin
		if (DEBUG == 1'b1) begin
			RGB_out = RGB_outD;
		end
		else begin
			if ((HPix >= HLocation1 && HPix < (HLocation1 + spriteSize)) && (VPix >= VLocation1 && VPix < (VLocation1 + spriteSize))) begin
				if (HPix > 0 && VPix > 0) begin
					if (sprite1On == 1'b1) begin
						if (sprite1White == 1'b1) begin
							RGB_out = 8'b11111111;
						end
						else begin
							if (alpha == 1'b1) begin
								RGB_out = sprite1;
							end
							else begin
								RGB_out = RGB_outD;
							end
						end
					end
					else begin
						RGB_out = RGB_outD;
					end
				end
				else begin
					RGB_out = RGB_outD;
				end
			end
			else begin
				RGB_out = RGB_outD;
			end
		end
	end
	
	always @ (posedge CLK) begin
		if (CLR) begin pixCLK = 1'b0; clkCount = 2'b0; end
		else begin
			if (clkCount < 2'b11) begin pixCLK = 1'b0; clkCount = clkCount + 1'b1; end
			else begin pixCLK = 1'b1; clkCount = 2'b0; end
		end
	end
	
	hCounter _hCounter( pixCLK, CLR, VCntEna, HSync, HPix );
	vCounter _vCounter( pixCLK, CLR, VCntEna, VSync, VPix );

endmodule
