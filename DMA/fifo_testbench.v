module fifo_testbench; //testbench y probador de fifo

	reg [n-1 : 0] parallel;
	reg sd_clock, clock;
	reg enable_write, enable_read, Clear_in;	           
	parameter n = 32;
	wire [n-1: 0] Data_out;
	asynchronous_fifo FIFO
        //Reading port
	(Data_out, 
	Empty_out, //almost empty signal
	enable_read,
	sd_clock,        
	//Writing port.	 
	parallel,  
	Full_out, //almost full signal
	enable_write,
	clock,	 
	ack_write);
	initial begin

		Clear_in = 1;
		enable_write = 1;
		enable_read = 1;
		sd_clock = 0;
		clock = 0;
	#4	parallel = 32'hFCB01AA;
	#5	parallel = 32'hFCBCAFE;
	#4	parallel = 32'h11CAFEF;
	#4	parallel = 32'h1111000;
	#6	parallel = 32'hFFFFFFF;
	#3	parallel = 32'h11CAFEF;
	#4	parallel = 4'b1011;
	#5	parallel = 4'b0000;
	#3	parallel = 4'b1110;
	#5	parallel = 4'b0111;
	#6	parallel = 4'b0101;
	#5	parallel = 4'b0000;
	#5	enable_read = 0;
	#30	enable_read = 1;




     #200 $finish;
   end

  initial begin       
     $dumpfile("testbench.vcd");          
     $dumpvars(0,fifo_testbench);
  end

   always #6 sd_clock = !sd_clock;
   always #2 clock = !clock;
endmodule // probador
