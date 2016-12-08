module reg_010h(
	clk,
	rst,
	
	ack,
	enb_block0,

	Response_in,

	Response_out,

	);
//Parameters before
parameter width = 128;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;

output 	ack;

input	[127:0] Response_in;

output	[127:0] Response_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;

	reg ack;
	//INPUTS
	wire	[127:0] Response_in;

	//OUTPUTS
	wire	[127:0] Response_out;


//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED


	//INPUTS
	assign data_in = Response_in;
	
	//OUTPUTS
	assign	Response_out = data_out [127:0];
	
//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 128'b0;
	end
	else if (enb_block0) begin
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