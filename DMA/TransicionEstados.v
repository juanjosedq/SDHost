
module ADMA(clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address, Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register, ADMA_System_Address_Register, enb_DMA_Interrupt, ack_DMA_Interrupt,  enb_ADMA_Error, ack_ADMA_Error, enb_Transfer_complete, ack_Transfer_complete, enb_ADMA_System_Address_Register, ack_ADMA_System_Address_Register);


  parameter ST_STOP  = 4'b0001; //Estados
  parameter ST_FDS  = 4'b0010;
  parameter ST_CADR  = 4'b0100;
  parameter ST_TFR  = 4'b1000;

  parameter WAIT= 4'b0001; //DirecciónTransferencia
  parameter CARD_TO_HOST= 4'b0010;
  parameter HOST_TO_CARD= 4'b0100;

  parameter Single_Transfer  = 2'b00; //Tipos de Transferencia
  parameter Infinite_Transfer  = 2'b01;
  parameter Multiple_Transfer  = 2'b10;
  parameter Stop_Multiple_Transfer  = 2'b11;


  input ack_DMA_Interrupt;
  input ack_ADMA_Error;
  input ack_Transfer_complete;
  input ack_ADMA_System_Address_Register;
  input clk;
  input [63:0] Initial_ADMA_System_Address;
  input [15:0] Block_Size_Register;     //Offset 004h, interesa bit [11:0] 
  input [15:0] Block_Count_Register;    //Offset 006h, interesan todos los bits
  input [15:0] Transfer_Mode_Register;  //Offset 00Ch, interesan los bits 05, 04, 01,00.
  input [31:0] Present_State_Register;  //Offset 024h, interesan los bits 09,08.
  input [7:0]  Block_Gap_Control_Register;    //Offset 02Ah, interesan los bits 0,1.
  input [15:0]  Command_Register;        //Offset 00Eh, interesan los bits 6 y 7. 

  output enb_DMA_Interrupt;
  output enb_ADMA_Error;
  output enb_Transfer_complete;
  output enb_ADMA_System_Address_Register;
  output DMA_Interrupt;     //Normal_Interrupt_Status_Register   Offset  030h  bit 3. 
  output ADMA_Error;        //Error Interrupt Status Register    Offset 032h bit 9.
  output Transfer_complete; //Normal_Interrupt_Status_Register   Offset  030h  bit 1.
  output [63:0] ADMA_System_Address_Register; // (Offset 058h) 
  
  wire ack_DMA_Interrupt;
  wire ack_ADMA_Error;
  wire ack_Transfer_complete;
  wire ack_ADMA_System_Address_Register;
  wire clk;
  wire  [63:0] Initial_ADMA_System_Address;      
  wire  [15:0] Block_Size_Register; 
  wire  [15:0] Block_Count_Register; 
  wire  [15:0] Transfer_Mode_Register;
  wire  [31:0] Present_State_Register;
  wire  [7:0] Block_Gap_Control_Register;
  wire  [15:0]  Command_Register;

  wire [95:0] Descriptor_Line;
  wire [1:0] Transfer_Type; 
  

  reg enb_DMA_Interrupt=0;
  reg enb_ADMA_Error=0;
  reg enb_Transfer_complete=0;
  reg enb_ADMA_System_Address_Register=0;
  reg DMA_Interrupt=0; 
  reg ADMA_Error=0; 
  reg Transfer_complete=0;
  reg Command_Reg_Write_or_Continue=1;    //REVISAR, CUANDO SE DA UNA ESCRITURA EN EL command register?
  reg [63:0] ADMA_System_Address_Register; // (Offset 058h) 
  reg [3:0] Present_State=ST_STOP;
  reg [63:0] SYS_ADR;             //Registros Internos
  reg [15:0] DAT_LEN;
  reg [63:0] DAT_ADR;
  reg Valid, End, Int, Act1, Act2; 
  reg [1:0] Act;                    //Act corresponde a la unión  de Act1+Act2 (Por simplicidad)
  reg TFC;
  reg Tran;
  reg [11:0] Transfer_Block_Size; 
  reg Multi_Single_Block_Select;
  reg Data_Transfer_Direction_Select;
  reg Block_Count_Enable; 
  reg DMA_Eneable; 
  reg Read_Transfer_Active;
  reg Write_Transfer_Active; 
  reg Stop_At_Block_Gap_Request;
  reg Continue_Request;
  reg [1:0] Command_Type; 
  reg [3:0] Transfer_Mode_Direction;



