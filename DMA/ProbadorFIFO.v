module probadorfifo(parallel, sd_clock, clock, enable_write, enable_read, Clear_in);

	output [n-1 : 0] parallel;
	output sd_clock; 
	output clock;
	output enable_write;
	output enable_read; 
	output Clear_in;	 


	reg [n-1 : 0] parallel;
	reg sd_clock; 
	reg clock;
	reg enable_write;
	reg enable_read; 
	reg Clear_in;	
           
	parameter n = 32;
	//wire [n-1: 0] Data_out;
	
	initial begin

		Clear_in = 1;
		enable_write = 1;
		enable_read = 1;
		sd_clock = 0;
		clock = 0;
	#40	parallel = 32'hFCB01AA;
	#50	parallel = 32'hFCBCAFE;
	#40	parallel = 32'h11CAFEF;
	#40	parallel = 32'h1111000;
	#60	parallel = 32'hFFFFFFF;
	#30	parallel = 32'h11CAFEF;
	#40	parallel = 4'b1011;
	#50	parallel = 4'b0000;
	#30	parallel = 4'b1110;
	#50	parallel = 4'b0111;
	#60	parallel = 4'b0101;
	#50	parallel = 4'b0000;
	#50	enable_read = 0;
	#30	enable_read = 1;
	 #1000 $finish;
   end

   always #60 sd_clock = !sd_clock;
   always #20 clock = !clock;

endmodule

