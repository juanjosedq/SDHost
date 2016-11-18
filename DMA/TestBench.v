module test;
wire clk;
wire DMA_Interrupt;
wire ADMA_Error;
wire Transfer_complete;
wire Command_Reg_Write_or_Continue;


   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador senales (clk, Command_Reg_Write_or_Continue);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Command_Reg_Write_or_Continue);

endmodule 
