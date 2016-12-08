
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
	else if (enb_block0 || enb_block1 || enb_block2) begin
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


	SDMA_System_Address_in,

	SDMA_System_Address_out,

	
	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;

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
	else if (enb_block0 || enb_block1 || enb_block2) begin
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
	else if (enb_block0 || enb_block1 || enb_block2) begin
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
	

	CommandArgument_in,

	CommandArgument_out,

	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock

input	[31:0] CommandArgument_in;

output	[31:0] CommandArgument_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;

	//INPUTS
	wire	[31:0] CommandArgument_in;

	//OUTPUTS
	wire	[31:0] CommandArgument_out;


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

module reg_00ch(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,


	MultiSingleBselect_in,
	DataTransferDirectionSelect_in,
	AutoCMD12enable_in,
	BlockCountenable_in,
	DMAenable_in,

	MultiSingleBselect_out,
	DataTransferDirectionSelect_out,
	AutoCMD12enable_out,
	BlockCountenable_out,
	DMAenable_out,

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

input MultiSingleBselect_in;
input DataTransferDirectionSelect_in;
input AutoCMD12enable_in;
input BlockCountenable_in;
input DMAenable_in;

output MultiSingleBselect_out;
output DataTransferDirectionSelect_out;
output AutoCMD12enable_out;
output BlockCountenable_out;
output DMAenable_out;


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
	wire MultiSingleBselect_in;
	wire DataTransferDirectionSelect_in;
	wire AutoCMD12enable_in;
	wire BlockCountenable_in;
	wire DMAenable_in;
	

	//OUTPUTS
	wire MultiSingleBselect_out;
	wire DataTransferDirectionSelect_out;
	wire AutoCMD12enable_out;
	wire BlockCountenable_out;
	wire DMAenable_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [15:6] = 0 ;		
	assign data_in [3] = 0 ;

	//INPUTS
	assign data_in [0] =	DMAenable_in;
	assign data_in [1] =	BlockCountenable_in;
	assign data_in [2] =	AutoCMD12enable_in;
	assign data_in [4] =	DataTransferDirectionSelect_in;
	assign data_in [5] =	MultiSingleBselect_in;
	

	//OUTPUTS
	assign	DMAenable_out	= data_out [0];
	assign	BlockCountenable_out	= data_out [1];
	assign	AutoCMD12enable_out	= data_out [2];
	assign	DataTransferDirectionSelect_out	= data_out [4];
	assign	MultiSingleBselect_out	= data_out [5];
	

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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


input	[5:0] CommandIndex_in;
input	[1:0] CommandType_in;
input	DataPresentState_in;
input	CommandIndezCheckEnable_in;		// DATA IN
input	CommandCRCCheckEnable_in;
input	[1:0] ResponseTypeSelect_in;

output	[5:0] CommandIndex_out;
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
	wire	[5:0] CommandIndex_in;
	wire	[1:0] CommandType_in;
	wire	DataPresentState_in;
	wire	CommandIndezCheckEnable_in;
	wire	CommandCRCCheckEnable_in;
	wire	[1:0] ResponseTypeSelect_in;

	//OUTPUTS
	wire	[5:0] CommandIndex_out;
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


module reg_020h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	BufferData_in,

	BufferData_out,
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

input   [31:0] BufferData_in;

output	[31:0] BufferData_out;

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
	wire	[31:0] BufferData_in;
	
	//OUTPUTS
	wire	[31:0] BufferData_out;
	
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED

	//INPUTS
	assign data_in = BufferData_in;


	//OUTPUTS
	assign	BufferData_out	= data_out ;

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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


//Present state
module reg_024h(
	clk,
	rst,
	

	CMDLineSignalLevel_in,
	DAT3LineSignalLevel_in,
	WriteProtectSwitchPinLevel,
	CardDetectPinLevel_in,
	CardStateStable_in,
	CardInserted_in,
	BufferReadEnable_in,
	BufferWriteEnable_in,
	ReadTransferActive_in,
	WriteTransferActive_in,
	DATlineActive_in,
	CommandInhibitdat_in,
	CommandInhibitcmd_in,
	
	CMDLineSignalLevel_out,
	DAT3LineSignalLevel_out,
	WriteProtectSwitchPinLevout,
	CardDetectPinLevel_out,
	CardStateStable_out,
	CardInserted_out,
	BufferReadEnable_out,
	BufferWriteEnable_out,
	ReadTransferActive_out,
	WriteTransferActive_out,
	DATlineActive_out,
	CommandInhibitdat_out,
	CommandInhibitcmd_out,
	
	);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock

input CMDLineSignalLevel_in;
input [3:0] DAT3LineSignalLevel_in;
input WriteProtectSwitchPinLevel;
input CardDetectPinLevel_in;
input CardStateStable_in;
input CardInserted_in;
input BufferReadEnable_in;
input BufferWriteEnable_in;
input ReadTransferActive_in;
input WriteTransferActive_in;
input DATlineActive_in;
input CommandInhibitdat_in;
input CommandInhibitcmd_in;
	
output CMDLineSignalLevel_out;
output [3:0] DAT3LineSignalLevel_out;
output WriteProtectSwitchPinLevout;
output CardDetectPinLevel_out;
output CardStateStable_out;
output CardInserted_out;
output BufferReadEnable_out;
output BufferWriteEnable_out;
output ReadTransferActive_out;
output WriteTransferActive_out;
output DATlineActive_out;
output CommandInhibitdat_out;
output CommandInhibitcmd_out;

//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;

	//INPUTS
	wire CMDLineSignalLevel_in;
	wire [3:0] DAT3LineSignalLevel_in;
	wire WriteProtectSwitchPinLevel;
	wire CardDetectPinLevel_in;
	wire CardStateStable_in;
	wire CardInserted_in;
	wire BufferReadEnable_in;
	wire BufferWriteEnable_in;
	wire ReadTransferActive_in;
	wire WriteTransferActive_in;
	wire DATlineActive_in;
	wire CommandInhibitdat_in;
	wire CommandInhibitcmd_in;

	//OUTPUTS
	wire CMDLineSignalLevel_out;
	wire [3:0] DAT3LineSignalLevel_out;
	wire WriteProtectSwitchPinLevout;
	wire CardDetectPinLevel_out;
	wire CardStateStable_out;
	wire CardInserted_out;
	wire BufferReadEnable_out;
	wire BufferWriteEnable_out;
	wire ReadTransferActive_out;
	wire WriteTransferActive_out;
	wire DATlineActive_out;
	wire CommandInhibitdat_out;
	wire CommandInhibitcmd_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [31:25] = 7'b00 ;		
	assign data_in [15:12] = 4'b00 ;
	assign data_in [7:3] = 5'b00 ;

	//INPUTS

	assign data_in [24] = CMDLineSignalLevel_in;
	assign data_in [23:20] = DAT3LineSignalLevel_in;
	assign data_in [19] = WriteProtectSwitchPinLevel;
	assign data_in [18] = CardDetectPinLevel_in;
	assign data_in [17] = CardStateStable_in;
	assign data_in [16] = CardInserted_in;
	assign data_in [11] = BufferReadEnable_in;
	assign data_in [10] = BufferWriteEnable_in;
	assign data_in [9] = ReadTransferActive_in;
	assign data_in [8] = WriteTransferActive_in;
	assign data_in [2] = DATlineActive_in;
	assign data_in [1] = CommandInhibitdat_in;
	assign data_in [0] = CommandInhibitcmd_in;

	//OUTPUTS
	assign  CMDLineSignalLevel_out = data_out [24];
	assign  DAT3LineSignalLevel_out = data_out [23:20];
	assign  WriteProtectSwitchPinLevout = data_out [19];
	assign  CardDetectPinLevel_out = data_out [18];
	assign  CardStateStable_out = data_out [17];
	assign  CardInserted_out = data_out [16];
	assign  BufferReadEnable_out = data_out [11];
	assign  BufferWriteEnable_out = data_out [10];
	assign  ReadTransferActive_out = data_out [9] ;
	assign  WriteTransferActive_out = data_out [8] ;
	assign  DATlineActive_out = data_out [2] ;
	assign  CommandInhibitdat_out = data_out [1] ;
	assign  CommandInhibitcmd_out = data_out [0] ;

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (1) begin
		data_out <= data_in;
	end
	else begin
		data_out <= data_out;
	end
end


//Bloque combinacional


endmodule





module reg_028h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	CardDetectSignalSelection_in,
	CardDetectTestLevel_in,
	ExtendDataTransferWidth_in,
	DMAselect_in,
	HighSpeedEnable_in,
	DataTransferWidth_in,
	LEDcontrol_in,
	
	CardDetectSignalSelection_out,
	CardDetectTestLevel_out,
	ExtendDataTransferWidth_out,
	DMAselect_out,
	HighSpeedEnable_out,
	DataTransferWidth_out,
	LEDcontrol_out
	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input 	CardDetectSignalSelection_in;
input 	CardDetectTestLevel_in;
input 	ExtendDataTransferWidth_in;
input 	[1:0] DMAselect_in;
input 	HighSpeedEnable_in;
input 	DataTransferWidth_in;
input 	LEDcontrol_in;


output 	CardDetectSignalSelection_out;
output 	CardDetectTestLevel_out;
output 	ExtendDataTransferWidth_out;
output 	[1:0] DMAselect_out;
output 	HighSpeedEnable_out;
output 	DataTransferWidth_out;
output 	LEDcontrol_out;

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
	wire 	CardDetectSignalSelection_in;
	wire 	CardDetectTestLevel_in;
	wire 	ExtendDataTransferWidth_in;
	wire 	[1:0] DMAselect_in;
	wire 	HighSpeedEnable_in;
	wire 	DataTransferWidth_in;
	wire 	LEDcontrol_in;

	//OUTPUTS
	wire 	CardDetectSignalSelection_out;
	wire 	CardDetectTestLevel_out;
	wire 	ExtendDataTransferWidth_out;
	wire 	[1:0] DMAselect_out;
	wire 	HighSpeedEnable_out;
	wire 	DataTransferWidth_out;
	wire 	LEDcontrol_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED


	//INPUTS
	assign data_in [7] = 	CardDetectSignalSelection_in;
	assign data_in [6] = 	CardDetectTestLevel_in;
	assign data_in [5] = 	ExtendDataTransferWidth_in;
	assign data_in [4:3] = 	DMAselect_in;
	assign data_in [2] = 	HighSpeedEnable_in;
	assign data_in [1] = 	DataTransferWidth_in;
	assign data_in [0] = 	LEDcontrol_in;

	//OUTPUTS
 	assign 	CardDetectSignalSelection_out = data_out[7];
	assign 	CardDetectTestLevel_out = data_out[6];
	assign 	ExtendDataTransferWidth_out = data_out[5];
	assign 	DMAselect_out = data_out[4:3];
	assign 	HighSpeedEnable_out = data_out[2];
	assign 	DataTransferWidth_out = data_out[1];
	assign 	LEDcontrol_out = data_out[0];


//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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

module reg_029h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	SDbusVoltageSelect_in,
	SDbusPower_in,
	SDbusVoltageSelect_out,
	SDbusPower_out
	
	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input 	SDbusPower_in;
input	[2:0] SDbusVoltageSelect_in;

output 	SDbusPower_out;
output	[2:0] SDbusVoltageSelect_out;


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
	wire 	SDbusPower_in;
	wire	[2:0] SDbusVoltageSelect_in;

	//OUTPUTS
	wire 	SDbusPower_out;
	wire	[2:0] SDbusVoltageSelect_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:4] = 0 ;		
	

	//INPUTS
	assign data_in [3:1] =	SDbusVoltageSelect_in;
	assign data_in [0] =	SDbusPower_in;

	//OUTPUTS
	assign	SDbusVoltageSelect_out	= data_out [3:1];
	assign	SDbusPower_out	= data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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



