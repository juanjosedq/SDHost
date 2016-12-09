`include "communication.v"

//version 29 dic
module DAT (	buffer_in, 
		buffer_out, 
		card_in, 
		card_out, 
		clk,
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
		reset_input,
		mode,
		direction);

parameter vector_width = 10;			//reg_vector has inputs with information coming from registers
input wire [31:0] buffer_in;
input wire [10:0] block_amount;
input wire [vector_width - 1 :0] reg_vector;

//there will be a specific index for reach element of the array
//in reg_vector, set with parameters with a +20 offset
//one hot parameters will be states, +20 parameters will be pointets to 
//reg_vector 
input [3:0] card_in;
output wire [3:0] card_out;			
output wire [31:0] buffer_out;
input wire clk, fifo_ack_i, card_ack_i, sd_clk, fifo_full, fifo_empty, reset_input, fifo_ready, mode, direction;	
output wire fifo_ack_o, card_ack_o;
output reg fifo_enable_o = 0;	

//ack signals are sent or received when transference is expected
//both input (_i) and output (_o) have to be received and send in
//order for transference to be successful

reg [4:0] state = 0;				
reg enable_trans; 
input wire new_trans;
reg count = 0;

//States declaration:

parameter reset = 7'b0000001;
parameter idle = 7'b0000010;
parameter fifo_check = 7'b0000100;
parameter trans_begin = 7'b0001000;		//send or recieve state
parameter trans_count = 7'b0100000;		//send or recieve state
parameter trans_finnished = 7'b0010000;	//transference acknolgedge state


//reg_vector index parameters: (real index will be "parameter" - 20)

parameter present_state = 20; 	//includes multiple or single block mode  	##write into card vector[present_state - 19] = 1;
				//data direction select 					
				//enable and block 					
				//count enable bit 
parameter host_control_width = 24;	//high-low speed select
parameter trans_block_size = 25;
parameter command_reg = 26;	//commands through DAT
parameter trans_mode = 27;	//same info as in present state
parameter software_reset = 28;	

always @ (posedge clk)
	begin 
		case (state)
			default:
				begin
					state <= reset;
					fifo_enable_o <= 0;
	
				end
			reset:
				begin
					state <= idle;
					fifo_enable_o <= 0;	
				end
			idle:
				begin
					if (reset_input) begin 
						state <= reset;
					end else begin 
						if(new_trans) begin							
							state <= fifo_check;
							fifo_enable_o <= 1;
						end else begin
							state <= idle;
						end
					end
				end
			fifo_check:
				begin
					if (reset_input) begin 
						state <= reset;
					end else begin 
						if (fifo_ready) begin
							state <= trans_begin;
						end else begin
							state <= fifo_check;
						end
					end
				end
			trans_begin:
				begin
					if (reset_input) begin 
						state <= reset;
					end else begin 
						state <= trans_count;
					end
				end
			trans_count:
				begin
					if (reset_input) begin 
						state <= reset;
					end else begin 
						if(mode	&& (count != block_amount)) 
						
							begin
								if ((fifo_ack_o || ack_o_card))
									begin
										state <= trans_count;
										count <= count + 1;
									end else begin
										state <= trans_count;
									end						
							end else begin
								
								state <= trans_begin;
								count <= 0;	
							end
					end
				end

			trans_finnished:
				begin
					if(reset) begin
						state <= reset;
					end else begin
						state <= trans;
					end
				end	
		endcase	
	end
	
always @(*) begin
	if (state == fifo_check || state == trans_begin || state == trans_count) begin
		enable_trans = 1'b1;
	end else begin
		enable_trans = 0;
	end
end
	
	communication com_instance(buffer_out, card_out, block_trans_finnished, buffer_in, card_in, clk, enable_trans,  	
		fifo_ack_o, ack_o_card, mode, direction); 		
	
endmodule
