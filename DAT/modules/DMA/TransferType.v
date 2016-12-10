module TipoDeTransferencia(Multi_Single_Block_Select, Block_Count_Enable,Transfer_Type);
input  Multi_Single_Block_Select;
input  Block_Count_Enable;


output [1:0] Transfer_Type;

wire Multi_Single_Block_Select;
wire Block_Count_Enable;


reg [1:0] Transfer_Type;
reg [1:0] Temporal; 

  parameter Single_Transfer  = 2'b00; 
  parameter Infinite_Transfer  = 2'b01;
  parameter Multiple_Transfer  = 2'b10;
  parameter Stop_Multiple_Transfer  = 2'b11;


always @(*)
begin
 Temporal[1]<=Multi_Single_Block_Select;
 Temporal[0]<=Block_Count_Enable;

case(Temporal)  
				2'b00:  begin 
					Transfer_Type<=Single_Transfer;
					
					end    

				2'b01:  begin 
					Transfer_Type<=Single_Transfer;
					end

				2'b10:  begin
					Transfer_Type<=Infinite_Transfer;
					end
					
					
				2'b11:	begin
 
					if (Block_Count_Enable==0) begin
					Transfer_Type<= Stop_Multiple_Transfer;
					end
					else begin
					Transfer_Type<= Multiple_Transfer;
					end


					end
				//default: 
         				//definir
      				endcase

end 
endmodule 
