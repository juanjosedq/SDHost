module testbench;    

	parameter n = 7; //paralell signal size at output
	wire input_1;
	wire clk;
	wire enable;
	wire reset;
	wire [n-1:0] output_n;
	wire push;

  initial begin          
     $dumpfile("testbench.vcd");     
     $dumpvars(0,testbench);
  end
       

  probador valores (input_1, clk, enable, reset);

  wrapper_serial_paralelo c1 (output_n, input_1, clk, enable, reset, push); 
   

endmodule 
