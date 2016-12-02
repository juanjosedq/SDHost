`timescale 1 ns / 1 ps

module probador (new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, ack_in, strobe_in, cmd_in, time_out, ack_response, ack_command_complete);

   output           new_command;           //Nuevo procreso del CMD  
   output           clock;                 //Reloj del dispositivo 
   output           reset;                 //Reinicio
   output [31 : 0]  cmd_argument;          //Argumento del comando
   output [5 : 0]   cmd_index;             //Indice del comando
   output 	    timeout_enable;        //Habilitacion del timeout
   output 	    ack_in;                 //Sincronizacion
   output           strobe_in;             //Fin del uso de la capa fisica 
   output [127 : 0] cmd_in;                //Respuesta recibida
   output 	    time_out;              //Ocurrencia de un timeout
   output	    ack_response;
   output	    ack_command_complete;

   reg           new_command;
   reg           clock = 0;  
   reg           reset;   
   reg [31 : 0]  cmd_argument;        
   reg [5 : 0]   cmd_index;        
   reg 	         timeout_enable;             
   reg 	         ack_in;              
   reg           strobe_in;           
   reg [127 : 0] cmd_in;              
   reg 	         time_out;             
   reg		 ack_response;
   reg		 ack_command_complete;


   initial begin
      cmd_index = 6'b011000;
      cmd_argument = 32'hFF99FF88;
      reset = 0;
      timeout_enable = 1;
      time_out = 0;
      cmd_in = 128'hFFFF9999EEEE8888DDDD7777CCCC6666;
      new_command = 0;
      strobe_in = 0;
      ack_in = 0;
      
      
     #20 new_command = 1;
     #20 strobe_in = 1;
     #20 ack_response = 1;
     #20 ack_command_complete = 1;
     #20 ack_in = 1;

     #5 $finish;
   end

   always #1 clock = !clock;

endmodule // probador
