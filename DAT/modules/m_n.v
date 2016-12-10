module m_n(parallel, serial, sd_clock, enable, reset, complete);
	
	//so-called serial port is m width paralel port
	//n width bigger than m, goes from m width to n width
	input enable;
	input [m-1:0]serial;
	input reset;
	input sd_clock;
	output [n-1:0] parallel;
	output         complete;

	wire enable;
	wire [m-1: 0]serial;
	wire reset;
	wire sd_clock;

	reg [n-1:0] parallel  = 0;
	reg         complete;
	reg initial_enable = 0;
	integer count = 0;
	parameter n = 32;	
	parameter m = 4;
	always @ (posedge sd_clock)
		begin
			if (reset) begin
				parallel <= 0;
				initial_enable = 0;
			end else begin
				if (enable) begin
					parallel [n-1-count*m -: m] <= serial;
					initial_enable = 1;
				end else begin
					 parallel <= parallel;
				end
			end
		end
	
	always @ (negedge sd_clock)
		begin
			if(enable) begin
				if(count != n/m-1 && initial_enable) begin
					count = (count + 1);
				end else begin
					count = 0;
					initial_enable = 0;
				end 
			end	
		end
	
	always @ (posedge sd_clock)
		begin
			if (count == n/m-1) begin
				complete = 1'b1;
			end else begin
				complete = 1'b0;
			end
		end	

endmodule

			
