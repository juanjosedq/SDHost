`timescale 1 ns / 1 ps
module probador(clk, Initial_ADMA_System_Address, ack);


output  clk; 
output  [63:0] Initial_ADMA_System_Address;
output ack;


reg        clk;
reg  [63:0] Initial_ADMA_System_Address;
reg ack;

initial begin
   ack=0;
   clk=0;
   Initial_ADMA_System_Address=1; 
   #1000 $finish;

   end

   always #100 clk <= !clk;
   always #500 ack <= !ack;
  
endmodule 







