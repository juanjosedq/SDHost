module transferencia(Permiso_Transf, Data_Transfer_Direction_Select, DAT_LEN, DAT_ADR, transferencia_finalizada);

  parameter WAIT= 4'b0001; //DirecciónTransferencia
  parameter CARD_TO_HOST= 4'b0010;
  parameter HOST_TO_CARD= 4'b0100;

input Permiso_Transf;
input Data_Transfer_Direction_Select;
input [15:0] DAT_LEN;
input [63:0] DAT_ADR;

output transferencia_finalizada;

wire Permiso_Transf;
wire Data_Transfer_Direction_Select;
wire [15:0] DAT_LEN;
wire [63:0] DAT_ADR;

reg transferencia_finalizada=0;
reg [15:0] transfer_data_length=0;

always @(*) begin 
if (transfer_data_length==DAT_LEN) begin
transferencia_finalizada<=1;
end

else begin
transferencia_finalizada<=transferencia_finalizada;
end 
end

endmodule
