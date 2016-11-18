module ADMA(clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Command_Reg_Write_or_Continue);
//VER: ¿Como se relaciona el SYS_ADR(Entrada) con  el ADMA System Address(registro)?

  parameter ST_STOP  = 4'b0001; //Estados
  parameter ST_FDS  = 4'b0010;
  parameter ST_CADR  = 4'b0100;
  parameter ST_STOP  = 4'b1000;
  parameter Single_Transfer  = 2'b00;  //Tipos de transferencia
  parameter Infinite_Transfer  = 2'b01;
  parameter Multiple_Transfer  = 2'b10;
  parameter Stop_Multiple_Transfer  = 2'b11;

  input clk;
  input   Command_Reg_Write_or_Continue;

  output DMA_Interrupt, ADMA_Error, Transfer_complete;

  wire    Command_Reg_Write_or_Continue;

  reg [63:0] System_Address=999; //Valor dado al SYS_ADR, por el Host Driver.  
  reg DMA_Interrupt, ADMA_Error, Transfer_complete;
  reg [63:0] SYS_ADR;             //Registros Internos
  reg [15:0] DAT_LEN;
  reg [63:0] DAT_ADR;
  reg [3:0] Present_State= ST_STOP;  //Se da con PowerOn, Reset o Error. 
  reg Valid, End, Int, Act1, Act2; 
  reg [1:0] Act;   //Act creado por simplicidad
  reg [95:0] Descriptor_Line;
  reg TFC;
  reg Tran;
  reg STOP=0;

  reg [15:0] Block_Size;   //Lecturas de registros: 
  reg [11:0] Transfer_Block_Size; 
  reg [15:0] Block_Count; 

  reg [15:0] Transfer_Mode;
  reg Multi_Single_Block_Select, Data_Transfer_Direction_Select, Block_Count_Eneable, DMA_Eneable; 
  reg [1:0] Temporal;
  reg [1:0] Transfer_Type; 
   
  reg [31:0] Present_State; 
  reg Read_Transfer_Active, Writte_Transfer_Active, DAT_Line_Active;

  reg [6:0] Block_Gap_Control;   //PENDIENTE COMPRENSIÓN
  reg Interrupt_At_Block_Gap, Read_Wait_Control, Continue_Request, Stop_At_Block_Gap_Request; 

  reg [7:0] Software_Reset;
  reg Software_Reset_For_DAT_Line;
  reg Software_Reset_For_All;

  Transfer_Block_Size <= Block_Size[15:0];
  Multi_Single_Block_Select <= Transfer_Mode[5];
  Data_Transfer_Direction_Select  <= Transfer_Mode[4];
  Block_Count_Eneable <= Transfer_Mode[1];
  DMA_Eneable <= Transfer_Mode[0];
  Temporal[1]<=Multi_Single_Block_Select;
  Temporal[1]<=Block_Count_Eneable; 
  Transferencia t1 (Temporal, Block_Count,Transfer_Type);
  Read_Transfer_Active <= Present_State[9];
  Write_Transfer_Active <= Present_State[8];
  DAT_Line_Active <= Present_State[2];
  Interrupt_At_Block_Gap <=Block_Gap_Control[3];
  Read_Wait_Control <=Block_Gap_Control[2];
  Continue_Request <=Block_Gap_Control[1];
  Stop_At_Block_Gap_Request <=Block_Gap_Control[0];
  Software_Reset_For_DAT_Line <= Software_Reset[2];
  Software_Reset_For_All <= Software_Reset[0];


//TOMAR EN CUENTA REGISTROS RESTANTES
  
 case(Present_State)
	ST_STOP: begin 
			if(Command_Reg_Write_or_Continue==1) 
					begin
					SYS_ADR<=System_Address;
                          		Present_State <= ST_FDS;
				        end
			else	
					begin
					SYS_ADR<=System_Address;
					Present_State <= ST_STOP;
					end
		 end                   

        
       ST_FDS:  begin
		 Descriptor_Table d1 (SYS_ADR, Descriptor_Line);
		 Valid <= Descriptor_Line[0];
		 End <= Descriptor_Line[1];
		 Int <= Descriptor_Line[2];
		 Act1 <= Descriptor_Line[4];
		 Act2 <= Descriptor_Line[5];

		 Act[0] <=Act1;
		 Act[1] <=Act2;

		 DAT_LEN <= Descriptor_Line[31:16];
		 DAT_ADR <= Descriptor_Line[95:32];
		 TFC=0;
			if(Valid==1) 
					begin
					Present_State <= ST_CADR;
				        end
			else	
					begin
					Present_State <= ST_FDS;
					ADMA_Error <=1;          //ADMA ERROR INTERRUPT
					DMA_Interrupt <=1; 

					end
		 end

     ST_CADR:  
			case(Act)  
				2'b00:  begin   //NOP
					SYS_ADR <= SYS_ADR+ 8;   
					Tran=0;
					end    

				2'b01:  begin  //RSV
					SYS_ADR <= SYS_ADR+ 8;   
					Tran=0;
					end

				2'b10:  begin  //TRAN
					SYS_ADR <= SYS_ADR+ 8;
					Tran=1;
					end

				2'b11:	begin  //LINK
					SYS_ADR <= DAT_ADR;    
					Tran=0;
					end
				default: 
         		                  
      				endcase
			

			if (Tran==1)
				Present_State <= ST_STOP;
			else
				begin

				if (End==0)
					Present_State <= ST_FDS;
				else
					Present_State <= ST_STOP;
				
				end
 ST_STOP:
	//IMPLEMENTAR TRANSFERENCIA, SABIENDO SI ES TRAMA O MULTITRAMA

	if(TFC==1 & (End==1 | STOP==1))
		Present_State <= ST_STOP;
	else 
		Present_State <= ST_STOP;	


  default: 
         //NO SE HA INICIADO.
      endcase

		

endmodule 


