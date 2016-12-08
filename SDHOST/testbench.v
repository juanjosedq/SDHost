module testbench;                                // Se define un modulo de prueba

   wire           new_command;         
   wire           clock;              
   wire           reset;                
   wire [31 : 0]  cmd_argument;       
   wire [5 : 0]   cmd_index;         
   wire 	  timeout_enable;      
   wire 	  sd_clock;       
   wire 	  cmd_pin_in;                            
   
   wire [127 : 0] response;            
   wire 	  command_complete;     
   wire 	  no_response;         
   wire 	  cmd_pin_out; 
   wire		  enable_response;
   wire		  ack_response;
   wire		  enable_command_complete;
   wire		  ack_command_complete;         
 

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, sd_clock, cmd_pin_in, no_response, ack_response, ack_command_complete);

  CMD CMD1 (new_command, cmd_argument, cmd_index, timeout_enable, command_complete, cmd_pin_in, cmd_pin_out, sd_clock, clock, reset, response, no_response, enable_response, ack_response, enable_command_complete, ack_command_complete);
   

endmodule // test
