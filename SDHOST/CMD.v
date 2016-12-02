`include "capa_fisica.v"
`include "control_cmd.v"

module CMD(new_command, cmd argument, cmd_index, timeout_enable, command_complete, command_index_error, cmd_pin_in, cmd_pin_out, sd_clock, clock, reset, response);


   input          new_command;
   input [31:0]   cmd_argument;
   input [5:0]    cmd_index;
   input          timeout_enable;
   input          command_complete;
   input 	  sd_clock;
   input	  clock;
   input	  reset;
   input	  cmd_pin_in;


   output 	   command_complete;
   output 	   command_index_error;
   output 	   cmd_pin_out;
   output [127:0]  response;

   wire          new_command;
   wire [31:0]   cmd_argument;
   wire [5:0]    cmd_index;
   wire          timeout_enable;
   wire          command_complete;
   wire 	  sd_clock;
   wire 	  clock;
   wire 	  reset;
   wire 	  cmd_pin_in;


   reg  	   command_complete;
   reg  	   command_index_error;
   reg  	   cmd_pin_out;
   reg [127:0]     response;




   control_cmd control_i1(		.new_command(),
					.clock(),
					.reset(),
					.cmd_argument(),
					.cmd_index(),
					.timeout_enable(),
					.serial_ready(),
					.ack_in(),
					.strobe_in(),
					.cmd_in(),
					.time_out(),
					.response(),
					.command_complete(),
					.command_index_error(),
					.strobe_out(),
					.ack_out(),
					.idle_out(),
					.cmd_out()
					);

   capa_fisica control_f1(		.strobe_in(),
					.ack_in(),
					.idle_in(),
					.cmd_to_send(),
					.ack_out(),
					.strobe_out(),
					.no_response(),
					.response(),
					.command_timeout(),
					.reset(),
					.sd_clock(),
					.cmd_pin_in(),
					.cmd_pin_out()
					);
 

endmodule
	
	     
