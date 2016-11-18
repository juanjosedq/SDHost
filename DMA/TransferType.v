module Transferencia(Temporal, Block_Count,Transfer_Type);
input [1:0] Temporal;
input [15:0] Block_Count;

output [1:0] Transfer_Type;

wire [1:0] Temporal;
wire [15:0] Block_Count;

reg [1:0] Transfer_Type;

  parameter Single_Transfer  = 2'b00; 
  parameter Infinite_Transfer  = 2'b01;
  parameter Multiple_Transfer  = 2'b10;
  parameter Stop_Multiple_Transfer  = 2'b11;

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
 
					if (Block_Count==0) begin
					Transfer_Type<= Stop_Multiple_Transfer;
					end
					else begin
					Transfer_Type<= Multiple_Transfer;
					end


					end
				default: 
         				//definir
      				endcase


endmodule 
