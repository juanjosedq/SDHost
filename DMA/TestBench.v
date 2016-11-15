module test;

 wire [1:0] EstadoActual;
 wire End;
 wire Valid;
 wire Tran;

 wire Data_Transfer;
 wire STOP;
 wire Command_Reg_Write_or_Continue;
 wire [1:0] ProximoEstado;
 wire ADMA_Error_Interrupt;
 wire ENB;

   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador senales (EstadoActual, End, Valid, Tran, Data_Transfer, STOP, Command_Reg_Write_or_Continue, ENB);

   TransicionEstados transicion (EstadoActual, End, Valid, Tran, Data_Transfer, STOP, Command_Reg_Write_or_Continue, ProximoEstado, ADMA_Error_Interrupt, ENB);

endmodule 
