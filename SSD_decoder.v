`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:58 09/17/2013 
// Design Name: 
// Module Name:    SSD_decoder 
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
module SSD_decoder(
	 input clk,
	 input clr,
    input [15:0] number,
    output reg [6:0] ssOut,
    output reg [3:0] select
    );
  reg  [27:0]  divclk;
  reg  [3:0] display; // used for each display
  
  always @(posedge clk, posedge clr) 	
    begin							
        if (clr)
			divclk <= 0;
        else
			divclk <= divclk + 1'b1;
  end
  
  assign sev_seg_clk  = divclk[16:15];  // every divclk[17] (~381Hz) = (100MHz / 2 **18)
													 // http://www-classes.usc.edu/engr/ee-s/201/Spring2012/ISE/test_nexys3_verilog/test_nexys3_verilog.v
						 
						 
	always @ (sev_seg_clk)
	begin
		case (sev_seg_clk) 
				2'b00: begin
					select = 4'b1110;
					display = number[3:0];
				end
				2'b01: begin 
					select = 4'b1101;
					display = number[7:4];				
				end
				2'b10: begin 
					select = 4'b1011;
					display = number[11:8];
				end
				2'b11: begin
					select = 4'b0111;
					display = number[15:12];
				end
		endcase 
	end
	
	
	// ssOut format {g, f, e, d, c, b, a}
	always @(display) begin
    case (display)
      4'b0000: ssOut = 7'b0111111;
      4'b0001: ssOut = 7'b0000110;
		4'b0010: ssOut = 7'b1011011;
		4'b0011: ssOut = 7'b1001111;
		4'b0100: ssOut = 7'b1100110;
		4'b0101: ssOut = 7'b1101101;
      4'b0110: ssOut = 7'b1111101;
      4'b0111: ssOut = 7'b0000111;
      4'b1000: ssOut = 7'b1111111;
      4'b1001: ssOut = 7'b1100111;
		4'b1010: ssOut = 7'b1110111;
      4'b1011: ssOut = 7'b1111100;
      4'b1100: ssOut = 7'b0111001;
      4'b1101: ssOut = 7'b1011110;
      4'b1110: ssOut = 7'b1111001;
      4'b1111: ssOut = 7'b1110001;
      default: ssOut = 7'b0;
    endcase
	 
	 
	  ssOut = ~ssOut;
	 end

endmodule
