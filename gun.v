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
	reg trigger_sync_0; always @(posedge clk) trigger_sync_0 <= trigger;  
	reg trigger_sync_1; always @(posedge clk) trigger_sync_1 <= trigger_sync_0;

	// Next declare a 16-bits counter
	reg [15:0] trigger_cnt;
	reg trigger_state; // 1 as long as the push-button is active (down)
	
	
	// When the trigger is pushed or released, we increment the counter
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
				trigger_state <= ~trigger_state;  // if the counter is maxed out, trigger changed!
			end
		end
	end

	assign shot = trigger_state;
endmodule

module sensor(
    input clk,
	 input CLR,
    input sensor,  // "trigger" is the glitchy, asynchronous to clk, active low push-button signal
	 output hit
);

	// Next declare a 16-bits counter
	reg [20:0] sensor_cnt; //1,670,000
	reg sensor_state; 
	wire sensor_cnt_max = &sensor_cnt;	// true when all bits of sensor_cnt are 1's

	always @(posedge clk) begin
		if(CLR) begin
			sensor_cnt <= 0;
			sensor_state <= 0;
		end
		else begin
			if(sensor) begin
				sensor_state <= 1;
				sensor_cnt <= 0;
			end
			else begin
				if(sensor_cnt_max) begin
					sensor_state <= 0;
					sensor_cnt <= 0;
				end
				else begin 
					sensor_cnt <= sensor_cnt + 1'd1;
					sensor_state <= sensor_state;
				end
			end
		end
	end
	
	assign hit = sensor_state;
endmodule
