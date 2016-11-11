module testbench;                                // Se define un modulo de prueba

   wire           new_command;         
   wire           clock;              
   wire           reset;                
   wire [31 : 0]  cmd_argument;       
   wire [5 : 0]   cmd_index;         
   wire 	  timeout_enable;      
   wire 	  serial_ready;       
   wire 	  ack_in;              
   wire           strobe_in;         
   wire [135 : 0] cmd_in;               
   wire 	  time_out;              
   
   wire [127 : 0] response;            
   wire 	  command_complete;    
   wire 	  command_index_error; 
   wire 	  strobe_out;         
   wire 	  ack_out;            
   wire 	  idle_out;            
   wire [39 : 0]  cmd_out; 

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, serial_ready, ack_in, strobe_in, cmd_in, time_out);

  control_cmd c1 (new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, serial_ready, ack_in, strobe_in, cmd_in, time_out, response, command_complete, command_index_error, strobe_out, ack_out, idle_out, cmd_out);
   

endmodule // test
