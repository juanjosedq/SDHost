module wrapper_paralelo_serial (enable, parallel, serial, complete, reset, sd_clock);
	
	
	input           enable;
	//input           load_send;  funcionamiento ??
	input [n-1 : 0] parallel;
	input           reset;
	input           sd_clock;

	output serial;
	output complete;

	wire           enable;
	//wire           load_send;
	wire [n-1 : 0] parallel;
	wire           reset;
	wire           sd_clock;

	reg serial;
	reg complete;

	integer count = 0;		
	parameter n = 8; 


	always @ (posedge sd_clock)
		begin
			if (reset) begin
				serial <= 0;
			end else begin
				if (enable) begin
					serial <= parallel [n-1-count];
				end else begin
					 serial <= serial;
				end
			end
		end
	
	always @ (negedge sd_clock)
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

