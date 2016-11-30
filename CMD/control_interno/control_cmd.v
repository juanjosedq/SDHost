module control_cmd(new_command, clock, reset, cmd_argument, cmd_index, timeout_enable, serial_ready, ack_in, strobe_in, cmd_in, time_out, response, command_complete, command_index_error, strobe_out, ack_out, idle_out, cmd_out);

   
   input           new_command;           //Nuevo procreso del CMD   (WB---Reg)
   input           clock;                 //Reloj del dispositivo 
   input           reset;                 //Reinicio
   input [31 : 0]  cmd_argument;          //Argumento del comando  (Reg)
   input [5 : 0]   cmd_index;             //Indice del comando (Reg)
   input 	   timeout_enable;        //Habilitacion del timeout (Reg)
   input 	   serial_ready;          //Capa fisica lista (CF)
   input 	   ack_in;                 //Sincronizacion (CF)
   input           strobe_in;             //Fin del uso de la capa fisica (CF) 
   input [135 : 0] cmd_in;                //Respuesta recibida (CF)
   input 	   time_out;              //Ocurrencia de un timeout (CF)
   
   output [127 : 0] response;            //Respuesta escrita a los registros (Reg)
   output 	    command_complete;    //Fin del proceso de CMD  (Reg - WB)
   output 	    command_index_error; //Error de indice comandos (Reg)
   output 	    strobe_out;          //Solicitar el uso a la capa fisica (CF)
   output 	    ack_out;             //Sincronizacion (CF)
   output 	    idle_out;            //Enviar la capa fisica al estado idle (CF)
   output [39 : 0]  cmd_out;             //Parte de la trama por enviar (CF)

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
   
   reg [127 : 0] response;            
   reg 	         command_complete;    
   reg 	         command_index_error; 
   reg 	         strobe_out;         
   reg 	         ack_out;            
   reg 	         idle_out;            
   reg [39 : 0]  cmd_out; 

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
	     command_index_error <= 0;
	     strobe_out          <= 0;
	     ack_out             <= 0;
	     idle_out            <= 0;
	     cmd_out [39 : 0]     <= 0;

	     next_state <= idle;
	     
	  end

	idle :
	  begin
	     if (new_command == 1) begin
		next_state <= setting_outputs;
	     end else begin
		next_state <= idle;
	     end

	     idle_out <= 1;
	     
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
		command_complete <= 1;
		ack_out <= 1;

		
	        response[127:0] <= cmd_in[127:0];               //***revisar lo del command_index_error***
								//*** del estado processing pasar al idle***
	        if (ack_in == 1) begin
		   next_state <= idle;
		end else begin
		   next_state <= processing;
		end
	     end // if (strobe_in == 1)	
	   end // case: processing
      endcase // case (state)
   end // always @ (posedge clock)
   
      endmodule // control_cmd

