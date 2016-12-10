module asynchronous_fifo
        //Reading port
	(output reg  [DATA_WIDTH-1:0]       Data_out, 
	output reg                          Empty_out, //almost empty signal
	input wire                          ReadEn_in,
	input wire                          RClk,        
	//Writing port.	 
	input wire  [DATA_WIDTH-1:0]        Data_in,  
	output reg                          Full_out, //almost full signal
	input wire                          WriteEn_in,
	input wire                          WClk,
	output reg			    ack_write); // FIXME falta definir esta bandera 
	parameter    DATA_WIDTH    = 32;
        parameter    FIFO_length = 1024;

	//states	
	parameter reset = 0;
	parameter idle = 4'b0001;
	parameter info_onFIFO = 4'b0010;
	parameter write_state = 4'b0100;
	parameter read_state = 4'b1000;

	reg [3:0]state = 0;
	wire [39:0] cuarenta_bits;
	reg [FIFO_length -1: 0] buffer;
	assign cuarenta_bits = buffer[39:0];
	reg [10:0] count = 0;

	always@ (posedge WClk) begin
		case (state) 
			default:
				begin
					state <= idle;
					Data_out <= 0;
					count <= 0;
					buffer <= 0;
				end	
				
			reset:
				begin
					state <= idle;
					Data_out <= 0;
					count <= 0;
					buffer <= 0;
				end	
			idle:	
				begin
					if (WriteEn_in) begin
						state <= write_state;
					end else begin
						state <= idle;
					end
				end
			write_state:
				begin 
					count <= count + DATA_WIDTH;
					buffer <= {buffer[FIFO_length - DATA_WIDTH - 1: 0], Data_in};
					if(!WriteEn_in || Full_out) begin
						state <= idle;					
					end else begin
						state <= write_state;
 		
					end
				end	
		endcase
	end

	always@ (posedge RClk) begin
		if(ReadEn_in && !Empty_out) begin
			Data_out <= buffer[count - 1 -: DATA_WIDTH];
		end
	end

	always@ (negedge RClk) begin
		if(ReadEn_in && !Empty_out) begin	
			count <= count - DATA_WIDTH;	
		end
	end

	always@(*) begin
		//Full signal generation
		if(count == FIFO_length - DATA_WIDTH) begin
			Full_out = 1;		
		end else begin
			Full_out = 0;
		end
		
		//Empty signal generation
		if((count == DATA_WIDTH) || (count == 0)) begin
			Empty_out = 1;		
		end else begin
			Empty_out = 0;
		end
		
	end

endmodule
