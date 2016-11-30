
module control_capa_fisica(strobe_in, ack_in, idle_in, no_response, pad_response, reception_complete, transmission_complete, ack_out, strobe_out, response, command_timeout, load_send, enable_pts_wrapper, enable_stp_wrapper, pad_state, pad_enable, reset, sd_clock, reset_wrapper);


   input           strobe_in;				// Solicitud de servicio (CMD)
   input           ack_in;				// Sincronizacion (CMD)
   input           idle_in;				// Ir al estado Idle (CMD)
   input           no_response;				// No esperar una respuesta (interna)
   input [135 : 0] pad_response;			// Trama recibida (wrapper S-P)
   input 	   reception_complete;			// Recepcion completa (wrapper S-P)
   input 	   transmission_complete;		// Transmision completa (wrapper P-S)
   input 	   reset;				// Reinicio
   input 	   sd_clock;				// reloj (Tarjeta SD)

   output 	    ack_out;				// Sincronizacion (CMD)
   output 	    strobe_out;				// Proceso concluido (CMD)
   output [135 : 0] response;				// trama recibida (CMD)
   output 	    command_timeout;			// Ocurrencia del timeout (CMD-Regs)
   output 	    load_send;				// Enviar o cargar (P-S)
   output 	    enable_pts_wrapper;			// Habilitar paralelo a serie (wrapper P-S)
   output 	    enable_stp_wrapper;			// Habilitar serie a paralelo (Wrapper S- P)
   output           reset_wrapper;			// Reinicia los wrappers ( ambos wrappers)
   output 	    pad_state;				// Salida (1) o entrada (0) (PAD)
   output	    pad_enable;				// Habilita el Pad (PAD)

  // inout            cmd_pin;


   wire           strobe_in;
   wire           ack_in;
   wire           idle_in;
   wire           no_response;
   wire [135 : 0] pad_response;
   wire 	  reception_complete;
   wire 	  transmission_complete;
   wire 	  reset;
   wire 	  sd_clock;

   reg  	 ack_out;
   reg 	         strobe_out;
   reg [135 : 0] response;
   reg   	 command_timeout;
   reg 	         load_send;
   reg		 reset_wrapper;
   reg 	         enable_pts_wrapper;
   reg 	         enable_stp_wrapper;
   reg 	         pad_state;
   reg	         pad_enable;

   //reg           cmd_pin;

   reg [7:0] 	 state = 8'b00000001;
   reg [7:0] 	 next_state ; 		 

   integer count = 0;
   reg problem = 0;

   parameter reset_state = 8'b00000001;
   parameter idle = 8'b00000010;
   parameter load_command = 8'b00000100;
   parameter send_command = 8'b00001000;
   parameter wait_response = 8'b00010000;
   parameter send_response = 8'b00100000;
   parameter wait_ack = 8'b01000000;
   parameter send_ack = 8'b10000000;

   always @(posedge sd_clock) begin
   state <= next_state; 
   end



   always @(*) begin

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

	     next_state <= idle;
	  end // case: reset_state

	idle:
	  begin
	     reset_wrapper <= 1;

	     if (idle_in == 1) begin
		next_state <= idle;
	     end else begin
		if (strobe_in == 1) begin
	 	   next_state <= load_command;
	        end else begin
		   next_state <= idle;
	        end
	     end 
	  end // case: idle

	load_command:
	  begin
	     enable_pts_wrapper <= 1;
	     pad_state <= 1;
	     pad_enable <= 1;

	     if(idle_in == 1) begin
		next_state <= idle;
	     end else begin
		next_state <= send_command;
	     end

	  end // case: load_command

	send_command:
	  begin
	     load_send <= 1;

	     if (idle_in == 1) begin
		next_state <= idle;
	     end else begin
		if (transmission_complete == 1) begin
		   next_state <= wait_response;
		end else begin
		   next_state <= send_command;
		end
	     end

	  end // case: send_command

	wait_response:
	  begin
	     pad_enable <= 0;
	     enable_stp_wrapper <= 1;          // implementar contador interno

	     if (problem == 1) begin
		command_timeout <= 1;
	     end else begin
		command_timeout <= 0;
	     end

	     if (idle_in == 1) begin
		next_state <= idle;
	     end else begin
		if (reception_complete == 1 || no_response == 1) begin
		   next_state <= send_response;
		end else begin
		   next_state <= wait_response;
		end
	     end
	     

	  end // case: wait_response

	send_response:
	  begin
	     strobe_out <= 1;
	     response [135:0] <= pad_response [135:0];

	     if (idle_in == 1) begin
		next_state <= idle;
	     end else begin
		next_state <= wait_ack;
	     end
	  end // case: send_response
	

       wait_ack:                        
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
	       next_state <= idle;
	    end else begin
	       if (ack_in == 1) begin
		  next_state <= send_ack;
	       end else begin
		  next_state <= wait_ack;
	       end
	    end

	 end // case: wait_ack
	

	send_ack:
	  begin
	     ack_out <= 1;
	     next_state <= idle;
	  end
	
      endcase // case (state)
      

      end // always @ (posedge clock)


	always @ (negedge sd_clock)
		begin
			if(state != 8'b00010000) begin
				count <= 0;
				problem <= 0;
			end else begin
				if(count != 136) begin
					count <= (count + 1);
				end else begin
					count <= 0;
					problem <= 1;
				end 	
			end
		end


endmodule

   
	     
	    
	     
		
	
	     
