`include "CMD.v"
`include "regs.v"

module SDHOST(clock, sd_clock, reset, cpu_in_00eh, cpu_in_008h, response_outReg, cmd_pin_in, cmd_pin_out, 024h_CPU), 024h_CPU_out;

	input 		clock;
	input 		reset;
	input [15:0]	cpu_in_00eh;
	input [31:0]	cpu_in_008h;
	input		sd_clock;
	input		cmd_pin_in;
	input		cmd_pin_out;
	input [31:0]    024h_CPU;

	output [127:0] response_outReg;
	output [31:0]  024h_CPU_out;

	wire  		clock;
	wire		reset;

	wire		sd_clock;
	wire		cmd_pin_in;
	wire		cmd_pin_out;

	reg [127:0] 	response_outReg;

	wire command_complete;
	wire [127:0]	response_outCMD;
	wire		enable_response;
	wire		ack_response;

	wire		enable_command_complete;
	wire		ack_command_complete;

	wire [31:0]	024h_CPU;
	wire [31:0] 024h_CPU_out;


	wire [15:0]	00eh_CPU;
	wire [15:0] 00eh_CPU_out;

	wire [31:0]	008h_CPU;
	wire [31:0] 008h_CPU_out;

	wire [31:0]	032h_CPU;
	wire [31:0] 032h_CPU_out;





	CMD CMD1 (		.new_command([0] 024h_CPU_out),
					.cmd argument(008h_CPU_out),
					.cmd_index([13:8] 00eh_CPU_out),
					.timeout_enable(032h_CPU_out [0]),
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
 
	reg_00eh 00eh (	.clk(clock),
					.rst(reset),

					.CommandIndex_in(00eh_CPU [13:8]),
					.CommandType_in(00eh_CPU [7:6]),
					.DataPresentState_in(00eh_CPU [5]),
					.CommandIndezCheckEnable_in(00eh_CPU [4]),
					.CommandCRCCheckEnable_in(00eh_CPU [3]),
					.ResponseTypeSelect_in(00eh_CPU [1:0]),

					.CommandIndex_out(00eh_CPU_out [13:8]),
					.CommandType_out(00eh_CPU_out [7:6]),
					.DataPresentState_out(00eh_CPU_out [5]),
					.CommandIndezCheckEnable_out(00eh_CPU_out [4]),
					.CommandCRCCheckEnable_out(00eh_CPU_out [3]),
					.ResponseTypeSelect_out(00eh_CPU_out [1:0]),
					);

	reg_008h 008h(	.clk(clock),
					.rst(reset),
					.CommandArgument_in(008h_CPU),
					.CommandArgument_out(008h_CPU_out),
					);

	reg_010h 010h(	.clk(clock),
					.rst(reset),
					.ack(ack_response),
					.enb_block0(enable_response),
					.Response_in(response_outCMD),
					.Response_out(response_outReg),
					);

	reg_030h 030h(	.clk(clock),
					.rst(reset),
					.ack(ack_command_complete),
					.enb_block0(enable_command_complete),

					.ErrInterrupt_in(030h_CPU [15]),
					.CardInterrupt_in(030h_CPU [8]),
					.CardRemoval_in(030h_CPU [7]),
					.CardInsertion_in(030h_CPU [6]),
					.BuffReadReady_in(030h_CPU [5]),
					.BuffWriteReady_in(030h_CPU [4]),
					.DMAInterrupt_in(030h_CPU [3]),
					.BlockGapEvent_in(030h_CPU [2]),
					.TransferComplete_in(030h_CPU [1]),
					.CommandComplete_in(command_complete),

					.ErrInterrupt_out(030h_CPU_out [15]),
					.CardInterrupt_out(030h_CPU_out [8]),
					.CardRemoval_out(030h_CPU_out [7]),
					.CardInsertion_out(030h_CPU_out [6]),
					.BuffReadReady_out(030h_CPU_out [5]),
					.BuffWriteReady_out(030h_CPU_out [4]),
					.DMAInterrupt_out(030h_CPU_out [3]),
					.BlockGapEvent_out(030h_CPU_out [2]),
					.TransferComplete_out(030h_CPU_out [1]),
					.CommandComplete_out(030h_CPU_out [0])
					);

	reg_032h(		.clk(clock),
					.rst(reset),


					.VendorErr_in(032h_CPU_out [15:12]),
					.ADMAErr_in(032h_CPU_out [9]),
					.AutoCMD12Err_in(032h_CPU_out [8]),
					.CurrentLimitErr_in(032h_CPU_out [7]),
					.DataEndBitErr_in(032h_CPU_out [6]),
					.DataCRCErr_in(032h_CPU_out [5]),
					.DataTimeoutErr_in(032h_CPU_out [4]),
					.CommandIndexErr_in(032h_CPU_out [3]),
					.CommandEndBitErr_in(032h_CPU_out [2]),
					.CommandCRCErr_in(032h_CPU_out [1]),
					.CommandTimeoutErr_in(032h_CPU_out [0]),

					.VendorErr_out(032h_CPU_out [15:12]),
					.ADMAErr_out(032h_CPU_out [9]),
					.AutoCMD12Err_out(032h_CPU_out [8]),
					.CurrentLimitErr_out(032h_CPU_out [7]),
					.DataEndBitErr_out(032h_CPU_out [6]),
					.DataCRCErr_out(032h_CPU_out [5]),
					.DataTimeoutErr_out(032h_CPU_out [4]),
					.CommandIndexErr_out(032h_CPU_out [3]),
					.CommandEndBitErr_out(032h_CPU_out [2]),
					.CommandCRCErr_out(032h_CPU_out [1]),
					.CommandTimeoutErr_out(032h_CPU_out [0])
	
	);

	reg_024h 024h (	.clk(clock),
					.rst(reset),

					.CMDLineSignalLevel_in(024h_CPU [24]),
					.DAT3LineSignalLevel_in(024h_CPU [23:20]),
					.WriteProtectSwitchPinLevel(024h_CPU [19]),
					.CardDetectPinLevel_in(024h_CPU [18]),
					.CardStateStable_in(024h_CPU [17]),
					.CardInserted_in(024h_CPU [16]),
					.BufferReadEnable_in(024h_CPU [11]),
					.BufferWriteEnable_in(024h_CPU [10]),
					.ReadTransferActive_in(024h_CPU [9]),
					.WriteTransferActive_in(024h_CPU [8]),
					.DATlineActive_in(024h_CPU [2]),
					.CommandInhibitdat_in(024h_CPU [1]),
					.CommandInhibitcmd_in(024h_CPU [0]),
	
					.CMDLineSignalLevel_out(024h_CPU_out [24]),
					.DAT3LineSignalLevel_out(024h_CPU_out [23:20]),
					.WriteProtectSwitchPinLevout(024h_CPU_out [19]),
					.CardDetectPinLevel_out(024h_CPU_out [18]),
					.CardStateStable_out(024h_CPU_out [17]),
					.CardInserted_out(024h_CPU_out [16]),
					.BufferReadEnable_out(024h_CPU_out [11]),
					.BufferWriteEnable_out(024h_CPU_out [10]),
					.ReadTransferActive_out(024h_CPU_out [9]),
					.WriteTransferActive_out(024h_CPU_out [8]),
					.DATlineActive_out(024h_CPU_out [2]),
					.CommandInhibitdat_out(024h_CPU_out [1]),
					.CommandInhibitcmd_out(024h_CPU_out [0])),
					);

endmodule
	     
