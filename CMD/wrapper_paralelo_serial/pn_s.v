module pn_s (output_m, input_n, clk, enable, reset, pop, ready);
	//ready is a signal that activates as the input is completely transmited  
	parameter input_width = 32; //input width
	parameter output_width = 1; //output width
	parameter trans_time = input_width/output_width;
	output reg [output_width-1 :0] output_m;
	output reg ready;
	input wire [input_width-1:0] input_n;
	input wire clk;
	input wire enable;
	input wire reset;
	reg [4:0]count_2;
	reg [4:0] count;
	output reg pop;
	reg [input_width - 1:0] main_buffer; 
	always @ (posedge clk)
		begin
			if(enable) begin
				if(count != trans_time) begin
					count = (count + 1);
				end else begin
					count = 0;
				end 
			end	
		end

	always @ (posedge clk)
		begin
			if (reset) begin
				main_buffer <= 0;
			end else begin
				if (enable) begin
					main_buffer <= {main_buffer[input_width - output_width - 1:0], input_n};
				end else begin
					 main_buffer <= main_buffer;
				end
			end
			count_2 <= count;

		end
	
	always @ (*) begin
		output_m = main_buffer[input_width -1: input_width - output_width - 1];

		if(count == 31) begin //aqui hay que arreglar algo
			ready <= 1'b1;
		end else begin
			ready = 0;
		end

	end
endmodule

