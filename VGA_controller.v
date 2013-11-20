`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:59 11/19/2013 
// Design Name: 
// Module Name:    VGA_controller 
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

module VGA(
	input CLK,
	input CLR,
	output hSync,
	output vSync,
	output [7:0] rgb
	);
	
	wire [9:0] hCount, vCount;
	wire bright;
	VGA_controller control(CLK,CLR, hSync, vSync, bright, hCount, vCount);
	VGA_Bitgen bits(bright, 8'b0, hCount, vCount, rgb);
	
endmodule 
module VGA_controller(
    input CLK,
    input CLR,
//	 output reg 	     clkDivPulse,
//	 output reg [9:0] hTickCounter,
//	 output reg [9:0] vLineCounter,
    output reg hSync,
	 
    output reg vSync,
    output reg bright,
    output reg [9:0] hCount,
    output reg [9:0] vCount
    );
	 
	
// ***********************************************************
	initial begin
	 hSync  = 1; // Active low signal for the VGA port
	 vSync  = 1; // Active low signal for the VGA port
	bright = 0; // Active high signal for the Bitgen circuit
	hCount = 0; // Horizontal pixel counter for the Bitgen circuit 
    vCount = 0; // Vertical pixel cunter for the Bitgen circuit
//	 clkDivPulse = 0;
//	 hTickCounter = 0; // Used to store the horizontal clock tick count
//	 vLineCounter = 0;
   end
	 
 	 reg 	     clkDivPulse  = 0; // Used to notify every 25MHz clock tick
	 reg 		  lineEnable = 0; // Used to enbales the vertical counter

	 reg 		  hCountEnable = 0; // Used to enbales the horizontal pixel counter
	 reg 		  vCountEnable = 0; // Used to enbales the vertical pixel counter	
  	 reg [1:0] clkDivCount  = 0; // Used to count to 4 to determine the 25MHz ticks
	 reg [9:0] hTickCounter = 0; // Used to store the horizontal clock tick count
	 reg [9:0] vLineCounter = 0; // Used to store the vertical clock tick count	 

 	 // ***********************************************************
	 // Clock division pulse generator block

	 /* 
	  * Create a sequential block that generates an "enable" pulse for
	  * every 4 ticks of the 100MHz input clock
	  */
		always@(posedge CLK) begin
			if(CLR) begin
				clkDivPulse <= 0;
				clkDivCount <= 0;
			end
			else if(clkDivCount == 2'b11) begin
				clkDivPulse <= 1;
				clkDivCount <= 0;
			end
			else begin
				clkDivPulse <= 0;
				clkDivCount <= clkDivCount + 1;
			end
		end
		
		
	 // ***********************************************************
	 // Horizontal and verical clock tick counters

	 /* 
	  * For the ease of generating the hSync and Vsync signals
	  * create two counters that count up to 800 for horizontal tick
	  * and (one line) and 521 for verital ticks every time you finish 
	  * a line. 
	  *
	  * Please note that this block should receive the same 100MHz clock
	  * and use the pulse generated above to enable the counting
	  *
	  * Please note that these cunters are different than then hCount
	  * and vCount counters as these only count up to 640 and 480 respectively
	  */
	   parameter hTick = 799;
		parameter vTick = 520;

	 	always@(posedge CLK) begin
			if(CLR) begin
				hTickCounter <= 0;
			end
			else if(clkDivPulse) begin
				if(hTickCounter == hTick) begin
					hTickCounter <= 0;
					lineEnable <= 1;
				end
				else begin
					hTickCounter <= hTickCounter + 1;	
					lineEnable <= 0;
				end
			end
			else begin
				lineEnable <= 0;
				hTickCounter <= hTickCounter;
			end
		end
	 
	  always@(posedge CLK) begin
			if(CLR) begin
				vLineCounter <= 0;
			end
			else if(lineEnable) begin
				if(vLineCounter == vTick)
					vLineCounter <= 0;
				else
					vLineCounter <= vLineCounter + 1;	
			end
			else begin
				vLineCounter <= vLineCounter;
			end
		end
		
	 // ***********************************************************
	 // Horizontal and vertical pixel counters
	 
	 /* 
	  * Same as above tick counters, these counters need to count up to
	  * 640 and 480 respectively, you can use the hCountEnable and
	  * vCountEnbale generated from the block below to enable their counting
	  *
	  * Please note that this block should receive the same 100MHz clock
	  * and use the pulse generated above to enable the counting
	  */
	   parameter hPix = 640;
		parameter vPix = 480;
		
		always@(posedge CLK) begin
			if(CLR) begin
				hCount <= 0;
			end
			else if(hCountEnable && clkDivPulse && bright) begin
				if(hCount == hPix)
					hCount <= 0;
				else
					hCount <= hCount + 1;	
			end
			else if (~hCountEnable)
				hCount <= 0;
		end
	 
	  always@(posedge CLK) begin
			if(CLR) begin
				vCount <= 0;
			end
			else if(vCountEnable && lineEnable) begin
				if(vCount == vPix)
					vCount <= 0;
				else
					vCount <= vCount + 1;	
			end
			else if (~vCountEnable)
				vCount <= 0;
		end
	  
	 // ***************************************************************
	 // Generate the hSync, vSync and bright signals
	 
	 /* 
	  * Based on the current counts on the hTickCounter and vLineCounter
	  * you can set the hSync, vSync and bright signal. Note that this 
	  * block is combinational, looks at the state of the counters and 
	  * reacts on the them to generate the outputs rigth away.
	  *
	  * Since the hCount and Vcount (640, 480) need to be determined 
	  * the same way using the above counters, it is helpful if you create 
	  * enable signals to help set them in their block above.
	  */
	  
	  parameter hPulseWidth = 96;
	  parameter hFrontPorch = 16;
	  parameter hBackPorch = 48;
	  
	  parameter vPulseWidth = 2;
	  parameter vFrontPorch = 10;
	  parameter vBackPorch = 29;
	  
	 
	  	always@(*) begin
			if (hTickCounter <= hPulseWidth - 1) begin // subtract one because it starts at 0
				hSync = 0;
				bright = 0;
				hCountEnable = 0;
			end 
			else if (hTickCounter > (hPulseWidth + hBackPorch - 1) && hTickCounter <= (hPulseWidth + hBackPorch + hPix -1)) begin
				bright = 1;
				hCountEnable = 1;
				hSync = 1;

			end
			else begin
				hSync = 1;
				bright = 0;
				hCountEnable = 0;
			end
		end
		
		always@(*) begin
			if (vLineCounter <= vPulseWidth - 1) begin // subtract one because it starts at 0
				vSync = 0;
				vCountEnable = 0;
			end
			else if (vLineCounter > (vPulseWidth + vBackPorch - 1) && vLineCounter <= (vPulseWidth + vBackPorch + vPix -1)) begin
				//bright = 1;
				vSync = 1;
				vCountEnable = 1;
			end
			else begin
				vSync = 1;
				//bright = 0;
				vCountEnable = 0;
			end
		end

	 // ***********************************************************

endmodule

module VGA_Bitgen(input            bright, 
						input 	  [7:0] pixelData,
						input 	  [9:0] hCount, vCount,
						output reg [7:0] rgb);
	 
	 // ***********************************************************
	 parameter BLACK   = 8'b000_000_00; // 8-bit black color
	 parameter WHITE	= 8'b111_111_11;
	 parameter RED		= 8'b111_000_00;
	 parameter GREEN = 8'b000_111_00;
	 parameter BLUE = 8'b000_000_00;
	 
	 // ***********************************************************
	 // Cobminational rgb setter
	 
	 /* 
	  * As described in the tutorial this circuit is a simple combinational
	  * block that sets the 8-bit rgb based on some pixel data.
	  */
	  always@(*)
			if(~bright)
				rgb = BLACK;
			else if (((hCount >= 100) && (hCount <= 300)) && ((vCount >= 150) && (vCount <= 350)))
				rgb = WHITE;
			else 
				rgb = RED;
	  
	  
	 // ***************************************************************
	 
endmodule
