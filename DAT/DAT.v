module DAT (buffer_in, reg_vector, card_out, clk, pop, push);

parameter vector_width = 10;			//reg_vector has inputs with information coming from registers
input wire [31:0] buffer_in;
input wire [vector_width - 1 :0] reg_vector;	//there will be a specific index for reach element of the array
output wire [3:0] card_out;			//in reg_vector, set with parameters with a +20 offset
input wire pop, clk;				//as parameters below 20 will be set for states 
output reg push;
reg state [3:0]= 0;


//States declaration:

parameter reset = 0;
parameter idle = 1;
parameter fifo_check = 2;
parameter trans = 3;		//send or recieve state
parameter trans_ready = 4;	//transference acknolgedge state

//reg_vector index parameters: (real index will be "parameter" - 20)

parameter send

parameter 
always @ (posedge clk)
	begin 
		case (state)
			reset:
				begin
					state = idle;
				end
			idle:
				begin
					state = fifo_check;
				end
			fifo_check:
				begin
					state = trans;
				end
			trans:
				begin
					state = trans_ready;
				end
			trans_ready:
				begin
					if(reset) begin
						state = reset;
					end else begin
						state = trans_ready;
					end
				end	
		endcase	
	end
	
	if (state == trans) begin
			
	end
endmodule
