`timescale 1ns / 1ps

module Instruction_Memory#(
	parameter WIDTH = 32,
	parameter PC_WIDTH = 9
	)(
	input logic [PC_WIDTH-1:0] PC_Set,
	output logic [WIDTH-1:0] Instruction
	);

logic [WIDTH-1 :0] Inst_mem [(2**(PC_WIDTH - 2))-1:0];

//     Inst_mem[a] = 32'b11111000000000000011111111111110
assign Inst_mem[0] = 32'b00000000000001100100000011110000 //ADD 25 + 120
assign Inst_mem[1] = 32'b00001000000000011100000000000010 //SUB 7 - 1
assign Inst_mem[2] = 32'b00010000000000010000000000001110 //MULT 4 * 7
assign Inst_mem[3] = 32'b00000000000001011100000001010110 //SUB 23 - 43
assign Inst_mem[4] = 32'b01100000000000000100000000000000 //Log(1)

assign Instruction = Inst_mem [PC_Set[PC_WIDTH-1:0]];

endmodule