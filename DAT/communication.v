module communication(	buffer_o, 
			card_o, 
			finnished_trans,
			mode, dat_width,
			buffer_i,
			card_i,
			clk, trans_enable,
			reg_vector); 

parameter block_size = 10; //parametro dummy

output [31:0] buffer_o;
output [3:0] card_o;
output finnished_trans;
input [31:0] buffer_i;
input [3:0] card_i;
input clk, trans_enable, mode, dat_width; //mode = 1, multi block    dat_width = 1, 4 bit mode
input [9:0]reg_vector;
//local registers
reg [9:0] block_count = 0;

	
	always @* begin
		if (trans_enable) begin
			if (dat_width)
				begin
					block_count <= block_count + 1;
				end
		end		
	end

endmodule
