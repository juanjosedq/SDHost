
module ADMA(clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address);


  parameter ST_STOP  = 4'b0001; //Estados
  parameter ST_FDS  = 4'b0010;
  parameter ST_CADR  = 4'b0100;
  parameter ST_TFR  = 4'b1000;

 
  input clk;
  input Initial_ADMA_System_Address;


  output DMA_Interrupt, ADMA_Error, Transfer_complete;

  wire clk;
  wire [63:0] Initial_ADMA_System_Address;      

  reg DMA_Interrupt=0; 
  reg ADMA_Error=0; 
  reg Transfer_complete=0;
  reg Command_Reg_Write_or_Continue=1;    //hacer lectura
  reg [3:0] Present_State=ST_STOP;
  reg [63:0] SYS_ADR;             //Registros Internos
  reg [95:0] Descriptor_Line;
  reg [15:0] DAT_LEN;
  reg [63:0] DAT_ADR;
  reg Valid, End, Int, Act1, Act2; 
  reg [1:0] Act;                    //Act corresponde a la unión  de Act1+Act2 (Por simplicidad)
  reg TFC;
  reg Tran;
  reg STOP=0;

  //En seguida se encuentran los registros de los que debo estar haciendo lectura
  // Multi/Single_Block_Select; Data_Transfer_Direction_Select; Block_Count_Enable; DMA_Eneable; Read_Transfer_Active; Write Transfer Active; Stop_At_Block_Gap_Request; Continue Request;   



  

  always @(*)

  begin 





 case(Present_State)
	"ST_STOP": begin 
			if(Command_Reg_Write_or_Continue==1) 
					begin
					SYS_ADR<=Initial_ADMA_System_Address;
                          		Present_State <= ST_FDS;
				        end
			else	
					begin
					SYS_ADR<=Initial_ADMA_System_Address;
					Present_State <= ST_STOP;
					end
		  end                   

        
       "ST_FDS":  begin
                 
                 Descriptor_Table  table1   (SYS_ADR, Descriptor_Line);
                 Valid <= Descriptor_Line[0];   //Atributos a partir del Descriptor_Line
		 End <= Descriptor_Line[1];
		 Int <= Descriptor_Line[2];
		 Act1 <= Descriptor_Line[4];
		 Act2 <= Descriptor_Line[5];

		 Act[0] <=Act1;               //Obtengo Act
		 Act[1] <=Act2;

		 DAT_LEN <= Descriptor_Line[31:16];  //Length y Address
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
				Present_State <= ST_TFR;
				     end 
			else
				begin

				if (End==0)
					Present_State <= ST_FDS;
				else
					Present_State <= ST_STOP;
				
				end
                        end
     "ST_TFR":


                //Transferencia
	        begin 
	             if(TFC==1 & (End==1 | STOP==1))
		           Present_State <= ST_STOP;
	             else 
		           Present_State <= ST_TFR;	

                 end
        

        // default: 
         
      endcase
  end
		

endmodule 


