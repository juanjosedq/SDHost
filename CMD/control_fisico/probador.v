`timescale 1 ns / 1 ps

module probador (strobe_in, ack_in, idle_in, no_response, pad_response, reception_complete, transmission_complete, reset, sd_clock);

   output           strobe_in;
   output           ack_in;
   output           idle_in;
   output           no_response;
   output [135 : 0] pad_response;
   output 	    reception_complete;
   output 	    transmission_complete;
   output 	    reset;
   output 	    sd_clock;

   reg           strobe_in;
   reg           ack_in;
   reg           idle_in;
   reg           no_response;
   reg [135 : 0] pad_response;
   reg 	         reception_complete;
   reg 	         transmission_complete;
   reg 	         reset;
   reg 	         sd_clock;             


   initial begin
      no_response = 0;
      pad_response = 136'hFFFF9999EEEE8888DDDD7777CCCC6666BB;
      reset = 0;
      sd_clock = 0;
      strobe_in = 0;
      ack_in = 0;
      idle_in = 0;
      reception_complete = 0;
      transmission_complete = 0;
      
      
     #20 strobe_in = 1;
     #20 transmission_complete = 1;
     #20 reception_complete = 1;
     #20 ack_in = 1;

     #5 $finish;
   end

   always #1 sd_clock = !sd_clock;

endmodule // probador
