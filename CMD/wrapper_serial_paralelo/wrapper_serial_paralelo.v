module wrapper_serial_paralelo (parallel, serial, sd_clock, enable, reset, complete);
	
	parameter n = 7; //paralell signal size at output
	input wire serial;
	input wire sd_clock;
	input wire enable;
	input wire reset;
	output reg [n-1:0] parallel;
	integer count = 0;
	output reg complete = 0;	
	
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
	//complete signal generation
	always @ (posedge sd_clock)
		begin
			if (count == n-1) begin
				complete = 1'b1;
			end else begin
				complete = 1'b0;
			end
		end	

endmodule

			
