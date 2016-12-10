`include "capa_fisica.v"
`include "control_cmd.v"

module CMD(new_command, cmd_argument, cmd_index, timeout_enable, command_complete, cmd_pin_in, cmd_pin_out, sd_clock, clock, reset, response, no_response, enable_response, ack_response, enable_command_complete, ack_command_complete);


   input          new_command;
   input [31:0]   cmd_argument;
   input [5:0]    cmd_index;
   input          timeout_enable;
   input 	  sd_clock;
   input	  clock;
   input	  reset;
   input	  cmd_pin_in;
   input	  ack_response;
   input	  ack_command_complete;


   output 	   command_complete;
   output 	   cmd_pin_out;
   output [127:0]  response;
   input	   no_response;
   output	   enable_response;
   output	   enable_command_complete;

   wire          new_command;
   wire [31:0]   cmd_argument;
   wire [5:0]    cmd_index;
   wire          timeout_enable;
   wire 	  sd_clock;
   wire 	  clock;
   wire 	  reset;
   wire 	  cmd_pin_in;


   wire  	   command_complete;
   wire  	   cmd_pin_out;
   wire [127:0]     response;
   wire		   no_response;

   wire		   ack_out_cf;
   wire		   ack_out_ci;
   wire		   strobe_out_cf;
   wire		   strobe_out_ci;
   wire [39:0]	   cmd_out_ci;
   wire [127:0]    response_out_cf;
   wire		   time_out_cf;
   wire		   idle_out_ci;

   wire		   enable_response;
   wire		   enable_command_complete;
   wire		   ack_response;
   wire		   ack_command_complete;



   control_cmd control_i1(		.new_command(new_command),
					.clock(clock),
					.reset(reset),
					.cmd_argument(cmd_argument),
					.cmd_index(cmd_index),
					.timeout_enable(timeout_enable),
					//.serial_ready(),
					.ack_in(ack_out_cf),
					.strobe_in(strobe_out_cf),
					.cmd_in(response_out_cf),
					.time_out(time_out_cf),
					.response(response),
					.command_complete(command_complete),
					.strobe_out(strobe_out_ci),
					.ack_out(ack_out_ci),
					.idle_out(idle_out_ci),
					.cmd_out(cmd_out_ci),
					.enable_response(enable_response),
					.ack_response(ack_response),
					.enable_command_complete(enable_command_complete),
					.ack_command_complete(ack_command_complete)
					);

   capa_fisica control_f1(		.strobe_in(strobe_out_ci),
					.ack_in(ack_out_ci),
					.idle_in(idle_out_ci),
					.cmd_to_send(cmd_out_ci),
					.ack_out(ack_out_cf),
					.strobe_out(strobe_out_cf),
					.no_response(no_response),
					.response(response_out_cf),
					.command_timeout(time_out_cf),
					.reset(reset),
					.sd_clock(sd_clock),
					.cmd_pin_in(cmd_pin_in),
					.cmd_pin_out(cmd_pin_out)
					);
 

endmodule
	
	     
