`timescale 1ns / 1ps

module FullAdder
	(input logic [31:0] A, B, Cin
	output logic [31:0] C, Cout);
	

assign C = (A*B*Cin)+(A*~B*~Cin)+(~A*B*~Cin)+(~A*~B*Cin);
assign Cout = (A*B*Cin) + (A*B*~Cin) + (A*~B*Cin) + (~A*B*Cin);

endmodule