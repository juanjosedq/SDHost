`include "DAT.v"
module testbench_width; //testbench y probador de DAT
	
	reg [3:0] card_in = 0;
	reg [31:0] buffer_in = 0;
	wire [31:0] buffer_out;
	wire [3:0] card_out;
	reg clock;
	reg new_trans;
	reg enable_write, enable_read, Clear_in, reset;	           
	parameter n = 32;
	parameter vector_width = 10;			//reg_vector has inputs with information coming from registers
	reg [vector_width - 1 :0] reg_vector = 10'b1101111111;
	reg fifo_ack_i = 0;
	reg card_ack_i = 0;
	reg fifo_full = 0;
	reg fifo_empty = 0;
	reg mode = 1;
	reg [10:0] block_amount = 8;
	reg direction = 1;

DAT data_module (	buffer_in,  //list
		buffer_out, //listo
		card_in,    //listo
		card_out,   //listo
		clock,
		fifo_ack_i, 
		fifo_ack_o,
		fifo_enable_o,  
		card_ack_i, 
		card_ack_o, 
		fifo_full, 
		fifo_empty, 
		block_amount,
		fifo_ready,
		new_trans,
		reset,
		mode,
		direction);
	initial begin

		Clear_in = 1;
		enable_write = 1;
		enable_read = 1;
		reset = 0;

		clock = 0;
	#2	new_trans = 1;
	#4	card_in = 4'hF;
	#5	card_in = 4'hC;
	#4	card_in = 4'h1;
	#4	card_in = 4'h0;
	#6	card_in = 4'hB;
	#3	card_in = 4'h0;
	#4	card_in = 4'b1011;
	#5	card_in = 4'b0000;
	#3	card_in = 4'b1110;
	#5	card_in = 4'b0111;
	#6	card_in = 4'b1101;
	#5	card_in = 4'b0000;
	#4	card_in = 4'hF;
	#5	card_in = 4'hC;
	#4	card_in = 4'h1;
	#4	card_in = 4'h0;
	#6	card_in = 4'hB;
	#3	card_in = 4'h0;
	#4	card_in = 4'b1011;
	#5	card_in = 4'b0000;
	#3	card_in = 4'b1110;
	#5	card_in = 4'b0111;
	#6	card_in = 4'b1101;
	#5	card_in = 4'b0000;
	#5	mode = 0;
	#4	card_in = 4'hF;
	#5	card_in = 4'hC;
	#4	card_in = 4'h1;
	#4	card_in = 4'h0;
	#6	card_in = 4'hB;
	#3	card_in = 4'h0;
	#4	card_in = 4'b1011;
	#5	card_in = 4'b0000;
	#3	card_in = 4'b1110;
	#5	card_in = 4'b0111;
	#6	card_in = 4'b1101;
	#5	card_in = 4'b0000;
	#5	enable_read = 0;
	#30	enable_read = 1;




     #400 $finish;
   end

  initial begin       
     $dumpfile("testbench_width.vcd");          
     $dumpvars(0,testbench_width);
  end

   always #2 clock = !clock;
endmodule // probador
