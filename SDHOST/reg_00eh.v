module reg_00eh(
	clk,
	rst,
	


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
	assign data_in [15:14] = 0 ;		
	assign data_in [2] = 0 ;

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
		data_out <= 16'b0;
	end
	else begin
		data_out <= data_in;
	end

end


//Bloque combinacional


endmodule
