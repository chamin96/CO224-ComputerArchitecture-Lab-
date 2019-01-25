module timer (clk,reset,start,value,out);

	input clk;
	input reset;
	input start;
	output reg out;
	input [3:0] value;

	reg [3:0] counter;

	reg start_flag;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			out = 0;
			counter = 3'd0;
			start_flag = 0;
		end

		else if (start==1) begin
			counter = 3'd0;
			start_flag = 1;
		end

		else if (counter == value) begin
			out = 1;
			start_flag = 0;
		end

		else if (start_flag==1) begin
			counter = counter + 3'd1;
		end
	end

endmodule