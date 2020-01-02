`timescale 1ns / 1ps

module MemoryBlock(
	input bit MemWrite,
	input bit, MemClear,
	input logic [31:0] RegC,
	output logic [31:0] MemOut
	);
	
	always_ff@(posedge MemWrite) //Holds one value or edits it depending on what occurs
	begin
		if(~MemClear)
			MemOut <= 'b0;
		else
			MemOut <= RegC;
		end
	end
	
endmodule