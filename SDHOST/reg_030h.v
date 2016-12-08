module reg_030h(
	clk,
	rst,
	
	ack,
	enb_block0,


	ErrInterrupt_in,
	CardInterrupt_in,
	CardRemoval_in,
	CardInsertion_in,
	BuffReadReady_in,
	BuffWriteReady_in,
	DMAInterrupt_in,
	BlockGapEvent_in,
	TransferComplete_in,
	CommandComplete_in,

	ErrInterrupt_out,
	CardInterrupt_out,
	CardRemoval_out,
	CardInsertion_out,
	BuffReadReady_out,
	BuffWriteReady_out,
	DMAInterrupt_out,
	BlockGapEvent_out,
	TransferComplete_out,
	CommandComplete_out
	
	);
//Parameters before
parameter width = 16;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input ErrInterrupt_in;
input CardInterrupt_in;
input CardRemoval_in;
input CardInsertion_in;
input BuffReadReady_in;
input BuffWriteReady_in;
input DMAInterrupt_in;
input BlockGapEvent_in;
input TransferComplete_in;
input CommandComplete_in;

output ErrInterrupt_out;
output CardInterrupt_out;
output CardRemoval_out;
output CardInsertion_out;
output BuffReadReady_out;
output BuffWriteReady_out;
output DMAInterrupt_out;
output BlockGapEvent_out;
output TransferComplete_out;
output CommandComplete_out;


//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;

	reg ack;
	//INPUTS
	wire ErrInterrupt_in;
	wire CardInterrupt_in;
	wire CardRemoval_in;
	wire CardInsertion_in;
	wire BuffReadReady_in;
	wire BuffWriteReady_in;
	wire DMAInterrupt_in;
	wire BlockGapEvent_in;
	wire TransferComplete_in;
	wire CommandComplete_in;

	//OUTPUTS
	wire ErrInterrupt_out;
	wire CardInterrupt_out;
	wire CardRemoval_out;
	wire CardInsertion_out;
	wire BuffReadReady_out;
	wire BuffWriteReady_out;
	wire DMAInterrupt_out;
	wire BlockGapEvent_out;
	wire TransferComplete_out;
	wire CommandComplete_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [14:9] = 0 ;

	//INPUTS
	assign data_in [15] = ErrInterrupt_in;
	assign data_in [8] = CardInterrupt_in;
	assign data_in [7] = CardRemoval_in;
	assign data_in [6] = CardInsertion_in;
	assign data_in [5] = BuffReadReady_in;
	assign data_in [4] = BuffWriteReady_in;
	assign data_in [3] = DMAInterrupt_in;
	assign data_in [2] = BlockGapEvent_in;
	assign data_in [1] = TransferComplete_in;
	assign data_in [0] = CommandComplete_in;


	//OUTPUTS
	assign ErrInterrupt_out = data_out [15];
	assign CardInterrupt_out = data_out [8];
	assign CardRemoval_out = data_out [7];
	assign CardInsertion_out = data_out [6];
	assign BuffReadReady_out = data_out [5];
	assign BuffWriteReady_out = data_out [4];
	assign DMAInterrupt_out = data_out [3];
	assign BlockGapEvent_out = data_out [2];
	assign TransferComplete_out = data_out [1];
	assign CommandComplete_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 ) begin
		data_out <= data_in;
	end
	else begin
		data_out <= data_out;
	end
end


//Bloque combinacional
always @(*) begin
	if (data_in == data_out) begin
		ack = 1'b1;		
	end
	else begin
		ack = 1'b0;
	end
end

endmodule
