`timescale 1ns / 1ps

//Arithmetic Logic Unit 32-Bit

module Arithmetric_Logic_Unit //Formed using basic systemverilog operators; Trigonometry not yet supported
	(
	parameter OPCODE_LENGTH = 5
	parameter RESULT_WIDTH = 32
	)
	(
	input logic [OPCODE_LENGTH-1:0] Opcode,
	input logic signed [RESULT_WIDTH-1:0] numA,
	input logic signed [RESULT_WIDTH-1:0] numB,
	output logic signed [RESULT_WIDTH-1:0] numC,
	};
	always_comb
	begin
		numC = 'd0; 
		case(Opcode)
			5'b00000: //Add
				numC = numA + numB;
			5'b00001: //Subtract
				numC = numA - numB;
			5'b00010: //Multiply
				numC = numA * numB;
			5'b00011: //Divide
				numC = numA / numB;
			5'b00100: //Square Exponent
				numC = numA * numA;
			5'b00101: //Cubed Exponent
				numC = numA * numA * numA;
			5'b00110: //Square Root
				numC = $sqrt(numA);
			5'b00111: //2 exponential
				numC = 2**(numA);
			5'b01000: //Sine
				numC = numA;
			5'b01001: //Cosine
				numC = numA;
			5'b01010: //Tangent
				numC = numA;
			5'b01011: //Modulo
				numC = numA % numB;
			5'b01100: //Common Log
				numC = numA;
			5'b01101: //Natural Log
				numC = numA;
			5'b01110: //Euler Exponent
				numC = numA;
			5'b01111: //Pi
				numC = 'd3.141579;
			5'b10001: //Memory Add
				numC = numA + numB; //numB contains memory value
			5'b10010: //Memory Subtract
				numC = (~numA + 1) + numB; //numB contains memory value
			5'b10100: //Memory Rememeber
				numC = numA + numB; //numA should be 0
			5'b11000: //Memory Clear
				numC = 'd0;
				numMEM = 'd0;
			default: //Nothing works or NOP initiated; default 0
				numC = 'd0;
		endcase
	end
endmodule

/*
OpCode Data:

00000 Add a+b

00001 Subtract a-b

00010 Multiply a*b

00011 Divide a/b

00100 Square Exponent (a)^2

00101 Cubed Exponent (a)^3

00110 Square Root sqrt(a)

00111 Exponent(2,a) 2^a

01000 Sine sin(a)

01001 Cosine cos(a)

01010 Tangent tan(a)

01011 Modulo (a mod b)

01100 log(a)

01101 ln (ln(a))

01110 Euler Exponent e^a

01111 Pi  ( a = pi)

10001 Memory Add (mem + a)

10010 Memory Subtract (mem - a)

10100 Memory Rememebr (a = mem) 

11000 Memory Clear (mem = 0)

*/