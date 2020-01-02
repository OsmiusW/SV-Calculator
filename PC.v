`timescale 1ns / 1ps

module PC#(
	parameter PC_WIDTH = 9
	)(
	input bit clk,
	output bit [PC_WIDTH-1:0] set
	);
	
	assign clk = 1'b0;
	assign set = 'd0;
	
	always@(posedge clk)
	begin
		set = set + 1;
	end
	
endmodule