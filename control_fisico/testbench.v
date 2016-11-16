module testbench;                                // Se define un modulo de prueba

   wire           strobe_in;
   wire           ack_in;
   wire           idle_in;
   wire           no_response;
   wire [135 : 0] pad_response;
   wire 	  reception_complete;
   wire 	  transmission_complete;
   wire           reset;
   wire           sd_clock;

   wire  	  ack_out;
   wire 	  strobe_out;
   wire [135 : 0] response;
   wire   	  command_timeout;
   wire           load_send;
   wire           enable_pts_wrapper;
   wire	          enable_stp_wrapper;
   wire	          pad_state;
   wire	          pad_enable;
   wire           reset_wrapper;

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (strobe_in, ack_in, idle_in, no_response, pad_response, reception_complete, transmission_complete, reset, sd_clock);

  control_capa_fisica c1 (strobe_in, ack_in, idle_in, no_response, pad_response, reception_complete, transmission_complete, ack_out, strobe_out, response, command_timeout, load_send, enable_pts_wrapper, enable_stp_wrapper, pad_state, pad_enable, reset, sd_clock, reset_wrapper);
   

endmodule // test
