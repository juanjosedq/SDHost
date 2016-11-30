module communication(	buffer_o, 
			card_o, 
			finnished_trans,
			mode, dat_width,
			buffer_i,
			card_i,
			clk, sd_clk, trans_enable,
			reg_vector, ack_o_buff,
			ack_o_card); 

parameter block_size = 10; //parametro dummy

output reg [31:0] buffer_o;
output reg [3:0] card_o;
output reg finnished_trans, ack_o_buff, ack_o_card	;
input [31:0] buffer_i;
input [3:0] card_i;
input clk, trans_enable, mode, dat_width, sd_clk; //mode = 1, multi block    dat_width = 1, 4 bit mode
input [9:0]reg_vector;
//local registers
reg [9:0] block_count = 0;
reg reset = 0; //Revisar, FIXME

	
	always @(posedge clk) begin
		if (trans_enable) begin
			if (dat_width)
				begin
					block_count <= block_count + 1;
				end
		end		
	end
	
	wire [3:0]card_o_m;
	assign card_o_s_i = {card_o_s, 1'b0, 1'b0, 1'b0}; //output for 1 bit channel from card
	
	n_m card_m(trans_enable, buffer_i, card_o_m, complete_m_card, reset, clk, trans_enable);
	n_serial card_s(trans_enable, buffer_i, card_o_s, complete_s_card, reset, clk, trans_enable);
	
	always @(*) begin
		if(mode)begin
			card_o = card_o_m;
		end else begin
			card_o[3:0] = card_o_s_i;
		end	
	end
	
	wire [31:0] buff_o_s;
	wire [31:0] buff_o_m;
	serial_n buff_s(buff_o_s, card_i[3], sd_clk, trans_enable, reset, complete_m_buff);
	m_n buff_m(buff_o_m, card_i, sd_clk, trans_enable, reset, complete_s_buff);

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
