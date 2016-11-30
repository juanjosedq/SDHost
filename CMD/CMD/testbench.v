module testbench;                                // Se define un modulo de prueba

   wire           strobe_in;
   wire           ack_in;
   wire           idle_in;
   wire           no_response;
   wire [39 : 0]  cmd_to_send;
   wire 	  cmd_pin_in;
   wire           reset;
   wire           sd_clock;

   wire  	  ack_out;
   wire 	  strobe_out;
   wire [14 : 0] response;
   wire   	  command_timeout;
   wire           cmd_pin_out;

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (strobe_in, ack_in, idle_in, cmd_to_send, no_response, reset, sd_clock, cmd_pin_in);

  capa_fisica c1 (strobe_in, ack_in, idle_in, cmd_to_send, ack_out, strobe_out, no_response, response, command_timeout, reset, sd_clock, cmd_pin_in, cmd_pin_out);
   

endmodule // test
