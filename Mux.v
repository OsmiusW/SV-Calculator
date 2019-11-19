`timescale 1ns / 1ps

module Mux
	#(parameter WIDTH = 32)
	(input logic [WIDTH-1:0] A, B, 
	input logic D,
	output logic [WIDTH-1:0] C);
	
	
	assign C = D ? B : A;
	
	
endmodule