`timescale 1ns / 1ps

module Controller( 
	input logic [31:0] Instruction,
	output logic [4:0] ALUOpCode,
	output logic [12:0] RegA,
	output logic [12:0] RegB,
	output bit MemWrite,
	output bit RegBMemMux,
	output bit RegCMemOutMux
	); //Gives the ALU and MemoryBlock values via InstructionSet
	
	assign ALUOpCode = Instruction[31:27]; //Placed into the ALU's OpCode Input
	assign RegA = Instruction[26:14]; //First value for MuxA
	assign RegB = Instruction[13:1]; //First value for MuxB
	assign MemWrite = Instruction[31]; //Writes the MemoryBlock 
	
	always @(ALUOpCode or MemWrite or RegARegCMux or RegBMemMux or RegCMemOutMux) //4 OpCodes are used to set the muxes to allow memory or RegA and RegB values
	begin
		if (ALUOpCode == 5'b10001) //Mem Add
			MemWrite = 1'b1;
			RegBMemMux = 1'b1;
		if (ALUOpCode == 5'b10010) //Mem Subtract
			MemWrite = 1'b1;
			RegBMemMux = 1'b1;
		if (ALUOpCode == 5'b10100) //Mem Display
			MemWrite = 1'b1;
			RegARegCMux = 1'b1;
		if (ALUOpCode == 5'b11000) //Mem Clear
			MemWrite = 1'b1;
			RegCMemOutMux = 1'b1;
		else
			MemWrite = 1'b0;
			RegARegCMux = 1'b0;
			RegBMemMux = 1'b0;
			RegCMemOutMux = 1'b0;
	end
	
endmodule