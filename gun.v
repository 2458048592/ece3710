`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:23 11/14/2013 
// Design Name: 
// Module Name:    gun 
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
module gun(
    input clk,
	 input CLR,
    input trigger,  // "trigger" is the glitchy, asynchronous to clk, active low push-button signal
	 output shot
);

	// First use two flip-flops to synchronize the trigger signal the "clk" clock domain
	reg trigger_sync_0; always @(posedge clk) trigger_sync_0 <= trigger;  // invert trigger to make trigger_sync_0 active high
	reg trigger_sync_1; always @(posedge clk) trigger_sync_1 <= trigger_sync_0;

	// Next declare a 16-bits counter
	reg [15:0] trigger_cnt;
	reg trigger_state; // 1 as long as the push-button is active (down)
	// When the push-button is pushed or released, we increment the counter
	// The counter has to be maxed out before we decide that the push-button state has changed

	wire trigger_idle = (trigger_state==trigger_sync_1);
	wire trigger_cnt_max = &trigger_cnt;	// true when all bits of trigger_cnt are 1's

	always @(posedge clk) begin
		if(CLR) begin
			trigger_cnt <= 0;
			trigger_state <= 0;
		end
		if(trigger_idle) begin
			 trigger_cnt <= 0;  // nothing's going on
			 trigger_state <= trigger_state;
		end
		else begin
			 trigger_cnt <= trigger_cnt + 16'd1;  // something's going on, increment the counter
			 if(trigger_cnt_max) begin
				//trigger_cnt <= trigger_cnt;
				trigger_state <= ~trigger_state;  // if the counter is maxed out, trigger changed!
			end
		end
	end

	assign shot = trigger_state;
endmodule
