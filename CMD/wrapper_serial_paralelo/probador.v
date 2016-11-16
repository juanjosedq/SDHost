`timescale 1 ns / 1 ps

module probador (input_1, clk, enable, reset);

	output reg input_1;
	output reg clk;
	output reg enable;
	output reg reset;	           


   initial begin
      enable = 1;
      reset = 0;
      clk = 0;
      input_1 = 0;  
      
      
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 0;
     #2 input_1 = 0;
     #2 input_1 = 0;
     #2 input_1 = 0;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;
     #2 input_1 = 1;

     #5 $finish;
   end

   always #1 clk = !clk;

endmodule // probador
