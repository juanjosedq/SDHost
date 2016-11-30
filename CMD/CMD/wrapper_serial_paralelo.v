module wrapper_serial_paralelo (parallel, serial, sd_clock, enable, reset, complete);
	

	input enable;
	input serial;
	input reset;
	input sd_clock;
	//input [7:0]framesize

	output [n-1:0] parallel;
	output         complete;

	wire enable;
	wire serial;
	wire reset;
	wire sd_clock;
	//wire [7:0]framesize

	reg [n-1:0] parallel;
	reg         complete;

	integer count = 0;
	parameter n = 15;	
	
	always @ (posedge sd_clock)
		begin
			if (reset) begin
				parallel [n-1:0] <= 0;
			end else begin
				if (enable) begin
					parallel [n-1-count] <= serial;
				end else begin
					 parallel <= parallel;
				end
			end
		end
	
	always @ (posedge sd_clock)
		begin
			if(enable) begin
				if(count != n-1) begin
					count = (count + 1);
				end else begin
					count = 0;
				end 
			end	
		end
	
	always @ (posedge sd_clock)
		begin
			if (count == n-1) begin
				complete = 1'b1;
			end else begin
				complete = 1'b0;
			end
		end	

endmodule

			
