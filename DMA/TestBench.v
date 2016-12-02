module test;
wire clk;
wire DMA_Interrupt;
wire ADMA_Error;
wire Transfer_complete;
wire [63:0] Initial_ADMA_System_Address;


wire  [15:0] Block_Size_Register; 
wire  [15:0] Block_Count_Register; 
wire  [15:0] Transfer_Mode_Register;
wire  [31:0] Present_State_Register;
wire  [7:0] Block_Gap_Control_Register;
wire  [15:0]  Command_Register;
wire [63:0] ADMA_System_Address_Register;

wire enb_DMA_Interrupt;
wire ack_DMA_Interrupt;
wire enb_ADMA_Error;
wire ack_ADMA_Error;
wire enb_Transfer_complete;
wire ack_Transfer_complete;
wire enb_ADMA_System_Address_Register;
wire ack_ADMA_System_Address_Register;



   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador p1 (clk, Initial_ADMA_System_Address, ack_DMA_Interrupt, ack_ADMA_Error, ack_Transfer_complete, ack_ADMA_System_Address_Register);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address, Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register, ADMA_System_Address_Register, enb_DMA_Interrupt, ack_DMA_Interrupt,  enb_ADMA_Error, ack_ADMA_Error, enb_Transfer_complete, ack_Transfer_complete, enb_ADMA_System_Address_Register, ack_ADMA_System_Address_Register);

   Registers  r1  (Block_Size_Register,Block_Count_Register,Transfer_Mode_Register,Present_State_Register,Block_Gap_Control_Register, Command_Register);

  
endmodule 
