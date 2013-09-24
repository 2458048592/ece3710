`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Plan B
//
// Module: 	dataPath
// Description: dataPath module instantiates the ALU and Regfile as well as the necessary muxes.
//      The outputs include everything that other modules may want to see.  This module also
//      has an enhancement on the RegFile which allows a controller to not load the ALU result into
//      a register.  This is done with the active-Low high-bit of the loadReg input.  The lower 4 bits 
//      indicate the register to be written, but if the high bit is set to 1, the write-enable signal
//      for that register will not turn on.  This means that we can store register values without
//      constantly performing intensive operations on the ALU.
//
//////////////////////////////////////////////////////////////////////////////////
module dataPath(
	input CLK, CLR, selectImm,
	input [4:0] loadReg, // When the MSB is 1, loading is disabled, when 0 loading is enabled.
	input [3:0] readRegA, readRegB,
	input [7:0] Imm, op,
	output [15:0] A, B, Z,
	output [4:0] flags
    );
	 
	// This is not necessary, since each register is Write-Enabled with enWrite.  Commented out
	//wire [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in,
   	//           r11in, r12in, r13in, r14in, r15in,
	wire [15:0] r0out, r1out, r2out, r3out, r4out,
              r5out, r6out, r7out, r8out, r9out, r10out, r11out, r12out, r13out,
              r14out, r15out, RegSelect; // RegSelect is fed into a 2to1 mux to choose
                                         // between an immediate or B

	reg [15:0] enWrite, reset; // Each bit in enWrite and reset corresponds to
                             // a register E.g. r0 = enWrite[0], reset [0]  
	
	ALU _alu(flags[4], A, B, op, Z, flags[4], flags[3], flags[2], flags[1], flags[0]);
	
	// This is not necessary, since each register is Write-Enabled with enWrite.  Commented out
  	// Write to read file
	//decoder_4_to_16_16bit loadBus(Z, loadReg[3:0], r0in, r1in, r2in, r3in, r4in, r5in, r6in,
   	//                                         r7in, r8in, r9in, r10in, r11in, r12in, 
   	//                                         r13in, r14in, r15in);
	
	// Set the input for each register to be the output from the ALU
	RegFile _regfile(CLK, Z, Z, Z, Z, Z, Z, Z, Z, Z, Z,
                        Z, Z, Z, Z, Z, Z,
                        enWrite, reset,
                        r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out, r8out,
                        r9out, r10out, r11out, r12out, r13out, r14out, r15out);
	
  	// Read port A
	mux16_to_1_16bit ALUBusA(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out,
                           r8out, r9out, r10out, r11out, r12out, r13out, r14out,
                           r15out, readRegA, A);

  	// Read port B
	mux16_to_1_16bit ALUBusB(r0out, r1out, r2out, r3out, r4out, r5out, r6out, r7out,
                           r8out, r9out, r10out, r11out, r12out, r13out, r14out,
                           r15out, readRegB, RegSelect);
	
  	// determines whether an imm or B is loaded (0 selects B, 1 selects Imm)
  	// TODO: Once the primary controller is completed, we need to replace the concatenation of the Sign-extended
  	//    Immediate with a full 16-bit value Immediate so that the Controller performs the sign-extension
	mux2_to_1_16bit ImmMux(RegSelect, {Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],Imm[7],
                                     Imm[7],Imm}, selectImm, B);
												 
	//  If the decoder doesn't have blocking statements, zero is always displayed
   	// 	on the FPGA and simulation.
	always @ (*) begin
		if (CLR == 1'b1) begin reset = 16'b1111111111111111; enWrite = 16'b0; end
		else begin
			reset = 16'b0;
			// loadReg is a 5-bit address/enable vector.  The lower four
			// bits indicate the address of the register to be enabled, but the
			// MSB indicates whether writing is enabled.  This MSB is active-Low,
			// meaning that when it is low, writing is enabled for the register
			// addressed by the lower 4 bits.  When it is high, writing is disabled.
			// This decision was for ease of reading and implementation.
			case(loadReg) // decodes which register to enable
				0: enWrite =  16'b0000000000000001;
				1: enWrite =  16'b0000000000000010;
				2: enWrite =  16'b0000000000000100;
				3: enWrite =  16'b0000000000001000;
				4: enWrite =  16'b0000000000010000;
				5: enWrite =  16'b0000000000100000;
				6: enWrite =  16'b0000000001000000;
				7: enWrite =  16'b0000000010000000;
				8: enWrite =  16'b0000000100000000;
				9: enWrite =  16'b0000001000000000;
				10: enWrite = 16'b0000010000000000;
				11: enWrite = 16'b0000100000000000;
				12: enWrite = 16'b0001000000000000;
				13: enWrite = 16'b0010000000000000;
				14: enWrite = 16'b0100000000000000;
				15: enWrite = 16'b1000000000000000;
				default: enWrite = 16'b0;
			endcase
		end
	end
endmodule

// This module is not necessary for correct operation, but was designed for a just in case.  It isn't needed.
module decoder_4_to_16_16bit(
	input [15:0] in,
	input [3:0] select,
	output reg [15:0] r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in);
	
	always @ (*) begin
		case (select)
			0:  begin r0in = in; {r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			1: begin r1in = in; {r0in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			2: begin r2in = in; {r0in, r1in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			3: begin r3in = in; {r0in, r1in, r2in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			4: begin r4in = in; {r0in, r1in, r2in, r3in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			5: begin r5in = in; {r0in, r1in, r2in, r3in, r4in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			6: begin r6in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			7: begin r7in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			8: begin r8in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			9: begin r9in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r10in, r11in, r12in, r13in, r14in, r15in} = 0; end
			10: begin r10in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r11in, r12in, r13in, r14in, r15in} = 0; end
			11: begin r11in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r12in, r13in, r14in, r15in} = 0; end
			12: begin r12in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r13in, r14in, r15in} = 0; end
			13: begin r13in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r14in, r15in} = 0; end
			14: begin r14in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r15in} = 0; end
			15: begin r15in = in; {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in} = 0; end
			default: {r0in, r1in, r2in, r3in, r4in, r5in, r6in, r7in, r8in, r9in, r10in, r11in, r12in, r13in, r14in, r15in} = 0;
		endcase
	end
	
endmodule
