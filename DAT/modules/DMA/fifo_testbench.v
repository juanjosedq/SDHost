module fifo_testbench; //testbench y probador de fifo

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
wire Permiso_Transf;

	reg [n-1 : 0] parallel;
	reg sd_clock; 
	reg clock;
	reg enable_write;
	reg enable_read;
	reg Clear_in;	           
	parameter n = 32;
	wire [n-1: 0] Data_out;


	reg [n2-1 : 0] parallel2;
	reg sd_clock2;
	reg clock2;
	reg enable_write2;
	reg enable_read2;
	reg Clear_in2;	           
	parameter n2 = 32;
	wire [n2-1: 0] Data_out2;
	
//Lectura
	asynchronous_fifo FIFO
        //Reading port
	(Data_out, 
	Empty_out, //almost empty signal
	enable_read,
	sd_clock,        
	//Writing port.	 
	parallel,  
	Full_out, //almost full signal
	enable_write,
	clock,	 
	ack_write);
	
//Escritura
	asynchronous_fifo FIFO2
        //Reading port
	(Data_out2, 
	Empty_out2, //almost empty signal
	enable_read2,
	sd_clock2,        
	//Writing port.	 
	parallel2,  
	Full_out2, //almost full signal
	enable_write2,
	clock2,	 
	ack_write2);

	initial begin


		Clear_in = 1;
		enable_write = 1;
		enable_read = 1;
		sd_clock = 0;
		clock = 0;
	#4	parallel = 32'hFCB01AA;
	#5	parallel = 32'hFCBCAFE;
	#4	parallel = 32'h11CAFEF;
	#4	parallel = 32'h1111000;
	#6	parallel = 32'hFFFFFFF;
	#3	parallel = 32'h11CAFEF;
	#4	parallel = 4'b1011;
	#5	parallel = 4'b0000;
	#3	parallel = 4'b1110;
	#5	parallel = 4'b0111;
	#6	parallel = 4'b0101;
	#5	parallel = 4'b0000;
	#5	enable_read = 0;
	#30	enable_read = 1;



		Clear_in2 = 1;
		enable_write2 = 1;
		enable_read2 = 1;
		sd_clock2 = 0;
		clock2 = 0;
	#4	parallel2 = 32'hFCB01AA;
	#5	parallel2 = 32'hFCBCAFE;
	#4	parallel2 = 32'h11CAFEF;
	#4	parallel2 = 32'h1111000;
	#6	parallel2 = 32'hFFFFFFF;
	#3	parallel2 = 32'h11CAFEF;
	#4	parallel2 = 4'b1011;
	#5	parallel2 = 4'b0000;
	#3	parallel2 = 4'b1110;
	#5	parallel2 = 4'b0111;
	#6	parallel2 = 4'b0101;
	#5	parallel2 = 4'b0000;
	#5	enable_read2 = 0;
	#30	enable_read2 = 1;

   #200 $finish;
   end

probador p1 (clk, Initial_ADMA_System_Address, ack_DMA_Interrupt, ack_ADMA_Error, ack_Transfer_complete, ack_ADMA_System_Address_Register);

   ADMA   adma1 (clk, DMA_Interrupt, ADMA_Error, Transfer_complete, Initial_ADMA_System_Address, Block_Size_Register, Block_Count_Register, Transfer_Mode_Register, Present_State_Register, Block_Gap_Control_Register, Command_Register, ADMA_System_Address_Register, enb_DMA_Interrupt, ack_DMA_Interrupt,  enb_ADMA_Error, ack_ADMA_Error, enb_Transfer_complete, ack_Transfer_complete, enb_ADMA_System_Address_Register, ack_ADMA_System_Address_Register, Permiso_Transf);

   Registers  r1  (Block_Size_Register,Block_Count_Register,Transfer_Mode_Register,Present_State_Register,Block_Gap_Control_Register, Command_Register);

  initial begin       
     $dumpfile("testbench.vcd");          
     $dumpvars(0,fifo_testbench);
  end

   always #6 sd_clock = !sd_clock;
   always #2 clock = !clock;
endmodule // probador
