`include "DAT.v"
`include "aFIFO.v"

module union;

	wire [31:0] DMA_fifo_input;
	reg ReadEn_in_buffer = 1;
	reg [3:0] card_in;
	reg [10:0]block_amount;
	wire [3:0] card_out;
	wire [31:0] buffer_write_on_DAT;
	wire [31:0] DAT_write_on_buffer;
	reg host_clk = 0;
	//always #6 host_clk = !host_clk;   //FIXME borrar esto al agregar a modulo SD Host
	reg card_clk = 0;
	//always #2 card_clk = !card_clk;

	asynchronous_fifo FIFO_write_DAT_to_DMA(
	//Reading port.	 
		DMA_fifo_input, 
		Empty_out_DMA_read, //almost empty signal
		ReadEn_in_buffer,
		host_clk,        
	//Writing port.	 
		DAT_write_on_buffer,  
		Full_out_DAT_write, //almost full signal, 
		WriteEn_DAT_to_buffer,
		card_clk,
		buffer_to_DAT_ack,
		ready); // 

 	DAT data_module(	buffer_write_on_DAT, 
		DAT_write_on_buffer,
		card_in, 
		card_out, 
		clk,
		buffer_to_DAT_ack, 
		DAT_to_buffer_ack, 
		DAT_fifo_en,
		card_ack_i, 
		card_ack_o, 
		Full_out_DAT_write, 
		Empty_DAT_read,
		block_amount,
		fifo_ready,
		new_trans,
		reset_input,
		mode,
		direction);

endmodule
