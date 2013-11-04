`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:33:05 11/03/2013
// Design Name:   controller_integrated
// Module Name:   /home/dan/Documents/xilinx_projects/CPU/controller_integrated_test.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller_integrated
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controller_integrated_test;

	// Inputs
	reg CLK;
	reg CLR;
	reg [17:0] inst;
	reg [17:0] external_din;

	// Outputs
	wire w1;
	wire [15:0] addr1;
	wire [17:0] data1;
	wire [4:0] FLAGS;
	wire [15:0] B;
	wire [15:0] aluOut;
	wire PC_inc;
	wire JAddrSelect;

	// Instantiate the Unit Under Test (UUT)
	controller_integrated uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.inst(inst), 
		.external_din(external_din), 
		.w1(w1), 
		.addr1(addr1), 
		.data1(data1), 
		.FLAGS(FLAGS), 
		.B(B), 
		.aluOut(aluOut), 
		.PC_inc(PC_inc), 
		.JAddrSelect(JAddrSelect)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		inst = 0;
		external_din = 0;

		CLR = 1;
		#3 CLR = 0;
		// Wait 100 ns for global reset to finish
		#100;
		
		inst = 16'h6aff; //        addui 255, $10
		#2;
		if(data1 != 16'b000000011111111)
				begin
					$display("ERROR1: data1 was %0d; expected 255", data1);
				end
		
		inst = 16'hfb01; // lui 1, $11
		#2;
		
		inst = 16'h0a2b; // or $11, $10
		#2;
		
		inst = 16'h490a;  //load $9, $10
		#2;
		if(addr1 != 16'b000000111111111)
				begin
					$display("ERROR2: Addr1 was %0d; expected 511", addr1);
				end
        
		inst =  16'hd114; // movi 20, $1
		#2;
		
		inst = 16'h0232; //xor $2, $2
		#2;
		if(data1 != 16'b0)
				begin
					$display("ERROR3: data1 was %0d; expected 0", data1);
				end
				
		inst = 16'h522a; // addi 42, $2
		#2;
		
		inst = 16'h0212; // and $2, $2
		#2;
		if(data1 != 8'h2a) // 42
				begin
					$display("ERROR3.1: data1 was %0d; expected 42", data1);
				end
		
		inst =  16'hde63; // movi 99, $14
		#2;
		
		inst = 16'h4142; // stor $1, $2
		#2;
		if(addr1 != 16'b0000000000010100)
				begin
					$display("ERROR5: Addr1 was %0d; expected 20", addr1);
				end
				
		inst = 16'h0212; // and $2, $2
		#2;
		if(data1 != 8'h2a) // 42
				begin
					$display("ERROR5.1: data1 was %0d; expected 42", data1);
				end
		
		inst =  16'hdf64; // movi 100, $15
		#2;
		
			
		inst =  16'hd114; // movi 20, $1
		#2;
		inst = 16'h4201;  //load $2, $1
		#2;
		if(addr1 != 16'b0000000000010100)
				begin
					$display("ERROR6: addr1 was %0d; expected 20", addr1);
				end
				
		inst = 16'h0212; //xor $2, $2
		// Add stimulus here

	end
	
	always 
		#1 CLK = ~CLK;
      
endmodule

