`timescale 1 ns / 1 ps
module probador(clk, Initial_ADMA_System_Address, ack_DMA_Interrupt, ack_ADMA_Error, ack_Transfer_complete, ack_ADMA_System_Address_Register);


output  clk; 
output  [63:0] Initial_ADMA_System_Address;
output  ack_DMA_Interrupt;
output  ack_ADMA_Error;
output ack_Transfer_complete;
output ack_ADMA_System_Address_Register;

reg        clk;
reg  [63:0] Initial_ADMA_System_Address;
reg  ack_DMA_Interrupt;
reg  ack_ADMA_Error;
reg ack_Transfer_complete;
reg ack_ADMA_System_Address_Register;

initial begin
   ack_DMA_Interrupt=1;
   ack_ADMA_Error=1;
   ack_Transfer_complete=1;
   ack_ADMA_System_Address_Register=1;
   clk=0;
   Initial_ADMA_System_Address=1; 
   #1000 $finish;
   

   end

   always #100 clk <= !clk;
  
   
  
endmodule 







