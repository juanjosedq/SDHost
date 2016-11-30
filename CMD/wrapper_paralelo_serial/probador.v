`timescale 1 ns / 1 ps

module probador (parallel, sd_clock, enable, reset, load_send);

	output reg [n-1 : 0] parallel;
	output reg sd_clock;
	output reg enable;
	output reg reset;
	output reg load_send;	           

	parameter n = 48;

   initial begin
      load_send = 0;
      enable = 1;
      reset = 0;
      sd_clock = 0;
      parallel [n-1 : 0] = 48'b11110000_11110000_11110000_11110000_11110000_11110000;

      #3 load_send = 1;

     #100 parallel [n-1 : 0] = 48'b11111111_11111111_11111111_11111111_11111111_11111111;

     #100 $finish;
   end

   always #1 sd_clock = !sd_clock;

endmodule // probador
