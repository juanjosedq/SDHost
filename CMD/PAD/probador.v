`timescale 1 ns / 1 ps

module probador (output_input, enable, data_in, sd_clock, i_port);

   output output_input;
   output enable;
   output data_in;
   output sd_clock;
   output i_port;

   reg output_input;
   reg enable;
   reg data_in;
   reg sd_clock;
   reg i_port;
            

   initial begin
	enable = 1;
	sd_clock = 0;

	output_input = 1;	
        data_in = 1;
      	#6 data_in = 0;
	#6 data_in = 1;

	#6 output_input = 0;
	i_port = 0;
	#6 i_port = 1;
	#6 i_port = 0;

	#5 $finish;
   end

   always #1 sd_clock = !sd_clock;

endmodule // probador
