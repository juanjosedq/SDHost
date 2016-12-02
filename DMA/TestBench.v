module test;
wire clk;
wire DMA_Interrupt;
wire ADMA_Error;
wire Transfer_complete;
wire [63:0] Initial_ADMA_System_Address;
wire ack; 

wire  [15:0] Block_Size_Register; 
wire  [15:0] Block_Count_Register; 
wire  [15:0] Transfer_Mode_Register;
wire  [31:0] Present_State_Register;
wire  [7:0] Block_Gap_Control_Register;
wire  [15:0]  Command_Register;



   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador p1 (clk, Initial_ADMA_System_Address, ack);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address, Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register, ADMA_System_Address_Register, enb, ack);

   Registers  r1  (Block_Size_Register,Block_Count_Register,Transfer_Mode_Register,Present_State_Register,Block_Gap_Control_Register, Command_Register);

  
endmodule 
