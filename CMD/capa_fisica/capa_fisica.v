
module control_capa_fisica(strobe_in, ack_in, idle_in, cmd_to_send, ack_out, strobe_out, serial_ready, response, command_timeout, reset, sd_clock, cmd_pin);


   input          strobe_in;
   input          ack_in;
   input          idle_in;
   input [39 : 0] cmd_to_send;
   input          reset;
   input 	  sd_clock;


   output 	   ack_out;
   output 	   strobe_out;
   output          serial_ready;
   output [135 : 0 response];
   output 	   command_timeout;

   inout cmd_pin;


   wire          strobe_in;
   wire          ack_in;
   wire          idle_in;
   wire [39 : 0] cmd_to_send;
   wire          reset;
   wire 	 sd_clock;


   reg 	          ack_out;
   reg 	          strobe_out;
   reg            serial_ready;
   reg [135 : 0 ] response;
   reg 	          command_timeout;

   //wire cmd_pin;

 

endmodule

   
	     
	    
	     
		
	
	     
