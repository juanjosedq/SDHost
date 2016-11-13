module s_pn (output_n, input_1, clk, enable, reset, push);
	
	parameter n = 32; //paralell signal size at output
	input wire input_1;
	input wire clk;
	input wire enable;
	input wire reset;
	output reg [n-1:0] output_n;
	reg [4:0] count;
	output reg push;	
	
	always @ (posedge clk)
		begin
			if (reset) begin
				output_n <= 0;
			end else begin
				if (enable) begin
					output_n <= {output_n[n-2:1], input_1};
				end else begin
					 output_n <= output_n;
				end
			end
		end
	
	always @ (posedge clk)
		begin
			if(enable) begin
				if(count != n) begin
					count = (count + 1);
				end else begin
					count = 0;
				end 
			end	
		end
	//push signal generation
	always @ (*)
		begin
			if (count == 32) begin
				push = 1'b1;
			end
		end	

endmodule

			
