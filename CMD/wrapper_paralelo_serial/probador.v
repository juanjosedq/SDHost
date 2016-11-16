`timescale 1 ns / 1 ps

module probador (parallel, sd_clock, enable, reset);

	output reg [n-1 : 0] parallel;
	output reg sd_clock;
	output reg enable;
	output reg reset;	           

	parameter n = 8;

   initial begin
      enable = 1;
      reset = 0;
      sd_clock = 0;
      parallel [n-1 : 0] = 8'b11110000;

     #16 parallel [n-1 : 0] = 8'b11111111;

     #18 $finish;
   end

   always #1 sd_clock = !sd_clock;

endmodule // probador
