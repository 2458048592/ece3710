`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
// 
// Module Name:    SSD_decoder 
// Description: SSD_decoder encapsulates the 4 7-Segment displays and displays a 16-bit input
//      number in hexadecimal format.  It includes its own clock divider
//
//////////////////////////////////////////////////////////////////////////////////
module SSD_decoder(
	 input clk,
	 input clr,
    input [15:0] number,
    output reg [6:0] ssOut,
    output reg [3:0] select
    );
  reg  [1:0] divclk;
  reg  [3:0] display; // used for each display
  
  reg [16: 0] count = 0; 
	  	

	// clk divider
  always@(posedge clk, posedge clr) begin
		if (clr) 
			divclk <= 0;
		else begin
			if (count == 100000) begin // set to 100000 for every 1 ms
				count <= 0;
				if (divclk >= 3)
					divclk <= 0;
				else 
					divclk <= divclk + 1'b1;
			end
			else begin
				count <= count + 1;
			end
		end
  end
  
	// selects each seven segment display and assigns a number					 				 
	always @ (*)
	begin
		case (divclk) 
				2'b00: begin
					// Lowest 4-bits
					select = 4'b1110;
					display = number[3:0];
				end
				2'b01: begin 
					// 2nd lowest 4-bits
					select = 4'b1101;
					display = number[7:4];				
				end
				2'b10: begin 
					// 2nd highest 4-bits
					select = 4'b1011;
					display = number[11:8];
				end
				2'b11: begin
					// Highest 4-bits
					select = 4'b0111;
					display = number[15:12];
				end
				default: begin
					// Default to lowest.  This will never happen.
					select = 4'b1110;
					display = number[3:0];
				end
		endcase 
	end
	
	
	// ssOut format {g, f, e, d, c, b, a}
	always @(display) begin
    case (display)
      	4'b0000: ssOut = 7'b0111111; // 0
      	4'b0001: ssOut = 7'b0000110; // 1
	4'b0010: ssOut = 7'b1011011; // 2
	4'b0011: ssOut = 7'b1001111; // 3
	4'b0100: ssOut = 7'b1100110; // 4
	4'b0101: ssOut = 7'b1101101; // 5
      	4'b0110: ssOut = 7'b1111101; // 6
      	4'b0111: ssOut = 7'b0000111; // 7
      	4'b1000: ssOut = 7'b1111111; // 8
      	4'b1001: ssOut = 7'b1100111; // 9
	4'b1010: ssOut = 7'b1110111; // a
      	4'b1011: ssOut = 7'b1111100; // b
      	4'b1100: ssOut = 7'b0111001; // c
      	4'b1101: ssOut = 7'b1011110; // d
      	4'b1110: ssOut = 7'b1111001; // e
      	4'b1111: ssOut = 7'b1110001; // f
      default: ssOut = 7'b0;
    endcase
	 
	// since we set ssOut to be Active High, invert each bit since the actual
	// 7 segment displays use Active Low
	ssOut = ~ssOut; 
	end

endmodule
