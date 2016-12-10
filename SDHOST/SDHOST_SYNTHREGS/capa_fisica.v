`include "control_capa_fisica.v"
`include "wrapper_paralelo_serial.v"
`include "wrapper_serial_paralelo.v"
`include "pad.v"

module capa_fisica(strobe_in, ack_in, idle_in, cmd_to_send, ack_out, strobe_out, no_response, response, command_timeout, reset, sd_clock, cmd_pin_in, cmd_pin_out);


   input          strobe_in;
   input          ack_in;
   input          idle_in;
   input [39 : 0] cmd_to_send;
   input          reset;
   input 	  sd_clock;
   input	  cmd_pin_in;


   output 	   ack_out;
   output 	   strobe_out;
   input          no_response;
   output [127 : 0] response;
   output 	   command_timeout;
   output	   cmd_pin_out;



   wire          strobe_in;
   wire          ack_in;
   wire          idle_in;
   wire [39 : 0] cmd_to_send;
   wire          reset;
   wire 	 sd_clock;
   wire		 cmd_pin_in;


   wire           ack_out;
   wire 	  strobe_out;
   wire [127 : 0 ] response;
   wire 	  command_timeout;
   wire		  cmd_pin_out;


   wire 	  enable_pts_wrapper;
   wire 	  enable_stp_wrapper;
   wire [127 : 0 ] pad_response;
   wire 	  reception_complete;
   wire 	  transmission_complete;
   wire		  load_send;
   wire		  pad_state;
   wire 	  pad_enable;
   wire		  reset_wrapper;
   wire		  data_in;
   wire  	  data_out;


   control_capa_fisica control1(	.strobe_in(strobe_in),
					.ack_in(ack_in),
					.idle_in(idle_in),
					//.no_response(),
					.pad_response(pad_response),
					.reception_complete(reception_complete),
					.transmission_complete(transmission_complete),
					.ack_out(ack_out),
					.strobe_out(strobe_out),
					.response(response),
					.command_timeout(command_timeout),
					.load_send(load_send),
					.enable_pts_wrapper(enable_pts_wrapper),
					.enable_stp_wrapper(enable_stp_wrapper),
					.pad_state(pad_state),
					.pad_enable(pad_enable),
					.reset(reset),
					.sd_clock(sd_clock),
					.reset_wrapper(reset_wrapper)
					);

   wrapper_paralelo_serial PTS1(	.enable(enable_pts_wrapper),
					.parallel(cmd_to_send),
					.serial(data_in),
					.complete(transmission_complete),
					.reset(reset_wrapper),
					.sd_clock(sd_clock),
					.load_send(load_send)
					);

   wrapper_serial_paralelo STP1(	.parallel(pad_response),
					.serial(data_out),
					.sd_clock(sd_clock),
					.enable(enable_stp_wrapper),
					.reset(reset_wrapper),
					.complete(reception_complete)
					);

   pad pad1 (				.output_input(pad_enable),
					.enable(pad_state),
					.data_in(data_in),
					.data_out(data_out),
					.sd_clock(sd_clock),
					.i_port(cmd_pin_in),
					.o_port(cmd_pin_out)
					);
 

endmodule

   
	     
	    
	     
		
	
	     
