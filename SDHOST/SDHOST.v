`include "CMD.v"
`include "regs.v"


module SDHOST(clock, sd_clock, reset, cmd_pin_in, cmd_pin_out, R024h_CPU, R024h_CPU_out, R00eh_CPU, R00eh_CPU_out, R008h_CPU, R008h_CPU_out, R032h_CPU, R032h_CPU_out);
	
	input 		clock;
	input 		reset;
	input		sd_clock;
	input		cmd_pin_in;

	output		cmd_pin_out;
	input [31:0]    R024h_CPU;
	input [15:0]    R00eh_CPU;
	input [31:0]    R008h_CPU;
	input [15:0]    R032h_CPU;

	output [127:0] response_outReg;

	output [31:0] 	 R024h_CPU_out;
	output [15:0]    R00eh_CPU_out;
	output [31:0]    R008h_CPU_out;
	output [15:0]    R032h_CPU_out;

	wire  		clock;
	wire		reset;

	wire		sd_clock;
	wire		cmd_pin_in;
	wire		cmd_pin_out;

	wire [127:0] 	response_outReg;

	wire command_complete;
	wire [127:0]	response_outCMD;
	wire		enable_response;
	wire		ack_response;

	wire		enable_command_complete;
	wire		ack_command_complete;

	wire [31:0]	R024h_CPU;
	wire [31:0] R024h_CPU_out;


	wire [15:0]	R00eh_CPU;
	wire [15:0] R00eh_CPU_out;

	wire [31:0]	R008h_CPU;
	wire [31:0] R008h_CPU_out;

	wire [15:0]	R032h_CPU;
	wire [15:0] R032h_CPU_out;

	wire [15:0]	R030h_CPU;
	wire [15:0] R030h_CPU_out;






	CMD CMD1 (		.new_command(R024h_CPU_out[0]),
					.cmd_argument(R008h_CPU_out),
					.cmd_index(R00eh_CPU_out [13:8]),
					.timeout_enable(R032h_CPU_out [0]),
					.command_complete(command_complete),
					.cmd_pin_in(cmd_pin_in),
					.cmd_pin_out(cmd_pin_out),
					.sd_clock(sd_clock),
					.clock(clock),
					.reset(reset),
					.response(response_outCMD),
					.enable_response(enable_response),
					.ack_response(ack_response),
					.enable_command_complete(enable_command_complete),
					.ack_command_complete(ack_command_complete)
					);
 
	reg_00eh R00eh (.clk(clock),
					.rst(reset),

					.CommandIndex_in(R00eh_CPU [13:8]),
					.CommandType_in(R00eh_CPU [7:6]),
					.DataPresentState_in(R00eh_CPU [5]),
					.CommandIndezCheckEnable_in(R00eh_CPU [4]),
					.CommandCRCCheckEnable_in(R00eh_CPU [3]),
					.ResponseTypeSelect_in(R00eh_CPU [1:0]),

					.CommandIndex_out(R00eh_CPU_out [13:8]),
					.CommandType_out(R00eh_CPU_out [7:6]),
					.DataPresentState_out(R00eh_CPU_out [5]),
					.CommandIndezCheckEnable_out(R00eh_CPU_out [4]),
					.CommandCRCCheckEnable_out(R00eh_CPU_out [3]),
					.ResponseTypeSelect_out(R00eh_CPU_out [1:0])
					);

	reg_008h R008h(	.clk(clock),
					.rst(reset),
					.CommandArgument_in(R008h_CPU),
					.CommandArgument_out(R008h_CPU_out)
					);

	reg_010h R010h(	.clk(clock),
					.rst(reset),
					.ack(ack_response),
					.enb_block0(enable_response),
					.Response_in(response_outCMD),
					.Response_out(response_outReg)
					);

	reg_030h R030h(	.clk(clock),
					.rst(reset),
					.ack(ack_command_complete),
					.enb_block0(enable_command_complete),

					.ErrInterrupt_in(R030h_CPU [15]),
					.CardInterrupt_in(R030h_CPU [8]),
					.CardRemoval_in(R030h_CPU [7]),
					.CardInsertion_in(R030h_CPU [6]),
					.BuffReadReady_in(R030h_CPU [5]),
					.BuffWriteReady_in(R030h_CPU [4]),
					.DMAInterrupt_in(R030h_CPU [3]),
					.BlockGapEvent_in(R030h_CPU [2]),
					.TransferComplete_in(R030h_CPU [1]),
					.CommandComplete_in(command_complete),

					.ErrInterrupt_out(R030h_CPU_out [15]),
					.CardInterrupt_out(R030h_CPU_out [8]),
					.CardRemoval_out(R030h_CPU_out [7]),
					.CardInsertion_out(R030h_CPU_out [6]),
					.BuffReadReady_out(R030h_CPU_out [5]),
					.BuffWriteReady_out(R030h_CPU_out [4]),
					.DMAInterrupt_out(R030h_CPU_out [3]),
					.BlockGapEvent_out(R030h_CPU_out [2]),
					.TransferComplete_out(R030h_CPU_out [1]),
					.CommandComplete_out(R030h_CPU_out [0])
					);

	reg_032h R032h (			.clk(clock),
					.rst(reset),


					.VendorErr_in(R032h_CPU [15:12]),
					.ADMAErr_in(R032h_CPU [9]),
					.AutoCMD12Err_in(R032h_CPU [8]),
					.CurrentLimitErr_in(R032h_CPU [7]),
					.DataEndBitErr_in(R032h_CPU [6]),
					.DataCRCErr_in(R032h_CPU [5]),
					.DataTimeoutErr_in(R032h_CPU [4]),
					.CommandIndexErr_in(R032h_CPU [3]),
					.CommandEndBitErr_in(R032h_CPU [2]),
					.CommandCRCErr_in(R032h_CPU [1]),
					.CommandTimeoutErr_in(R032h_CPU [0]),

					.VendorErr_out(R032h_CPU_out [15:12]),
					.ADMAErr_out(R032h_CPU_out [9]),
					.AutoCMD12Err_out(R032h_CPU_out [8]),
					.CurrentLimitErr_out(R032h_CPU_out [7]),
					.DataEndBitErr_out(R032h_CPU_out [6]),
					.DataCRCErr_out(R032h_CPU_out [5]),
					.DataTimeoutErr_out(R032h_CPU_out [4]),
					.CommandIndexErr_out(R032h_CPU_out [3]),
					.CommandEndBitErr_out(R032h_CPU_out [2]),
					.CommandCRCErr_out(R032h_CPU_out [1]),
					.CommandTimeoutErr_out(R032h_CPU_out [0])
	
	);

	reg_024h R024h (.clk(clock),
					.rst(reset),

					.CMDLineSignalLevel_in(R024h_CPU [24]),
					.DAT3LineSignalLevel_in(R024h_CPU [23:20]),
					.WriteProtectSwitchPinLevel(R024h_CPU [19]),
					.CardDetectPinLevel_in(R024h_CPU [18]),
					.CardStateStable_in(R024h_CPU [17]),
					.CardInserted_in(R024h_CPU [16]),
					.BufferReadEnable_in(R024h_CPU [11]),
					.BufferWriteEnable_in(R024h_CPU [10]),
					.ReadTransferActive_in(R024h_CPU [9]),
					.WriteTransferActive_in(R024h_CPU [8]),
					.DATlineActive_in(R024h_CPU [2]),
					.CommandInhibitdat_in(R024h_CPU [1]),
					.CommandInhibitcmd_in(R024h_CPU [0]),
	
					.CMDLineSignalLevel_out(R024h_CPU_out [24]),
					.DAT3LineSignalLevel_out(R024h_CPU_out [23:20]),
					.WriteProtectSwitchPinLevout(R024h_CPU_out [19]),
					.CardDetectPinLevel_out(R024h_CPU_out [18]),
					.CardStateStable_out(R024h_CPU_out [17]),
					.CardInserted_out(R024h_CPU_out [16]),
					.BufferReadEnable_out(R024h_CPU_out [11]),
					.BufferWriteEnable_out(R024h_CPU_out [10]),
					.ReadTransferActive_out(R024h_CPU_out [9]),
					.WriteTransferActive_out(R024h_CPU_out [8]),
					.DATlineActive_out(R024h_CPU_out [2]),
					.CommandInhibitdat_out(R024h_CPU_out [1]),
					.CommandInhibitcmd_out(R024h_CPU_out [0])
					);


endmodule
	     
