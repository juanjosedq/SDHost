`include "modules/n_m.v"
`include "modules/m_n.v"
`include "modules/serial_n.v"
`include "modules/n_serial.v"

module communication(	buffer_o, 
			card_o, 
			finnished_blocks_trans,
			buffer_i,
			card_i,
			clk, trans_enable,
			ack_o_buff,
			ack_o_card,
			mode, direction); 

	parameter block_size = 10; //parametro dummy

	//reg_vector index parameters: (real index will be "parameter" - 20)

	parameter present_state = 20; 	//includes multiple or single block mode
					//select bit, data direction selec 					
					//bit, enable and block 					
					//count enable bit 
	parameter width_reg = 24;	//high-low speed select, reg_vector[width_reg-20] = 1, 4 bit mode
	parameter trans_block_size = 25;
	parameter command_reg = 26;	//commands through DAT
	parameter trans_mode = 27;	//same info as in present state
	parameter software_reset = 28;	
	//Module inputs
	output reg [31:0] buffer_o;
	output reg [3:0] card_o;
	output reg finnished_blocks_trans; 
	output reg ack_o_buff; 
	output reg ack_o_card;
	wire [3:0] card_o_s_i;
	input [31:0] buffer_i;
	input [3:0] card_i;
	input clk, trans_enable, mode, sd_clk, direction; //mode = 1, multi block    
	input [9:0]reg_vector;
	//local registers
	reg [9:0] data_count = 0;
	reg reset = 0; //FIXME
	reg ack_finnished = 0;
	
	
	always @(*) begin
		finnished_blocks_trans = ack_finnished & ~mode;	
	end	
	
	assign ack_o_buff_finnished = finnished_blocks_trans & direction;
	assign ack_o_card_finnished = finnished_blocks_trans & ~direction;


	wire [3:0]card_o_m;
	assign card_o_s_i = {card_o_s, 1'b0, 1'b0, 1'b0}; //output for 1 bit channel from card

	assign trans_enable_c_m = trans_enable & (~direction & mode);
	assign trans_enable_c_s = trans_enable & (~direction & ~mode);
	
	n_m card_m(trans_enable_c_m, buffer_i, card_o_m, complete_m_card, reset, clk, trans_enable_c_m);
	n_serial card_s(trans_enable_c_s, buffer_i, card_o_s, complete_s_card, reset, clk, trans_enable_c_s);
	
	always @(*) begin
		if(mode)begin
			card_o = card_o_m;
		end else begin
			card_o[3:0] = card_o_s_i;
		end	
	end
	
	wire [31:0] buff_o_s;
	wire [31:0] buff_o_m;


	assign trans_enable_buff_m = trans_enable & (direction & mode);
	assign trans_enable_buff_s = trans_enable & (direction & ~mode);

	serial_n buff_s(buff_o_s, card_i[3], clk, trans_enable_buff_s, reset, complete_s_buff);
	m_n buff_m(buff_o_m, card_i, clk, trans_enable_buff_m, reset, complete_m_buff);

	always @(*) begin
		if(mode)begin
			buffer_o = buff_o_m;
		end else begin
			buffer_o = buff_o_s;
		end	
	end

	always @(*) begin
		if(mode)begin
			ack_o_buff = complete_m_buff;
			ack_o_card = complete_m_card;
		end else begin
			ack_o_buff = complete_s_buff;
			ack_o_card = complete_s_card;
		end	
	end




endmodule
