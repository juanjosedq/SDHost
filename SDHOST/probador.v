`timescale 1 ns / 1 ps

module probador (new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, sd_clock, cmd_pin_in, no_response, ack_response, ack_command_complete);

   output           new_command;           //Nuevo procreso del CMD  
   output           clock;                 //Reloj del dispositivo 
   output           reset;                 //Reinicio
   output [31 : 0]  cmd_argument;          //Argumento del comando
   output [5 : 0]   cmd_index;             //Indice del comando
   output 	    timeout_enable;        //Habilitacion del timeout
   output 	    sd_clock;      
   output 	    cmd_pin_in;
   output	    no_response;
   output	    ack_response;
   output	    ack_command_complete;         

   reg           new_command;
   reg           clock;  
   reg           reset;   
   reg [31 : 0]  cmd_argument;        
   reg [5 : 0]   cmd_index;        
   reg 	         timeout_enable;      
   reg 	         sd_clock;       
   reg 	         cmd_pin_in;
   reg		 no_response; 
   reg		 ack_response;
   reg		 ack_command_complete;            
         


   initial begin
      cmd_index = 6'b011000;
      cmd_argument = 32'hFF99FF88;
      reset = 0;
      timeout_enable = 1;
      new_command = 0;
      clock = 0;
      sd_clock = 0;
      cmd_pin_in = 1;
      no_response = 0;
      ack_response = 0;
      ack_command_complete = 0;


            
     #30 new_command = 1;

     #400
     #20 ack_response = 1;
     #20 ack_command_complete = 1;
     

     #20 $finish;
   end

   always #1 clock = !clock;
   always #1 sd_clock = !sd_clock;
   always #2 cmd_pin_in = !cmd_pin_in;

endmodule // probador
