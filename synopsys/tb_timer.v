`timescale 1ns/1ps
`include "timer.v"

module tb_timer();
	
	reg clk,reset,start;
	reg [3:0] value;
	wire out;

	timer timer1 (clk,reset,start,value,out);

	initial forever #1 clk = ~clk;

	initial begin
		
		$dumpfile("timer.vcd");
		$dumpvars(0, tb_timer);

		clk = 0;
		reset = 0;
		start = 0;
		value = 3'd0;

		#1 value = 3'd5;
		#2 start = 1;

		#50 $finish();
	end

endmodule