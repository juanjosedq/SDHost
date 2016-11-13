`timescale 1 ns / 1 ps
module probador(EstadoActual, End, Valid, Tran, Data_Transfer, STOP, Command_Reg_Write_or_Continue, ENB);


output [1:0] EstadoActual;
output       End, Valid, Tran, TFC,Data_Transfer,STOP, Command_Reg_Write_or_Continue, ENB;

reg [1:0] EstadoActual;
reg       End, Valid, Tran, TFC,Data_Transfer,STOP, Command_Reg_Write_or_Continue, ENB;

initial begin
   EstadoActual = 2'b00;
   End = 0;
   Valid = 1;
   Tran = 0;
   Data_Transfer = 1;
   STOP = 0;
   Command_Reg_Write_or_Continue= 1;
   ENB = 0;
   #1000 $finish;

   end

   always #100 ENB <= !ENB;
   always #249  EstadoActual<= EstadoActual+1;
   always #50  End <= !End;
   always #50  Valid <= !Valid;
   always #50  Tran <= !Tran;
   always #50  Data_Transfer <= !Data_Transfer;
   always #50  STOP <= !STOP;
   always #50  Command_Reg_Write_or_Continue<= !Command_Reg_Write_or_Continue;  

endmodule 







