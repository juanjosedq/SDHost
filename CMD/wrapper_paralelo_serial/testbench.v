module testbench;  

	parameter n = 48; 

	wire           enable;
	wire [n-1 : 0] parallel;
	wire           reset;
	wire           sd_clock;
	wire           serial;
	wire           complete;
	wire	       load_send;


  initial begin       
     $dumpfile("testbench.vcd");          
     $dumpvars(0,testbench);
  end
       

  probador valores (parallel, sd_clock, enable, reset, load_send);

  wrapper_paralelo_serial c1 (enable, parallel, serial, complete, reset, sd_clock, load_send); 
   

endmodule 
