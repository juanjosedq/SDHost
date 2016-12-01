
module reg_template(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	CommandIndex_in,
	CommandType_in,
	DataPresentState_in,
	CommandIndezCheckEnable_in,
	CommandCRCCheckEnable_in,
	ResponseTypeSelect_in,

	CommandIndex_out,
	CommandType_out,
	DataPresentState_out,
	CommandIndezCheckEnable_out,
	CommandCRCCheckEnable_out,
	ResponseTypeSelect_out,
	
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

input	[4:0] CommandIndex_in;
input	[1:0] CommandType_in;
input	DataPresentState_in;
input	CommandIndezCheckEnable_in;		// DATA IN
input	CommandCRCCheckEnable_in;
input	[1:0] ResponseTypeSelect_in;

output	[4:0] CommandIndex_out;
output	[1:0] CommandType_out;
output	DataPresentState_out;			// DATA OUT
output	CommandIndezCheckEnable_out;
output	CommandCRCCheckEnable_out;
output	[1:0] ResponseTypeSelect_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;
	wire enb_block1;
	wire enb_block2;
	reg ack;
	//INPUTS
	wire	[4:0] CommandIndex_in;
	wire	[1:0] CommandType_in;
	wire	DataPresentState_in;
	wire	CommandIndezCheckEnable_in;
	wire	CommandCRCCheckEnable_in;
	wire	[1:0] ResponseTypeSelect_in;

	//OUTPUTS
	wire	[4:0] CommandIndex_out;
	wire	[1:0] CommandType_out;
	wire	DataPresentState_out;
	wire	CommandIndezCheckEnable_out;
	wire	CommandCRCCheckEnable_out;
	wire	[1:0] ResponseTypeSelect_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [15:14] = 2'b00 ;		
	assign data_in [2] = 2'b00 ;

	//INPUTS
	assign data_in [13:8] =	CommandIndex_in;
	assign data_in [7:6] =	CommandType_in;
	assign data_in [5] =	DataPresentState_in;
	assign data_in [4] =	CommandIndezCheckEnable_in;
	assign data_in [3] =	CommandCRCCheckEnable_in;
	assign data_in [1:0] =	ResponseTypeSelect_in;

	//OUTPUTS
	assign	CommandIndex_out	= data_out [13:8];
	assign	CommandType_out	= data_out [7:6];
	assign	DataPresentState_out	= data_out [5];
	assign	CommandIndezCheckEnable_out	= data_out [4];
	assign	CommandCRCCheckEnable_out	= data_out [3];
	assign	ResponseTypeSelect_out	= data_out [1:0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 ^ enb_block1 ^ enb_block2) begin
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


module reg_000h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	SDMA_System_Address_in,

	SDMA_System_Address_out,

	
	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input	[31:0] SDMA_System_Address_in;

output	[31:0] SDMA_System_Address_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;
	wire enb_block1;
	wire enb_block2;
	reg ack;
	//INPUTS
	wire	[31:0] SDMA_System_Address_in;

	//OUTPUTS
	wire	[31:0] SDMA_System_Address_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED


	//INPUTS
	assign data_in = SDMA_System_Address_in;

	//OUTPUTS
	assign	SDMA_System_Address_out	= data_out;

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 ^ enb_block1 ^ enb_block2) begin
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


module reg_004h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	HostSDMABufferBoundry_in,
	TransferBlockSize_in,

	HostSDMABufferBoundry_out,
	TransferBlockSize_out,
	
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

input	[11:0] TransferBlockSize_in;
input	[2:0] HostSDMABufferBoundry_in;

output	[11:0] TransferBlockSize_out;
output	[2:0] HostSDMABufferBoundry_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;
	wire enb_block1;
	wire enb_block2;
	reg ack;
	//INPUTS
	wire	[11:0] TransferBlockSize_in;
	wire	[2:0] HostSDMABufferBoundry_in;

	//OUTPUTS
	wire	[11:0] TransferBlockSize_out;
	wire	[2:0] HostSDMABufferBoundry_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [15] = 1'b0 ;

	//INPUTS
	assign data_in [11:0] =	TransferBlockSize_in;
	assign data_in [14:12] = HostSDMABufferBoundry_in;
	
	//OUTPUTS
	assign	TransferBlockSize_out	= data_out [11:0];
	assign	HostSDMABufferBoundry_out	= data_out [14:12];
	
//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 16'b0;
	end
	else if (enb_block0 ^ enb_block1 ^ enb_block2) begin
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


module reg_006h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	BlockCount4CurrentTrans_in,

	BlockCount4CurrentTrans_out,

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

input	[15:0] BlockCount4CurrentTrans_in;

output	[15:0] BlockCount4CurrentTrans_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;
	wire enb_block1;
	wire enb_block2;
	reg ack;
	//INPUTS
	wire	[15:0] BlockCount4CurrentTrans_in;

	//OUTPUTS
	wire	[15:0] BlockCount4CurrentTrans_out;


//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED

	//INPUTS
	assign data_in  =	BlockCount4CurrentTrans_in;
	
	//OUTPUTS
	assign	BlockCount4CurrentTrans_out	= data_out;
	
//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 16'b0;
	end
	else if (enb_block0 ^ enb_block1 ^ enb_block2) begin
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


module reg_008h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	CommandArgument_in,

	CommandArgument_out,

	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input	[32:0] CommandArgument_in;

output	[32:0] CommandArgument_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;
	wire enb_block1;
	wire enb_block2;
	reg ack;
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
	else if (enb_block0 ^ enb_block1 ^ enb_block2) begin
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