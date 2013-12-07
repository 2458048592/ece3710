`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:00 11/14/2013 
// Design Name: 
// Module Name:    gun_top 
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
module gun_top(
    input CLK,
    input CLR,
    input p1_trigger,
	 input p1_sens,
	 input p2_trigger,
	 input p2_sens,
	 output p1_shot,
	 output p1_hit,
	 output p2_shot,
	 output p2_hit

    );
	 
	 
	gun p1_gun(CLK,CLR,p1_trigger,p1_shot);
	sensor p1_gun_sens(CLK,CLR,p1_sens,p1_hit);

	gun p2_gun(CLK,CLR,p2_trigger,p2_shot);
	sensor p2_gun_sens(CLK,CLR,p2_sens,p2_hit);


	

endmodule


