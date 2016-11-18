`timescale 1 ns / 1 ps
module probador(clk, Command_Reg_Write_or_Continue);


output        clk, Command_Reg_Write_or_Continue;


reg        clk, Command_Reg_Write_or_Continue;

initial begin
   
   clk=0;
   Command_Reg_Write_or_Continue=1;
   #1000 $finish;

   end

   always #100 clk <= !clk;
   always #50  Command_Reg_Write_or_Continue<= !Command_Reg_Write_or_Continue;  
  
endmodule 







