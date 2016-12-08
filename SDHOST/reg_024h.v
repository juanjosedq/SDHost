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


