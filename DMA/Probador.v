`timescale 1 ns / 1 ps
module probador(clk, Initial_ADMA_System_Address);


output        clk, Initial_ADMA_System_Address;


reg        clk;
reg  [63:0] Initial_ADMA_System_Address;

initial begin
   
   clk=0;
   Initial_ADMA_System_Address=1; 
   #1000 $finish;

   end

   always #100 clk <= !clk;
   
  
endmodule 







