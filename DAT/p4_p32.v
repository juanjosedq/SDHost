module p4_p32(output_32, input_4, clk, enable, reset, push);
	parameter size_in = 4;
	parameter size_out = 32;
	input wire [3:0] input_4;
	input wire clk;
	input wire enable;
	input wire reset;
	output reg [31:0] output_32;
	wire [31:0] output_32_brute;
	reg [31:0] buffer_in;
	reg [3:0] count;
	output reg pop;
	output reg push;	
	
	always @ (posedge clk)
		begin
			if(enable) begin
				if(count != 32) begin
					count = (count + 1);
				end else begin
					count = 0;
				end 
			end	
		end

	always @ (*)
		begin
			if (count == 32) begin
				pop = 1'b1;
			end
		end

	reg [3:0] buf1;
	reg [3:0] buf2;
	reg [3:0] buf3;
	reg [3:0] buf4;
	reg [3:0] buf5;
	reg [3:0] buf6;
	reg [3:0] buf7;
	reg [3:0] buf8;
	
	assign output_32_brute = {buf8, buf7, buf6, buf5, buf4, buf3, buf2, buf1};

	always @ (*) 
		begin 
			if(!reset) begin
				output_32 = output_32_brute;
			end else begin
				output_32 = 32'h00000000;
			end
		end

	always @ (posedge clk) 
		begin
			if (enable) begin
				buf1 <= input_4;		
			end else begin
				buf1 <= 4'bzzzz;		
			end	
		end
	
	always @ (posedge clk) 
		begin
			if (enable) begin
				buf2 <= buf1;		
			end else begin
				buf2 <= 4'bzzzz;		
			end	
		end

	always @ (posedge clk) 
		begin
			if (enable) begin
				buf3 <= buf2;		
			end else begin
				buf3 <= 4'bzzzz;		
			end	
		end
	
	always @ (posedge clk) 
		begin
			if (enable) begin
				buf4 <= buf3;		
			end else begin
				buf4 <= 4'bzzzz;		
			end	
		end

	always @ (posedge clk) 
		begin
			if (enable) begin
				buf5 <= buf4;		
			end else begin
				buf5 <= 4'bzzzz;		
			end	
		end

	always @ (posedge clk) 
		begin
			if (enable) begin
				buf6 <= buf5;		
			end else begin
				buf6 <= 4'bzzzz;		
			end	
		end

	always @ (posedge clk) 
		begin
			if (enable) begin
				buf7 <= buf6;		
			end else begin
				buf7 <= 4'bzzzz;		
			end	
		end
	
	always @ (posedge clk) 
		begin
			if (enable) begin
				buf8 <= buf7;		
			end else begin
				buf8 <= 4'bzzzz;		
			end	
		end
endmodule
