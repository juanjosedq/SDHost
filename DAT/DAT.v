`include "communication.v"

module DAT (buffer_in, buffer_out, reg_vector, card_in, card_out, clk, sd_clk, sd_clk, fifo_ack_i, fifo_ack_o, card_ack_i, card_ack_o);

parameter vector_width = 10;			//reg_vector has inputs with information coming from registers
input wire [31:0] buffer_in;
input wire [vector_width - 1 :0] reg_vector;

//there will be a specific index for reach element of the array
//in reg_vector, set with parameters with a +20 offset
//as parameters below 20 will be set for states 
input [3:0] card_in;
output wire [3:0] card_out;			
output wire [31:0] buffer_out;
input wire clk, fifo_ack_i, card_ack_i, sd_clk;	
output reg fifo_ack_o, card_ack_o;	

//ack signals are sent or received when transference is expected
//both input (_i) and output (_o) have to be received and send in
//order for transference to be successful

reg [4:0] state = 0;		

//States declaration:

parameter reset = 1;
parameter idle = 5'b00010;
parameter fifo_check = 5'b00100;
parameter trans = 5'b01000;		//send or recieve state
parameter trans_ready = 5'b10000;	//transference acknolgedge state

//reg_vector index parameters: (real index will be "parameter" - 20)

parameter present_state = 20; 	//includes multiple or single block mode
				//select bit, data direction selec 					
				//bit, auto CMD12 enable and block 					
				//count enable bit 
parameter host_control_width = 24;	//high-low speed select
parameter trans_block_size = 25;
parameter command_reg = 26;	//commands through DAT
parameter trans_mode = 27;	//same info as in present state
parameter software_reset = 28;	
assign mode = reg_vector[trans_mode];
assign dat_width = reg_vector[host_control_width];

always @ (posedge clk)
	begin 
		case (state)
			reset:
				begin
					state <= idle;
				end
			idle:
				begin
					if (reset) begin 
						state <= reset;
					end else begin 
						if(new_trans == 1) begin							
							state <= fifo_check;
						end else begin
							state <= idle;
						end
					end
				end
			fifo_check:
				begin
					if (reset) begin 
						state <= reset;
					end else begin 
						if (fifo_ack) begin
							state <= trans;
						end else begin
							state <= fifo_check;
						end
					end
				end
			trans:
				begin
					if (reset) begin 
						state <= reset;
					end else begin 
f						if(trans_finnished != 1) begin
							state <= trans_ready;
						end else begin
							state <= trans;
						end
					end
				end
			trans_ready:
				begin
					if(reset) begin
						state <= reset;
					end else begin
						state <= trans_ready;
					end
				end	
		endcase	
	end
	
	always @(state) begin
		if (state == fifo_check or state == fifo_check)
	end
	
	communication com_instance(buffer_out, card_out, trans_finnished, mode, dat_width, buffer_in, card_in, clk, sd_clk, enable_trans,  
		
		reg_vector, ack_o_buff, ack_o_card); 		
	
endmodule
