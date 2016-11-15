module TransicionEstados(EstadoActual, End, Valid, Tran,  Data_Transfer, STOP, Command_Reg_Write_or_Continue, ProximoEstado, ADMA_Error_Interrupt, ENB);
//Módulo util para la transición de estados. 
//End, Valid y Tran provienen del descriptor line, así que son entradas
//TFC es una bandera
//ADMA Error Interrupt es una señal de salida
//ENB es una señal que habilita la transición de estados

//Hace falta incluir los registros

  output [1:0] ProximoEstado; 
  output       ADMA_Error_Interrupt;
  input  [1:0] EstadoActual;
  input        End, Valid, Tran,  ENB, Data_Transfer,STOP, Command_Reg_Write_or_Continue;


  reg TFC;                                    //verrrrrrrrrrrrrrrrrrrrr
  reg  [1:0]  ProximoEstado;
  reg         ADMA_Error_Interrupt=0;
  wire [1:0]  EstadoActual;
  wire        End, Valid, Tran, ENB, Data_Transfer,STOP, Command_Reg_Write_or_Continue;


//ESTADO 00= ST_FDS
//ESTADO 01= ST_CADR 
//ESTADO 10= ST_TFR
//ESTADO 11= ST_STOP


always @(*)
      case(EstadoActual)
      00:                             
        if(Valid==1)begin
		ProximoEstado <= 01;
		ADMA_Error_Interrupt <= 0;
		end
	else begin
		ProximoEstado<= 00;
		ADMA_Error_Interrupt <= 1;
		TFC=0;
	     end
      01:  
        if (Tran==1) begin
		ProximoEstado <= 02;
		ADMA_Error_Interrupt<=0;
		     end        
	else begin
		if(End==1) begin
			ProximoEstado<= 03;
			ADMA_Error_Interrupt<=0;
		           end		
		else begin
			ProximoEstado<= 00;
			ADMA_Error_Interrupt<=0;
		     end
	     end      
	02:  
        if (Data_Transfer==1) begin                 //Data_Transfer=1 si aún estoy transmitiendo información
		ProximoEstado <= 02;
		ADMA_Error_Interrupt<=0;
		TFC=1;
		end
        else begin
		if((TFC==1)&((End==1)|(STOP==1))) begin
			ProximoEstado <= 03;
			ADMA_Error_Interrupt<=0;
		                                  end
		else begin
			if((TFC==1)&((End==0)&(STOP==0))) begin
			ProximoEstado <= 00;
			ADMA_Error_Interrupt<=0;
							  end	
		     end
            end      
	03:
	if (Command_Reg_Write_or_Continue==1) begin
		ProximoEstado <= 00;
		ADMA_Error_Interrupt<=0;
		                              end
	else begin
		ProximoEstado <= 03;
		ADMA_Error_Interrupt<=0;
             end

      default: begin
		 ProximoEstado <= EstadoActual;
	         ADMA_Error_Interrupt<=0;
		end
      endcase

		

endmodule 


