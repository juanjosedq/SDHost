module DAT (buffer_in, reg_vector, card_out, clk, pop, push, fifo_ack);

parameter vector_width = 6;			//reg_vector has inputs with information coming from registers
input wire [31:0] buffer_in;
input wire [vector_width - 1 :0] reg_vector;	//there will be a specific index for reach element of the array
output wire [3:0] card_out;			//in reg_vector, set with parameters with a +20 offset
input wire pop, clk, fifo_ack;				//as parameters below 20 will be set for states 
output reg push;
reg [3:0] state = 0;


//States declaration:

parameter reset = 0;
parameter idle = 1;
parameter fifo_check = 2;
parameter trans = 3;		//send or recieve state
parameter trans_ready = 4;	//transference acknolgedge state

//reg_vector index parameters: (real index will be "parameter" - 20)

parameter present_state = 20; 	//includes multiple or single block mode
				//select bit, data direction selec 					
				//bit, auto CMD12 enable and block 					
				//count enable bit 
parameter host_control = 24;	//high-low speed select
parameter trans_block_size = 25;
parameter command_reg = 26;	//commands through DAT
parameter trans_mode = 27;	//same info as in present state
parameter software_reset = 28;	

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
						state <= fifo_check;
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
						state <= trans_ready;
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
	
	if (state == trans) begin
		communication com_settings(buffer_in, card_out, clk, pop, push, reg_vector[present_state - 20], reg_vector[present_state -20 +1], reg_vector[trans_block_size - 20]); 		
	end
endmodule
