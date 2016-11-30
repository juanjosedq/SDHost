module test;
wire clk;
wire DMA_Interrupt;
wire ADMA_Error;
wire Transfer_complete;
wire Initial_ADMA_System_Address;


   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador p1 (clk, Initial_ADMA_System_Address);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address);

endmodule 
