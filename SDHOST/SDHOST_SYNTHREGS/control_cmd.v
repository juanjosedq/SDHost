module control_cmd(new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, ack_in, strobe_in, cmd_in, time_out, response, command_complete, strobe_out, ack_out, idle_out, cmd_out, enable_response, ack_response, enable_command_complete, ack_command_complete);

   
   input           new_command;           //Nuevo procreso del CMD   (WB---Reg)
   input           clock;                 //Reloj del dispositivo 
   input           reset;                 //Reinicio
   input [31 : 0]  cmd_argument;          //Argumento del comando  (Reg)
   input [5 : 0]   cmd_index;             //Indice del comando (Reg)
   input 	   timeout_enable;        //Habilitacion del timeout (Reg)
   input 	   ack_in;                 //Sincronizacion (CF)
   input           strobe_in;             //Fin del uso de la capa fisica (CF) 
   input [127 : 0] cmd_in;                //Respuesta recibida (CF)
   input 	   time_out;              //Ocurrencia de un timeout (CF)
   input	   ack_response;	  // Señal de response leida
   input	   ack_command_complete;  // Señal de command_complete leida
   
   output [127 : 0] response;            //Respuesta escrita a los registros (Reg)
   output 	    command_complete;    //Fin del proceso de CMD  (Reg - WB)
   output 	    strobe_out;          //Solicitar el uso a la capa fisica (CF)
   output 	    ack_out;             //Sincronizacion (CF)
   output 	    idle_out;            //Enviar la capa fisica al estado idle (CF)
   output [39 : 0]  cmd_out;             //Parte de la trama por enviar (CF)
   output	    enable_response;	 // habilitar lectura de la señal de response
   output	    enable_command_complete; // habilitar lectura de la señal command_complete

   wire           new_command;         
   wire           clock;              
   wire           reset;                
   wire [31 : 0]  cmd_argument;       
   wire [5 : 0]   cmd_index;         
   wire 	  timeout_enable;            
   wire 	  ack_in;           
   wire           strobe_in;         
   wire [127 : 0] cmd_in;               
   wire 	  time_out;   
   wire		  ack_response;
   wire		  ack_command_complete;           
   
   reg [127 : 0] response;            
   reg 	         command_complete;    
   reg 	         strobe_out;         
   reg 	         ack_out;            
   reg 	         idle_out;            
   reg [39 : 0]  cmd_out; 
   reg		 enable_response;
   reg		 enable_command_complete;

   reg [3:0] state = 4'b0001;       
   reg [3:0] next_state;      
   

   //Declaracion de estados
     parameter reset_state = 4'b0001;
     parameter idle = 4'b0010;
     parameter setting_outputs = 4'b0100;
     parameter processing = 4'b1000;

   always @(posedge clock) begin
   	state <= next_state;
   end   


   always @(*) begin

      case (state)

	reset_state :
	  begin
	     response [127 : 0]  <= 128'h00000000000000000000000000000000;
	     command_complete    <= 0;
	     strobe_out          <= 0;
	     ack_out             <= 0;
	     idle_out            <= 0;
	     cmd_out [39 : 0]    <= 0;
	     enable_response	 <= 0;
	     enable_command_complete <= 0;

	     next_state <= idle;
	     
	  end

	idle :
	  begin
	     if (new_command == 1) begin
		next_state <= setting_outputs;
		idle_out <= 0;
	     end else begin
		next_state <= idle;
		idle_out <= 1;
	     end
	     
	  end

	setting_outputs :
	  begin
	     strobe_out <= 1;
	     
	     cmd_out[39] <= 0;
	     cmd_out[38] <= 1;
	     cmd_out[37:32] <= cmd_index[5:0];
	     cmd_out[31:0] <= cmd_argument[31:0];

	     next_state <= processing;
	     
	  end

	processing :
	  begin
	     if (strobe_in == 1) begin
		enable_command_complete <= 1;			// Se habilita el flip-flop para lectura de command_complete
		command_complete <= 1;				// Se pasa el valor de command_complete

		ack_out <= 1;

		enable_response <= 1;				// Se habilita el flip-flop para lectura de response
	        response[127:0] <= cmd_in[127:0];              	// Se pasa a response el contenido de cmd_in
								
	        if (ack_in == 1 && ack_response == 1 && ack_command_complete == 1) begin					
		   next_state <= idle;
		   enable_response <= 0;			// Se deshabilita la lectura de response
		   enable_command_complete <= 0;		// Se deshabilita la lectura de command_complete
		end else begin
		   next_state <= processing;
		end
	     end // if (strobe_in == 1)	
	   end // case: processing

	default: next_state <= reset_state;

      endcase // case (state)
   end // always @ (posedge clock)
   
      endmodule // control_cmd

