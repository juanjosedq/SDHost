`include "DAT.v"

module testbench_card_write; //testbench y probador de DAT
	
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
	reg direction = 0;

DAT data_module (	buffer_in,  
		buffer_out, 
		card_in,    
		card_out,   
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
	#40	buffer_in = 32'hCAFECAFE;
	#50	buffer_in = 32'h0A0BF10A;
	#40	buffer_in = 32'hFCB01AF0;
	#40	buffer_in = 32'hABBA01FF;
	#60	buffer_in = 32'hAFA016F0;
	#30	buffer_in = 32'h01AF001A;
		mode = 0;
	#40	buffer_in = 32'hABBACAFE;
	#50	buffer_in = 32'hFF001ABA;
	#30	buffer_in = 32'hCAFECAFE;
	#50	buffer_in = 32'h110FCBAF;
	#60	buffer_in = 32'hFF001FF0;
	#50	buffer_in = 32'h11FFABBA;




     #200 $finish;
   end

  initial begin       
     $dumpfile("testbench_card_write.vcd");          
     $dumpvars(0,testbench_card_write);
  end

   always #2 clock = !clock;
endmodule // probador
