module s_pn (output_n, input_1, clk, enable, reset, push);
	
	parameter n = 7; //paralell signal size at output
	input wire input_1;
	input wire clk;
	input wire enable;
	input wire reset;
	output reg [n-1:0] output_n;
	integer count = 0;
	output reg push = 0;	
	
	always @ (posedge clk)
		begin
			if (reset) begin
				output_n [n-1:0] <= 0;
			end else begin
				if (enable) begin
					output_n [n-1-count] <= input_1;
				end else begin
					 output_n <= output_n;
				end
			end
		end
	
	always @ (posedge clk)
		begin
			if(enable) begin
				if(count != n-1) begin
					count = (count + 1);
				end else begin
					count = 0;
				end 
			end	
		end
	//push signal generation
	always @ (posedge clk)
		begin
			if (count == n-1) begin
				push = 1'b1;
			end else begin
				push = 1'b0;
			end
		end	

endmodule

			
