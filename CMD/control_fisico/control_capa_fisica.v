
module control_capa_fisica(strobe_in, ack_in, idle_in, no_response, pad_response, reception_complete, transmission_complete, ack_out, strobe_out, response, command_timeout, load_send, enable_pts_wrapper, enable_stp_wrapper, pad_state, pad_enable, reset, sd_clock);


   input           strobe_in;
   input           ack_in;
   input           idle_in;
   input           no_response;
   input [135 : 0] pad_response;
   input 	   reception_complete;
   input 	   transmission_complete;
   input 	   reset;
   input 	   sd_clock;

   output 	    ack_out;
   output 	    strobe_out;
   output [135 : 0] response;
   output 	    command_timeout;
   output 	    load_send;
   output 	    enable_pts_wrapper;
   output 	    enable_stp_wrapper;
   output           reset_wrapper
   output 	    pad_state;
   output	    pad_enable;

   inout            cmd_pin;


   wire           strobe_in;
   wire           ack_in;
   wire           idle_in;
   wire           no_response;
   wire [135 : 0] pad_response;
   wire 	   reception_complete;
   wire 	   transmission_complete;
   wire 	   reset;
   wire 	   sd_clock;

   reg  	 ack_out;
   reg 	         strobe_out;
   reg [135 : 0] response;
   reg   	 command_timeout;
   reg 	         load_send;
   reg 	         enable_pts_wrapper;
   reg 	         enable_stp_wrapper;
   reg 	         pad_state;
   reg	         pad_enable;

   reg           cmd_pin;

   reg [7:0] 	 state = 8'b00000001; 		 



   parameter reset_state = 8'b00000001;
   parameter idle = 8'b00000010;
   parameter load_command = 8'b00000100;
   parameter send_command = 8'b00001000;
   parameter wait_response = 8'b00010000;
   parameter send_response = 8'b00100000;
   parameter wait_ack = 8'b001000000;
   parameter send_ack = 8'b10000000;


   always @(posedge clock) begin

      case(state)

	reset_state:
	  begin
	     ack_out                <= 0;
	     strobe_out             <= 0;
	     response [135 : 0]     <= 0;
             command_timeout        <= 0;
	     load_send              <= 0;
	     enable_pts_wrapper     <= 0;
	     enable_stp_wrapper     <= 0;
	     reset_wrapper          <= 0;
	     pad_state              <= 0;
	     pad_enable             <= 0;

	     state [7:0] <= idle;
	  end // case: reset_state

	idle:
	  begin
	     reset_wrapper <= 1;

	     if (strobe_in == 1) begin
		state <= load_command;
	     end else begin
		state <= idle;
	     end

	  end // case: idle

	load_command:
	  begin
	     enable_pts_wrapper <= 1;
	     pad_state <= 1;
	     pad_enable <= 1;

	     if(idle_in == 1) begin
		state <= idle;
	     end else begin
		state <= send_command;
	     end

	  end // case: load_command

	send_command:
	  begin
	     load_send <= 1;

	     if (idle_in == 1) begin
		state <= idle;
	     end else begin
		if (transmission_complete == 1) begin
		   state <= wait_response;
		end else begin
		   state <= load_send;
		end
	     end

	  end // case: send_command

	wait_response:
	  begin
	     pad_enable <= 0;
	     enable_stp_wrapper <= 1;          // implementar contador interno

	     if (idle_in == 1) begin
		state <= idle;
	     end else begin
		if (reception_complete == 1 || no_response == 1) begin
		   state <= send_response;
		end else begin
		   state <= wait_response;
		end
	     end
	     

	  end // case: wait_response

	send_response:
	  begin
	     strobe_out <= 1;
	     response [135:0] <= pad_response [135:0];

	     if (idle_in == 1) begin
		state <= idle;
	     end else begin
		state <= wait_ack;
	     end
	  end // case: send_response
	

       wait_ack:                            // las salidas en estado bajo...
	 begin

	     ack_out                <= 0;
	     strobe_out             <= 0;
	     response [135 : 0]     <= 0;
             command_timeout        <= 0;
	     load_send              <= 0;
	     enable_pts_wrapper     <= 0;
	     enable_stp_wrapper     <= 0;
	     reset_wrapper          <= 0;
	     pad_state              <= 0;
	     pad_enable             <= 0;

	    if (idle_in == 1) begin
	       state <= idle;
	    end else begin
	       if (ack_in == 1) begin
		  state <= send_ack;
	       end else begin
		  state <= wait_ack;
	       end
	    end

	 end // case: wait_ack
	

	send_ack:
	  begin
	     ack_out <= 1;
	     state <= idle;
	  end
	
      endcase // case (state)
      

      end // always @ (posedge clock)
   
	     
	    
	     
		
	
	     