Descriptor_Table  table1   (SYS_ADR, Descriptor_Line);
TipoDeTransferencia t1 (Multi_Single_Block_Select, Block_Count_Enable,Transfer_Type);


  always @(*)
begin
Transfer_Block_Size <= Block_Size_Register[11:0];
Multi_Single_Block_Select<=Transfer_Mode_Register[5];        
Data_Transfer_Direction_Select<=Transfer_Mode_Register[4];        
Block_Count_Enable<=Transfer_Mode_Register[1];        
DMA_Eneable<=Transfer_Mode_Register[0];  
Read_Transfer_Active<=Present_State_Register[9];
Write_Transfer_Active<= Present_State_Register[8];
Stop_At_Block_Gap_Request<= Block_Gap_Control_Register[0];
Continue_Request<= Block_Gap_Control_Register[1];
Command_Type[0] <= Command_Register[6];
Command_Type[1] <= Command_Register[7];

Valid <= Descriptor_Line[0];   //Atributos a partir del Descriptor_Line
End <= Descriptor_Line[1];
Int <= Descriptor_Line[2];
Act1 <= Descriptor_Line[4];
Act2 <= Descriptor_Line[5];
Act[0] <=Act1;               //Obtengo Act
Act[1] <=Act2;
DAT_LEN <= Descriptor_Line[31:16];  //Length y Address
DAT_ADR <= Descriptor_Line[95:32];
                        
ADMA_System_Address_Register<=SYS_ADR;

 case(Present_State)
	"ST_STOP": begin 
			if(Command_Reg_Write_or_Continue==1) 
					begin
					SYS_ADR<=Initial_ADMA_System_Address;
					ADMA_System_Address_Register<=SYS_ADR;
					enb_ADMA_System_Address_Register<=1;
					
						if(ack_ADMA_System_Address_Register==1)begin

                          			Present_State <= ST_FDS;
						enb_ADMA_System_Address_Register<=0;
										       end 
						else begin
						Present_State <= ST_STOP;
						end

				        end
			else	
					begin
					SYS_ADR<=Initial_ADMA_System_Address;
					ADMA_System_Address_Register<=SYS_ADR;
					enb_ADMA_System_Address_Register<=1;
					
						if(ack_ADMA_System_Address_Register==1)begin

                          			Present_State <= ST_STOP;
						enb_ADMA_System_Address_Register<=0;
										       end 
						else begin
						Present_State <= ST_STOP;
						end
					



					end
		  end                   

        
       "ST_FDS":  begin
		 TFC<=0;
			     if(Valid==1) 
					     begin
					     Present_State <= ST_CADR;
				             end
			      else	
					     begin
					     ADMA_Error <=1;          
					     DMA_Interrupt <=1; 
					     enb_DMA_Interrupt<=1;
  					     enb_ADMA_Error<=1;
					     if(ack_DMA_Interrupt==1 & enb_ADMA_Error==1) begin
					     Present_State <= ST_FDS;
					     enb_DMA_Interrupt<=0;
  					     enb_ADMA_Error<=0;
					     end 
                                             end
		 end


       "ST_CADR":       begin
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
				//default: 
         		                  
      				endcase
			

			if (Tran==1) begin
				
				ADMA_System_Address_Register<=SYS_ADR;
				enb_ADMA_System_Address_Register<=1;
					
				if(ack_ADMA_System_Address_Register==1)begin

                          	Present_State <= ST_TFR;
				enb_ADMA_System_Address_Register<=0;
								       end 
				else begin
				Present_State <= ST_CADR;
				end

				     end 
			else    begin

				if (End==0) begin
					ADMA_System_Address_Register<=SYS_ADR;
					enb_ADMA_System_Address_Register<=1;
					
					if(ack_ADMA_System_Address_Register==1)begin

                          		Present_State <= ST_FDS;
					enb_ADMA_System_Address_Register<=0;
								               end 
					else begin
					Present_State <= ST_CADR;
					end
					   end

				else     begin
					Present_State <= ST_STOP;
				
				         end
				end 
                        end
     "ST_TFR":

	        begin 
	             if(TFC==1 & (End==1 | Stop_At_Block_Gap_Request==1))
		           Present_State <= ST_STOP;
	             else 
		           Present_State <= ST_TFR;	

                 end
        

        // default: 
         
      endcase




  end

