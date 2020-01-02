`timescale 1ns / 1ps

module Mux
	#(parameter WIDTH = 32)
	(input logic [WIDTH-1:0] A, B, 
	input logic D,
	output logic [WIDTH-1:0] C); //Display Value A when D is 0; Display Value B when D is 1
	
	assign C = D ? B : A; 
	
endmodule