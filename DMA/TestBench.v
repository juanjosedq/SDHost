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

wire parallel1;
wire sd_clock1;
wire clock1; 
wire enable_write1; 
wire enable_read1; 
wire Clear_in1;

wire [n-1: 0] Data_out1;
parameter n = 32; //FIXME 
wire Empty_out1;
wire Full_out1;
wire ack_write1;


   initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,test);
   end

   probador p1 (clk, Initial_ADMA_System_Address, ack_DMA_Interrupt, ack_ADMA_Error, ack_Transfer_complete, ack_ADMA_System_Address_Register);

   probadorfifo p2 (parallel1, sd_clock1, clock1, enable_write1, enable_read1, Clear_in1);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address, Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register, ADMA_System_Address_Register, enb_DMA_Interrupt, ack_DMA_Interrupt,  enb_ADMA_Error, ack_ADMA_Error, enb_Transfer_complete, ack_Transfer_complete, enb_ADMA_System_Address_Register, ack_ADMA_System_Address_Register);

   Registers  r1  (Block_Size_Register,Block_Count_Register,Transfer_Mode_Register,Present_State_Register,Block_Gap_Control_Register, Command_Register);

//FIFOS
asynchronous_fifo FIFO (Data_out1, Empty_out1, enable_read1, sd_clock1, parallel1, Full_out1, enable_write1, clock1, ack_write1);
//asynchronous_fifo FIFO2 (Data_out2, Empty_out2, enable_read2, sd_clock2, parallel2, Full_out2, enable_write2, clock2, ack_write2);


  
endmodule 
