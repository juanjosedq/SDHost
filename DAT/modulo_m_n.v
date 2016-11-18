module wrapper_paralelo_serial (enable, parallel, p_m, complete, reset, sd_clock);
	
	//paralelo p_m FIXME
	input           enable;
	//input           load_send;  funcionamiento ??
	input [n-1 : 0] parallel;
	input           reset;
	input           sd_clock;

	output p_m;
	output complete;

	wire           enable;
	//wire           load_send;
	wire [n-1 : 0] parallel;
	wire           reset;
	wire           sd_clock;

	reg [m - 1:0] p_m;
	reg complete;

	integer count = 0;		
	parameter n = 8; 
	parameter m = 1;


	always @ (posedge sd_clock)
		begin
			if (reset) begin
				p_m <= 0;
			end else begin
				if (enable) begin
					serial <= parallel [n-1-m*count, n-1-m*(count-1)]; //ojo con esto
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

