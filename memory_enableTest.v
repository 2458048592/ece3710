`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
// 
////////////////////////////////////////////////////////////////////////////////

module memory_enableTest;

	// Inputs
	reg CLK;
	reg CLR;
	reg w0;
	reg w1;
	reg e0;
	reg e1;
	reg [9:0] addr0;
	reg [9:0] addr1;
	reg [17:0] data0;
	reg [17:0] data1;

	// Outputs
	wire [17:0] out0;
	wire [17:0] out1;

	// Instantiate the Unit Under Test (UUT)
	memory uut (
		.CLK(CLK), 
		.CLR(CLR), 
		.w0(w0), 
		.w1(w1), 
		.e0(e0), 
		.e1(e1), 
		.addr0(addr0), 
		.addr1(addr1), 
		.data0(data0), 
		.data1(data1), 
		.out0(out0), 
		.out1(out1)
	);

	integer i;

	initial begin
		// Initialize Inputs
		CLK = 0;
		CLR = 0;
		w0 = 0;
		w1 = 0;
		e0 = 0;
		e1 = 0;
		addr0 = 0;
		addr1 = 0;
		data0 = 0;
		data1 = 0;
		i = 0;

		// Wait 100 ns for global reset to finish
		#10;
		e0 = 1'b1; e1 = 1'b1;
		w0 = 1'b1; w1 = 1'b1;
		for (i=0; i<1024; i=i+2) begin
			addr0 = i;
			data0 = i;
			addr1 = i + 1;
			data1 = i + 1;
			#2;
		end
		
		e0 = 1'b0; e1 = 1'b0;
        
		// Add stimulus here
		addr0 = 0;
		addr1 = 1;
		data0 = 42;
		data1 = 43;
		
		#2;
		if (out0 != 1022) $display("ERROR: out0 was not set to 0.  addr0: %b, out0: %d", addr0, out0);
		if (out1 != 1023) $display("ERROR: out1 was not set to 1.  addr1: %b, out1: %d", addr1, out1);
		e0 = 1'b1; e1 = 1'b1;
		#2;
		
		e0 = 1'b0; e1 = 1'b0;
		if (out0 != 42) $display("ERROR: out0 was not set to 0.  addr0: %b, out0: %d", addr0, out0);
		if (out1 != 43) $display("ERROR: out1 was not set to 1.  addr1: %b, out1: %d", addr1, out1);
		
		addr0 = 15;
		addr1 = 14;
		data0 = 1001;
		data1 = 1002;
		#2;
		
		if (out0 != 42) $display("ERROR: out0 was not set to 0.  addr0: %b, out0: %d", addr0, out0);
		if (out1 != 43) $display("ERROR: out1 was not set to 1.  addr1: %b, out1: %d", addr1, out1);
		
	end
	
	always begin
		#1 CLK = ~CLK;
	end
      
endmodule