//  output DMA_Interrupt;     //Normal_Interrupt_Status_Register   Offset  030h  bit 3. 
//  output ADMA_Error;        //Error Interrupt Status Register    Offset 032h bit 9.
//  output Transfer_complete; //Normal_Interrupt_Status_Register   Offset  030h  bit 1.

//  reg [15:0] DAT_LEN;
//  reg [63:0] DAT_ADR;
//  reg TFC;


//  reg [11:0] Transfer_Block_Size; 
 
//  reg Stop_At_Block_Gap_Request;
//  reg Continue_Request;



always @(*) begin
	if (Present_State==ST_TFR) begin   

	 	case(Data_Transfer_Direction_Select)
		     0: begin 
			Transfer_Mode_Direction<=HOST_TO_CARD;
			
			end
		     1: begin
			Transfer_Mode_Direction<=CARD_TO_HOST;
			end 

		     default: begin
		        Transfer_Mode_Direction<=WAIT; 
			      end 

		endcase  

	          //   if(TFC==1 & (End==1 | Stop_At_Block_Gap_Request==1))
		  //         Present_State <= ST_STOP;
	          //   else 
		  //         Present_State <= ST_TFR;	



       case(Transfer_Mode_Direction)
		"HOST_TO_CARD": begin
			
	case(Transfer_Type)
			"Single_Transfer":	begin
						if(Write_Transfer_Active==1)begin
 		   							//TRANSFERENCIA		
	
								     end
						else   begin                   
 	      					    Transfer_Type<= Single_Transfer;								      
                					end

					end
			
			"Multiple_Transfer":    begin
						if(Write_Transfer_Active==1)begin
 		   							//TRASFERENCIA2		
								     end
						else   begin                   //Write_Transfer_Active==0
			 	   			     Transfer_Type<= Stop_Multiple_Transfer;		
                					end
					end

			"Stop_Multiple_Transfer":begin
					if (Stop_At_Block_Gap_Request==0 & Continue_Request==1) begin
						Transfer_Type<=Multiple_Transfer;		
												end				
					else begin
						Transfer_Type<=Stop_Multiple_Transfer;
					     end

					end

//					default:
					
	endcase			

				end 
	"CARD_TO_HOST": begin

			
		case(Transfer_Type)
		"Single_Transfer":	begin
					
					if(Read_Transfer_Active==1)begin
 		   							//AGREGAR ACCIÓN  5		

								     end
						else   begin                   //Read_Transfer_Active==0
 	      							       //AGREGAR ACCIÓN 6
                					end

					end
			
		"Multiple_Transfer":    begin
					if(Read_Transfer_Active==1)begin
			   							//AGREGAR ACCIÓN  5		

								     end
						else   begin                   //Read_Transfer_Active==0
			 	      							       //AGREGAR ACCIÓN 6
                					end
					end

		"Stop_Multiple_Transfer":begin
					if (Stop_At_Block_Gap_Request==0 & Continue_Request==1) begin
						Transfer_Type<=Multiple_Transfer;		
												end				
					else begin
						Transfer_Type<=Stop_Multiple_Transfer;
					     end

					end

//					default:
					
		endcase			

		end 

		"WAIT": begin
							case(Transfer_Type)
			"Single_Transfer":	begin
								
								end
			
			"Multiple_Transfer":    begin
								
								end

			"Stop_Multiple_Transfer":begin
								 
								end

//					default:
					
							endcase			
					

			end 



		endcase

	end 

      
endmodule 