module reg_02ah(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	Interruptatblockgap_in,
	ReadWaitControl_in,
	ContinueRequest_in,
	StopatBlockGapRequest_in,

	Interruptatblockgap_out,
	ReadWaitControl_out,
	ContinueRequest_out,
	StopatBlockGapRequest_out,


	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input	Interruptatblockgap_in;
input	ReadWaitControl_in;
input	ContinueRequest_in;
input	StopatBlockGapRequest_in;

output	Interruptatblockgap_out;
output	ReadWaitControl_out;
output	ContinueRequest_out;			// DATA OUT
output	StopatBlockGapRequest_out;

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
	wire	Interruptatblockgap_in;
	wire	ReadWaitControl_in;
	wire	ContinueRequest_in;
	wire	StopatBlockGapRequest_in;

	//OUTPUTS
	wire	Interruptatblockgap_out;
	wire	ReadWaitControl_out;
	wire	ContinueRequest_out;			// DATA OUT
	wire	StopatBlockGapRequest_out;


//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:4] = 0 ;		

	//INPUTS
	assign data_in [3] =	Interruptatblockgap_in;
	assign data_in [2] =	ReadWaitControl_in;
	assign data_in [1] =	ContinueRequest_in;
	assign data_in [0] =	StopatBlockGapRequest_in;


	//OUTPUTS
	assign	Interruptatblockgap_out = data_out [3];
	assign	ReadWaitControl_out = data_out [2];
	assign	ContinueRequest_out= data_out [1];
	assign	StopatBlockGapRequest_out = data_out [0];
	
//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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




module reg_02Bh(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	WakeupEnbonCrdremoval_in,
	WakeupEnbonCrdinsertion_in,
	WakeupEnbonCrdinterrupt_in,

	WakeupEnbonCrdremoval_out,
	WakeupEnbonCrdinsertion_out,
	WakeupEnbonCrdinterrupt_out
	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input	WakeupEnbonCrdinterrupt_in;
input	WakeupEnbonCrdinsertion_in;
input	WakeupEnbonCrdremoval_in;

output	WakeupEnbonCrdinterrupt_out;
output	WakeupEnbonCrdinsertion_out;
output	WakeupEnbonCrdremoval_out;			// DATA OUT


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
	wire	WakeupEnbonCrdinterrupt_in;
	wire	WakeupEnbonCrdinsertion_in;
	wire	WakeupEnbonCrdremoval_in;

	//OUTPUTS
	wire	WakeupEnbonCrdinterrupt_out;
	wire	WakeupEnbonCrdinsertion_out;
	wire	WakeupEnbonCrdremoval_out;		

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:3] = 0 ;		

	//INPUTS
	assign data_in [2] =	WakeupEnbonCrdremoval_in;
	assign data_in [1] =	WakeupEnbonCrdinsertion_in;
	assign data_in [0] =	WakeupEnbonCrdinterrupt_in;


	//OUTPUTS
	assign	WakeupEnbonCrdremoval_out	= data_out [2];
	assign	WakeupEnbonCrdinsertion_out	= data_out [1];
	assign	WakeupEnbonCrdinterrupt_out	= data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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



module reg_02Ch(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,

	SDCLKfrqselect_in,
	SDCLKenable_in,
	InternalClockStable_in,
	InternalClockEnable_in,

	SDCLKfrqselect_out,
	SDCLKenable_out,
	InternalClockStable_out,
	InternalClockEnable_out,

	
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

input [6:0] SDCLKfrqselect_in;
input SDCLKenable_in;
input InternalClockStable_in;
input InternalClockEnable_in;

output [6:0] SDCLKfrqselect_out;
output SDCLKenable_out;
output InternalClockStable_out;
output InternalClockEnable_out;


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
	wire [6:0] SDCLKfrqselect_in;
	wire SDCLKenable_in;
	wire InternalClockStable_in;
	wire InternalClockEnable_in;

	//OUTPUTS
	wire [6:0] SDCLKfrqselect_out;
	wire SDCLKenable_out;
	wire InternalClockStable_out;
	wire InternalClockEnable_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:3] = 0 ;		


	//INPUTS
	assign data_in [15:8] =	SDCLKfrqselect_in;
	assign data_in [2] =	SDCLKenable_in;
	assign data_in [1] =	InternalClockStable_in;
	assign data_in [0] =	InternalClockEnable_in;

	//OUTPUTS
	assign	SDCLKfrqselect_out	= data_out [15:8];
	assign	SDCLKenable_out	= data_out [2];
	assign	InternalClockStable_out	= data_out [1];
	assign	InternalClockEnable_out	= data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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

module reg_02Eh(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,


	DataTimeoutCounterValue_in,
	DataTimeoutCounterValue_out
	
	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input	[3:0] DataTimeoutCounterValue_in;

output	[3:0] DataTimeoutCounterValue_out;

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
	wire	[3:0] DataTimeoutCounterValue_in;

	//OUTPUTS
	wire	[3:0] DataTimeoutCounterValue_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:4] = 0 ;

	//INPUTS
	assign data_in [3:0] =	DataTimeoutCounterValue_in;

	//OUTPUTS
	assign	DataTimeoutCounterValue_out	= data_out [3:0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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

module reg_02Fh(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,


	SoftwareResetDATline_in,
	SoftwareResetCMDline_in,
	SoftwareResetALLline_in,

	SoftwareResetDATline_out,
	SoftwareResetCMDline_out,
	SoftwareResetALLline_out
	
	);
//Parameters before
parameter width = 8;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;
input enb_block1;				// ENABLE BLOCKS
input enb_block2;
output 	ack;

input SoftwareResetDATline_in;
input SoftwareResetCMDline_in;
input SoftwareResetALLline_in;

output SoftwareResetDATline_out;
output SoftwareResetCMDline_out;
output SoftwareResetALLline_out;

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
	wire SoftwareResetDATline_in;
	wire SoftwareResetCMDline_in;
	wire SoftwareResetALLline_in;

	//OUTPUTS
	wire SoftwareResetDATline_out;
	wire SoftwareResetCMDline_out;
	wire SoftwareResetALLline_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [7:3] = 0 ;

	//INPUTS
	assign data_in [2] =	SoftwareResetDATline_in;
	assign data_in [1] =	SoftwareResetCMDline_in;
	assign data_in [0] =	SoftwareResetALLline_in;

	//OUTPUTS
	assign	SoftwareResetDATline_out	= data_out [2];
	assign	SoftwareResetCMDline_out	= data_out [1];
	assign	SoftwareResetALLline_out	= data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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


module reg_032h(
	clk,
	rst,

	VendorErr_in, 
	ADMAErr_in, 
	AutoCMD12Err_in, 
	CurrentLimitErr_in, 
	DataEndBitErr_in, 
	DataCRCErr_in, 
	DataTimeoutErr_in, 
	CommandIndexErr_in, 
	CommandEndBitErr_in, 
	CommandCRCErr_in, 
	CommandTimeoutErr_in, 

	VendorErr_out,
	ADMAErr_out,
	AutoCMD12Err_out,
	CurrentLimitErr_out,
	DataEndBitErr_out,
	DataCRCErr_out,
	DataTimeoutErr_out,
	CommandIndexErr_out,
	CommandEndBitErr_out,
	CommandCRCErr_out,
	CommandTimeoutErr_out
	
	);
//Parameters before
parameter width = 16;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock


input [3:0] VendorErr_in;
input ADMAErr_in;
input AutoCMD12Err_in;
input CurrentLimitErr_in;
input DataEndBitErr_in;
input DataCRCErr_in;
input DataTimeoutErr_in;
input CommandIndexErr_in;
input CommandEndBitErr_in;
input CommandCRCErr_in;
input CommandTimeoutErr_in;

output [3:0] VendorErr_out;
output ADMAErr_out;
output AutoCMD12Err_out;
output CurrentLimitErr_out;
output DataEndBitErr_out;
output DataCRCErr_out;
output DataTimeoutErr_out;
output CommandIndexErr_out;
output CommandEndBitErr_out;
output CommandCRCErr_out;
output CommandTimeoutErr_out;


//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;

	//INPUTS
	wire [3:0] VendorErr_in;
	wire ADMAErr_in;
	wire AutoCMD12Err_in;
	wire CurrentLimitErr_in;
	wire DataEndBitErr_in;
	wire DataCRCErr_in;
	wire DataTimeoutErr_in;
	wire CommandIndexErr_in;
	wire CommandEndBitErr_in;
	wire CommandCRCErr_in;
	wire CommandTimeoutErr_in;

	//OUTPUTS
	wire [3:0] VendorErr_out;
	wire ADMAErr_out;
	wire AutoCMD12Err_out;
	wire CurrentLimitErr_out;
	wire DataEndBitErr_out;
	wire DataCRCErr_out;
	wire DataTimeoutErr_out;
	wire CommandIndexErr_out;
	wire CommandEndBitErr_out;
	wire CommandCRCErr_out;
	wire CommandTimeoutErr_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [11:10] = 0 ;

	//INPUTS
	assign data_in [15:12] = VendorErr_in;
	assign data_in [9] = ADMAErr_in;
	assign data_in [8] = AutoCMD12Err_in;
	assign data_in [7] = CurrentLimitErr_in;
	assign data_in [6] = DataEndBitErr_in;
	assign data_in [5] = DataCRCErr_in;
	assign data_in [4] = DataTimeoutErr_in;
	assign data_in [3] = CommandIndexErr_in;
	assign data_in [2] = CommandEndBitErr_in;
	assign data_in [1] = CommandCRCErr_in;
	assign data_in [0] = CommandTimeoutErr_in;


	//OUTPUTS
	assign VendorErr_out = data_out [15:12];
	assign ADMAErr_out = data_out [9];
	assign AutoCMD12Err_out = data_out [8];
	assign CurrentLimitErr_out = data_out [7];
	assign DataEndBitErr_out = data_out [6];
	assign DataCRCErr_out = data_out [5];
	assign DataTimeoutErr_out = data_out [4];
	assign CommandIndexErr_out = data_out [3];
	assign CommandEndBitErr_out = data_out [2];
	assign CommandCRCErr_out = data_out [1];
	assign CommandTimeoutErr_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (1) begin
		data_out <= data_in;
	end
	else begin
		data_out <= data_out;
	end
end


//Bloque combinacional


endmodule


module reg_034h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,



	CardInterruptStatus_in,
	CardRemovalStatus_in,
	CardInsertionStatus_in,
	BuffReadReadyStatus_in,
	BuffWriteReadyStatus_in,
	DMAInterruptStatus_in,
	BlockGapEventStatus_in,
	TransferCompleteStatus_in,
	CommandCompleteStatus_in,


	CardInterruptStatus_out,
	CardRemovalStatus_out,
	CardInsertionStatus_out,
	BuffReadReadyStatus_out,
	BuffWriteReadyStatus_out,
	DMAInterruptStatus_out,
	BlockGapEventStatus_out,
	TransferCompleteStatus_out,
	CommandCompleteStatus_out
	
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


input CardInterruptStatus_in;
input CardRemovalStatus_in;
input CardInsertionStatus_in;
input BuffReadReadyStatus_in;
input BuffWriteReadyStatus_in;
input DMAInterruptStatus_in;
input BlockGapEventStatus_in;
input TransferCompleteStatus_in;
input CommandCompleteStatus_in;


output CardInterruptStatus_out;
output CardRemovalStatus_out;
output CardInsertionStatus_out;
output BuffReadReadyStatus_out;
output BuffWriteReadyStatus_out;
output DMAInterruptStatus_out;
output BlockGapEventStatus_out;
output TransferCompleteStatus_out;
output CommandCompleteStatus_out;


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
	
	wire CardInterruptStatus_in;
	wire CardRemovalStatus_in;
	wire CardInsertionStatus_in;
	wire BuffReadReadyStatus_in;
	wire BuffWriteReadyStatus_in;
	wire DMAInterruptStatus_in;
	wire BlockGapEventStatus_in;
	wire TransferCompleteStatus_in;
	wire CommandCompleteStatus_in;

	//OUTPUTS
	
	wire CardInterruptStatus_out;
	wire CardRemovalStatus_out;
	wire CardInsertionStatus_out;
	wire BuffReadReadyStatus_out;
	wire BuffWriteReadyStatus_out;
	wire DMAInterruptStatus_out;
	wire BlockGapEventStatus_out;
	wire TransferCompleteStatus_out;
	wire CommandCompleteStatus_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [14:9] = 0 ;

	//INPUTS
	assign data_in [15] = 0;
	assign data_in [8] = CardInterruptStatus_in;
	assign data_in [7] = CardRemovalStatus_in;
	assign data_in [6] = CardInsertionStatus_in;
	assign data_in [5] = BuffReadReadyStatus_in;
	assign data_in [4] = BuffWriteReadyStatus_in;
	assign data_in [3] = DMAInterruptStatus_in;
	assign data_in [2] = BlockGapEventStatus_in;
	assign data_in [1] = TransferCompleteStatus_in;
	assign data_in [0] = CommandCompleteStatus_in;


	//OUTPUTS
	
	assign CardInterruptStatus_out = data_out [8];
	assign CardRemovalStatus_out = data_out [7];
	assign CardInsertionStatus_out = data_out [6];
	assign BuffReadReadyStatus_out = data_out [5];
	assign BuffWriteReadyStatus_out = data_out [4];
	assign DMAInterruptStatus_out = data_out [3];
	assign BlockGapEventStatus_out = data_out [2];
	assign TransferCompleteStatus_out = data_out [1];
	assign CommandCompleteStatus_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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



//STATUS REGISTER
module reg_036h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,


	VendorErrStatus_in,
	ADMAErrStatus_in,
	AutoCMD12ErrStatus_in,
	CurrentLimitErrStatus_in,
	DataEndBitErrStatus_in,
	DataCRCErrStatus_in,
	DataTimeoutErrStatus_in,
	CommandIndexErrStatus_in,
	CommandEndBitErrStatus_in,
	CommandCRCErrStatus_in,
	CommandTimeoutErrStatus_in,

	VendorErrStatus_out,
	ADMAErrStatus_out,
	AutoCMD12ErrStatus_out,
	CurrentLimitErrStatus_out,
	DataEndBitErrStatus_out,
	DataCRCErrStatus_out,
	DataTimeoutErrStatus_out,
	CommandIndexErrStatus_out,
	CommandEndBitErrStatus_out,
	CommandCRCErrStatus_out,
	CommandTimeoutErrStatus_out
	
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

input [3:0] VendorErrStatus_in;
input ADMAErrStatus_in;
input AutoCMD12ErrStatus_in;
input CurrentLimitErrStatus_in;
input DataEndBitErrStatus_in;
input DataCRCErrStatus_in;
input DataTimeoutErrStatus_in;
input CommandIndexErrStatus_in;
input CommandEndBitErrStatus_in;
input CommandCRCErrStatus_in;
input CommandTimeoutErrStatus_in;

output [3:0] VendorErrStatus_out;
output ADMAErrStatus_out;
output AutoCMD12ErrStatus_out;
output CurrentLimitErrStatus_out;
output DataEndBitErrStatus_out;
output DataCRCErrStatus_out;
output DataTimeoutErrStatus_out;
output CommandIndexErrStatus_out;
output CommandEndBitErrStatus_out;
output CommandCRCErrStatus_out;
output CommandTimeoutErrStatus_out;


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
	wire [3:0] VendorErrStatus_in;
	wire ADMAErrStatus_in;
	wire AutoCMD12ErrStatus_in;
	wire CurrentLimitErrStatus_in;
	wire DataEndBitErrStatus_in;
	wire DataCRCErrStatus_in;
	wire DataTimeoutErrStatus_in;
	wire CommandIndexErrStatus_in;
	wire CommandEndBitErrStatus_in;
	wire CommandCRCErrStatus_in;
	wire CommandTimeoutErrStatus_in;

	//OUTPUTS
	wire [3:0] VendorErrStatus_out;
	wire ADMAErrStatus_out;
	wire AutoCMD12ErrStatus_out;
	wire CurrentLimitErrStatus_out;
	wire DataEndBitErrStatus_out;
	wire DataCRCErrStatus_out;
	wire DataTimeoutErrStatus_out;
	wire CommandIndexErrStatus_out;
	wire CommandEndBitErrStatus_out;
	wire CommandCRCErrStatus_out;
	wire CommandTimeoutErrStatus_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [11:10] = 0 ;

	//INPUTS
	assign data_in [15:12] = VendorErrStatus_in;
	assign data_in [9] = ADMAErrStatus_in;
	assign data_in [8] = AutoCMD12ErrStatus_in;
	assign data_in [7] = CurrentLimitErrStatus_in;
	assign data_in [6] = DataEndBitErrStatus_in;
	assign data_in [5] = DataCRCErrStatus_in;
	assign data_in [4] = DataTimeoutErrStatus_in;
	assign data_in [3] = CommandIndexErrStatus_in;
	assign data_in [2] = CommandEndBitErrStatus_in;
	assign data_in [1] = CommandCRCErrStatus_in;
	assign data_in [0] = CommandTimeoutErrStatus_in;


	//OUTPUTS
	assign VendorErrStatus_out = data_out [15:12];
	assign ADMAErrStatus_out = data_out [9];
	assign AutoCMD12ErrStatus_out = data_out [8];
	assign CurrentLimitErrStatus_out = data_out [7];
	assign DataEndBitErrStatus_out = data_out [6];
	assign DataCRCErrStatus_out = data_out [5];
	assign DataTimeoutErrStatus_out = data_out [4];
	assign CommandIndexErrStatus_out = data_out [3];
	assign CommandEndBitErrStatus_out = data_out [2];
	assign CommandCRCErrStatus_out = data_out [1];
	assign CommandTimeoutErrStatus_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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


module reg_038h(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,



	CardInterruptSignal_in,
	CardRemovalSignal_in,
	CardInsertionSignal_in,
	BuffReadReadySignal_in,
	BuffWriteReadySignal_in,
	DMAInterruptSignal_in,
	BlockGapEventSignal_in,
	TransferCompleteSignal_in,
	CommandCompleteSignal_in,


	CardInterruptSignal_out,
	CardRemovalSignal_out,
	CardInsertionSignal_out,
	BuffReadReadySignal_out,
	BuffWriteReadySignal_out,
	DMAInterruptSignal_out,
	BlockGapEventSignal_out,
	TransferCompleteSignal_out,
	CommandCompleteSignal_out
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


input CardInterruptSignal_in;
input CardRemovalSignal_in;
input CardInsertionSignal_in;
input BuffReadReadySignal_in;
input BuffWriteReadySignal_in;
input DMAInterruptSignal_in;
input BlockGapEventSignal_in;
input TransferCompleteSignal_in;
input CommandCompleteSignal_in;


output CardInterruptSignal_out;
output CardRemovalSignal_out;
output CardInsertionSignal_out;
output BuffReadReadySignal_out;
output BuffWriteReadySignal_out;
output DMAInterruptSignal_out;
output BlockGapEventSignal_out;
output TransferCompleteSignal_out;
output CommandCompleteSignal_out;


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
	
	wire CardInterruptSignal_in;
	wire CardRemovalSignal_in;
	wire CardInsertionSignal_in;
	wire BuffReadReadySignal_in;
	wire BuffWriteReadySignal_in;
	wire DMAInterruptSignal_in;
	wire BlockGapEventSignal_in;
	wire TransferCompleteSignal_in;
	wire CommandCompleteSignal_in;

	//OUTPUTS
	
	wire CardInterruptSignal_out;
	wire CardRemovalSignal_out;
	wire CardInsertionSignal_out;
	wire BuffReadReadySignal_out;
	wire BuffWriteReadySignal_out;
	wire DMAInterruptSignal_out;
	wire BlockGapEventSignal_out;
	wire TransferCompleteSignal_out;
	wire CommandCompleteSignal_out;

//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [15:9] = 0 ;

	//INPUTS
	assign data_in [15] = 0;
	assign data_in [8] = CardInterruptSignal_in;
	assign data_in [7] = CardRemovalSignal_in;
	assign data_in [6] = CardInsertionSignal_in;
	assign data_in [5] = BuffReadReadySignal_in;
	assign data_in [4] = BuffWriteReadySignal_in;
	assign data_in [3] = DMAInterruptSignal_in;
	assign data_in [2] = BlockGapEventSignal_in;
	assign data_in [1] = TransferCompleteSignal_in;
	assign data_in [0] = CommandCompleteSignal_in;


	//OUTPUTS
	
	assign CardInterruptSignal_out = data_out [8];
	assign CardRemovalSignal_out = data_out [7];
	assign CardInsertionSignal_out = data_out [6];
	assign BuffReadReadySignal_out = data_out [5];
	assign BuffWriteReadySignal_out = data_out [4];
	assign DMAInterruptSignal_out = data_out [3];
	assign BlockGapEventSignal_out = data_out [2];
	assign TransferCompleteSignal_out = data_out [1];
	assign CommandCompleteSignal_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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



//STATUS REGISTER
module reg_03Ah(
	clk,
	rst,
	
	ack,
	enb_block0,
	enb_block1,
	enb_block2,


	VendorErrSignal_in,
	ADMAErrSignal_in,
	AutoCMD12ErrSignal_in,
	CurrentLimitErrSignal_in,
	DataEndBitErrSignal_in,
	DataCRCErrSignal_in,
	DataTimeoutErrSignal_in,
	CommandIndexErrSignal_in,
	CommandEndBitErrSignal_in,
	CommandCRCErrSignal_in,
	CommandTimeoutErrSignal_in,

	VendorErrSignal_out,
	ADMAErrSignal_out,
	AutoCMD12ErrSignal_out,
	CurrentLimitErrSignal_out,
	DataEndBitErrSignal_out,
	DataCRCErrSignal_out,
	DataTimeoutErrSignal_out,
	CommandIndexErrSignal_out,
	CommandEndBitErrSignal_out,
	CommandCRCErrSignal_out,
	CommandTimeoutErrSignal_out
	
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

input [3:0] VendorErrSignal_in;
input ADMAErrSignal_in;
input AutoCMD12ErrSignal_in;
input CurrentLimitErrSignal_in;
input DataEndBitErrSignal_in;
input DataCRCErrSignal_in;
input DataTimeoutErrSignal_in;
input CommandIndexErrSignal_in;
input CommandEndBitErrSignal_in;
input CommandCRCErrSignal_in;
input CommandTimeoutErrSignal_in;

output [3:0] VendorErrSignal_out;
output ADMAErrSignal_out;
output AutoCMD12ErrSignal_out;
output CurrentLimitErrSignal_out;
output DataEndBitErrSignal_out;
output DataCRCErrSignal_out;
output DataTimeoutErrSignal_out;
output CommandIndexErrSignal_out;
output CommandEndBitErrSignal_out;
output CommandCRCErrSignal_out;
output CommandTimeoutErrSignal_out;


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
	wire [3:0] VendorErrSignal_in;
	wire ADMAErrSignal_in;
	wire AutoCMD12ErrSignal_in;
	wire CurrentLimitErrSignal_in;
	wire DataEndBitErrSignal_in;
	wire DataCRCErrSignal_in;
	wire DataTimeoutErrSignal_in;
	wire CommandIndexErrSignal_in;
	wire CommandEndBitErrSignal_in;
	wire CommandCRCErrSignal_in;
	wire CommandTimeoutErrSignal_in;

	//OUTPUTS
	wire [3:0] VendorErrSignal_out;
	wire ADMAErrSignal_out;
	wire AutoCMD12ErrSignal_out;
	wire CurrentLimitErrSignal_out;
	wire DataEndBitErrSignal_out;
	wire DataCRCErrSignal_out;
	wire DataTimeoutErrSignal_out;
	wire CommandIndexErrSignal_out;
	wire CommandEndBitErrSignal_out;
	wire CommandCRCErrSignal_out;
	wire CommandTimeoutErrSignal_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [11:10] = 0 ;

	//INPUTS
	assign data_in [15:12] = VendorErrSignal_in;
	assign data_in [9] = ADMAErrSignal_in;
	assign data_in [8] = AutoCMD12ErrSignal_in;
	assign data_in [7] = CurrentLimitErrSignal_in;
	assign data_in [6] = DataEndBitErrSignal_in;
	assign data_in [5] = DataCRCErrSignal_in;
	assign data_in [4] = DataTimeoutErrSignal_in;
	assign data_in [3] = CommandIndexErrSignal_in;
	assign data_in [2] = CommandEndBitErrSignal_in;
	assign data_in [1] = CommandCRCErrSignal_in;
	assign data_in [0] = CommandTimeoutErrSignal_in;


	//OUTPUTS
	assign VendorErrSignal_out = data_out [15:12];
	assign ADMAErrSignal_out = data_out [9];
	assign AutoCMD12ErrSignal_out = data_out [8];
	assign CurrentLimitErrSignal_out = data_out [7];
	assign DataEndBitErrSignal_out = data_out [6];
	assign DataCRCErrSignal_out = data_out [5];
	assign DataTimeoutErrSignal_out = data_out [4];
	assign CommandIndexErrSignal_out = data_out [3];
	assign CommandEndBitErrSignal_out = data_out [2];
	assign CommandCRCErrSignal_out = data_out [1];
	assign CommandTimeoutErrSignal_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 || enb_block1 || enb_block2) begin
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





module reg_058h(
	clk,
	rst,
	
	ack,
	enb_block0,



	AdmaSystemAddress_in,

	AdmaSystemAddress_out

	
	);
//Parameters before
parameter width = 64;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock
input enb_block0;

output 	ack;

input AdmaSystemAddress_in;

output AdmaSystemAddress_out;


//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;
	wire enb_block0;

	reg ack;
	//INPUTS
	wire AdmaSystemAddress_in;

	//OUTPUTS
	wire AdmaSystemAddress_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED


	//INPUTS
	assign data_in = AdmaSystemAddress_in;

	//OUTPUTS
	assign AdmaSystemAddress_out = data_out;


//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 64'b0;
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