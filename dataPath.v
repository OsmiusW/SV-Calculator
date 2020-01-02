`timescale 1ns / 1ps

module dataPath(
	input bit clk,
	output logic [31:0] Out
)

	wire PCtoInst; //Connecting PC to Instruction's set
	wire InstructiontoController; //Inserts Instruction into Controller
	wire ControltoOpCode, ControltonumA; //Controller Gives the OpCode to Arithmetric_Logic_Unit
	wire ControltoMuxB, ControltosetMuxB, ControltosetMuxC; //Controller Instructs MuxB to change to RegB or MemOut
	wire MuxBtoRegB, MemOutput, RegCValue;
	wire ControltoMemWrite, ControltoMemClear;
	
PC pc(
	.clk(clk),
	.set(PCtoInst)
	);

Instruction_Memory InstructionMemory(
	.PC_Set(PCtoInst),
	.Instruction(InstructiontoController)
	);
	
Controller controller(
	.Instruction(InstructiontoController),
	.ALUOpCode(ControltoOpCode),
	.RegA(ControltonumA),
	.RegB(ControltoMuxB),
	.MemWrite(ControltoMemWrite),
	.RegBMemMux(ControltosetMuxB),
	.RegCMemOutMux(ControltosetMuxC)
	);	
	
Mux MuxB(
	.A(ControltoMuxB),
	.B(MemOutput),
	.D(ControltosetMuxB),
	.C(MuxBtoRegB)
	);

Arithmetric_Logic_Unit ArithmetricLogicUnit(
	.Opcode(ControltoOpCode),
	.numA(ControltonumA),
	.numB(MuxBtoRegB),
	.numC(RegCValue)
	);

MemoryBlock memoryblock(
	.MemWrite(ControltoMemWrite),
	.MemClear(ControltoMemClear),
	.RegC(RegCValue),
	.MemOut(MemOutput)
	);
	
Mux MuxC(
	.A(RegCValue),
	.B(MemOutput),
	.D(ControltosetMuxC),
	.C(Out)
	);

//signExtend
	
endmodule