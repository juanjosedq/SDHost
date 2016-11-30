`timescale 1 ns / 1 ps

module probador (strobe_in, ack_in, idle_in, cmd_to_send, no_response, reset, sd_clock, cmd_pin_in);

   output           strobe_in;
   output           ack_in;
   output           idle_in;
   output           no_response;
   output [39 : 0]  cmd_to_send;
   output 	    cmd_pin_in;
   output 	    reset;
   output 	    sd_clock;

   reg           strobe_in;
   reg           ack_in;
   reg           idle_in;
   reg           no_response;
   reg [39 : 0]  cmd_to_send;
   reg 	         cmd_pin_in;
   reg 	         reset;
   reg 	         sd_clock;             


   initial begin
      no_response = 0;
      cmd_to_send = 40'b11110000_11110000_11110000_11110000_11110000;
      reset = 0;
      sd_clock = 0;
      strobe_in = 0;
      ack_in = 0;
      idle_in = 0;
      cmd_pin_in = 0;
      
      
     #30 strobe_in = 1;
     #89 cmd_pin_in = 1;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 1;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 cmd_pin_in = 0;
     #2 
     #20 ack_in = 1;

     #5 $finish;
   end

   always #1 sd_clock = !sd_clock;

endmodule // probador
