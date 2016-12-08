module reg_008h(
	clk,
	rst,
	

	CommandArgument_in,

	CommandArgument_out,

	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock

input	[32:0] CommandArgument_in;

output	[32:0] CommandArgument_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;

	//INPUTS
	wire	[32:0] CommandArgument_in;

	//OUTPUTS
	wire	[32:0] CommandArgument_out;


//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED

	//INPUTS
	assign data_in  =	CommandArgument_in;
	
	//OUTPUTS
	assign	CommandArgument_out	= data_out;
	
//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else begin
		data_out <= data_in;
	end

end




endmodule
