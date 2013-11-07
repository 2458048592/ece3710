`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
//
//////////////////////////////////////////////////////////////////////////////////
// A note about testing the instruction_FSM.  The FLAGS from the previous
// operation are not saved in this module until the fetch state completes
// This means that the life-cycle of an instruction begins in the decode
// state then through whatever next states there are (alu, load1, stor1,
// jump, etc. and ends at fetch.)  For testing, the FLAGS must be set for
// 2 clock cycles before they can change.  Lifecycle for a non-memory
// instruction is 3 clock cycles.  Lifecycles for a memory instruction is
// 4 clock cycles.
module instruction_FSM ( CLK, CLR, inst, _FLAGS, PC_inc, JAddrSelect, loadReg);
	input CLK, CLR;
	input [17:0] inst;
	input [4:0] _FLAGS;
	output reg PC_inc, JAddrSelect, loadReg;
	
	parameter MEM = 4'b0100;
	parameter LOAD_1 = 4'b0000;
	parameter STOR_1 = 4'b0100;
	
	// MEM is the opcode, JCOND and SCOND are the secondary codes, JUC through BLE are stored in bits [3:0]
	// JCOND will be absolute memory jumps
	// SCOND will be relative memory jumps
	parameter JCOND = 4'b1100; // JCOND uses unsigned comparison for BEQ through BLT
	//parameter SCOND = 4'b0100; // SCOND is the same as the MEM and is a signed comparison for BEQ through BLE
	parameter JUC = 4'b1110; // JUC jumps directly 
	parameter BEQ = 4'b0000;
	parameter BNEQ = 4'b0001;
	
	parameter fetch = 3'b000; // fetch is the initial state, set up the address for Instruction Memory
	parameter decode = 3'b001; // decode is the state after getting the data_out from the Instruction Memory
	parameter alu = 3'b010; // ALU is a state after decode which says go straight to fetch;
	parameter stor1 = 3'b011; // stor1 is a state after decode which says wait several cycles
	parameter stor2 = 3'b100; // waits for the output, then sets up the instructions to push to the register
	parameter load1 = 3'b101; // load1 is a state after decode which says wait several cycles
	parameter load2 = 3'b110; // waits for the output of memory to say that the data was loaded
	parameter jump = 3'b111; // set up the program counter with the new address
	
	reg [2:0] NS;
	reg [2:0] PS;
	reg [4:0] FLAGS;
	
	// Present State Logic
	always @ (posedge CLK) begin
		if (CLR) begin PS <= fetch; FLAGS <= _FLAGS; end
		else begin
			PS <= NS;
			if (PS == fetch) FLAGS <= _FLAGS;
			else FLAGS <= FLAGS;
		end
	end
	
	// Next State Logic 
	always @ (*) begin
		case (PS)
			fetch: begin NS <= decode; end
			decode: begin
				case (inst[15:12])
					MEM: begin
						case (inst[7:4])
							LOAD_1: begin
								NS <= load1;
							end
							STOR_1: begin
								NS <= stor1;
							end
							JCOND: begin
								NS <= jump;
							end
							default: begin NS <= fetch; end
						endcase
					end
					default: begin
						NS <= alu;
					end
				endcase
			end
			alu: begin
				NS <= fetch;
			end
			load1: begin
				NS <= load2;
			end
			load2: begin
				NS <= fetch;
			end
			stor1: begin
				NS <= stor2;
			end
			stor2: begin
				NS <= fetch;
			end
			jump: begin
				NS <= fetch;
			end			
			default: begin
				NS <= fetch;
			end
		endcase
	end
	
	// Output Logic
	always @ (*) begin
		PC_inc <= 1'b0;
		JAddrSelect <= 1'b0;
		loadReg <= 1'b0;
		case (PS)
			fetch: begin end // Probably need to set the loadReg[4] to 1 so we don't modify the Registers
			decode: begin end // Probably need to set the loadReg[4] to 1 so we don't modify the Registers
			alu: begin PC_inc <= 1'b1; loadReg <= 1'b1; end
			load1: begin end // Probably need to set the loadReg[4] to 1 so we don't modify the Registers
			load2: begin PC_inc <= 1'b1; loadReg <= 1'b1; end
			stor1: begin end // Probably need to set the loadReg[4] to 1 so we don't modify the Registers
			stor2: begin PC_inc <= 1'b1; loadReg <= 1'b0; end
			jump: begin
				//JAddrSelect <= 1'b1;
				// C, L, F, Z, N
				case (inst[3:0])
					JUC: begin JAddrSelect <= 1'b1; end
					BEQ: begin
						// Remember that the Registers will not be updated until the next clock cycle,
						// so the NOP instruction that gets sent to the ALU will not update the flags
						// until the next posedge CLK
						// Since this is a BEQ, then if the Z Flag is 1, the arguments
						// to the CMP operation were equal
						if (FLAGS[1] == 1'b1) begin JAddrSelect <= 1'b1; loadReg <= 1'b0; end
					end
					BNEQ: begin
						// Since this is a BNEQ, then if the Z Flag is 0, the arguments
						// to the CMP operation were not equal
						if (FLAGS[1] == 1'b0) begin JAddrSelect <= 1'b1; loadReg <= 1'b0; end
					end
					// other functionality can be added easily here to check the other flags for the GE, GT, LE, and LT
					// Branches.
					default: begin PC_inc <= 1'b1; JAddrSelect <= 1'b0; loadReg <= 1'b0; end
				endcase
			end
			default: begin
				PC_inc <= 1'b1;
			end
		endcase
	end
endmodule

