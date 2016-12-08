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
	wire [15:0]	cpu_in_00eh;
	wire [31:0]	cpu_in_008h;
	wire		sd_clock;
	wire		cmd_pin_in;
	wire		cmd_pin_out;

	reg [127:0] 	response_outReg;

	wire   		command_index__outReg;
	wire		command_argument_outReg;
	wire [127:0]	response_outCMD;
	wire		enable_response;
	wire		ack_response;
	wire		new_command;
	wire [31:0]	024h_CPU;
	wire [31:0]     024h_CPU_out;


	CMD CMD1 (			.new_command(new_command),
					.cmd argument(command_argument_outReg),
					.cmd_index(command_index__outReg),
					.timeout_enable(),
					.command_complete(),
					.cmd_pin_in(cmd_pin_in),
					.cmd_pin_out(cmd_pin_out),
					.sd_clock(sd_clock),
					.clock(clock),
					.reset(reset),
					.response(response_outCMD),
					.enable_response(enable_response),
					.ack_response(ack_response),
					.enable_command_complete(),
					.ack_command_complete()
					);
 
	reg_00eh 00eh (			.clk(clock),
					.rst(reset),
					.CommandIndex_in(cpu_in_00eh [13:8]),
					.CommandType_in(cpu_in_00eh [7:6]),
					.DataPresentState_in(cpu_in_00eh [5]),
					.CommandIndezCheckEnable_in(cpu_in_00eh [4]),
					.CommandCRCCheckEnable_in(cpu_in_00eh [3]),
					.ResponseTypeSelect_in(cpu_in_00eh [1:0]),
					.CommandIndex_out(command_index__outReg),
					.CommandType_out(),
					.DataPresentState_out(),
					.CommandIndezCheckEnable_out(),
					.CommandCRCCheckEnable_out(),
					.ResponseTypeSelect_out(),
					);

	reg_008h 008h(			.clk(clock),
					.rst(reset),
					.CommandArgument_in(cpu_in_008h),
					.CommandArgument_out(command_argument_outReg),
					);

	reg_010h 010h(			.clk(clock),
					.rst(reset),
					.ack(ack_response),
					.enb_block0(enable_response),
					.Response_in(response_outCMD),
					.Response_out(response_outReg),
					);

	reg_030h 030h(			.clk(clock),
					.rst(reset),
					.ack(),
					.enb_block0(),
					.ErrInterrupt_in(),
					.CardInterrupt_in(),
					.CardRemoval_in(),
					.CardInsertion_in(),
					.BuffReadReady_in(),
					.BuffWriteReady_in(),
					.DMAInterrupt_in(),
					.BlockGapEvent_in(),
					.TransferComplete_in(),
					.CommandComplete_in,

					.ErrInterrupt_out,
					.CardInterrupt_out,
					.CardRemoval_out,
					.CardInsertion_out,
					.BuffReadReady_out,
					.BuffWriteReady_out,
					.DMAInterrupt_out,
					.BlockGapEvent_out,
					.TransferComplete_out,
					.CommandComplete_out
					);

	reg_032h(			.clk(clock),
					.rst(reset),
	
					.ack,
					.enb_block0,
					.enb_block1,
					.enb_block2,


					.VendorErr_in,
					.ADMAErr_in,
					.AutoCMD12Err_in,
					.CurrentLimitErr_in,
					.DataEndBitErr_in,
					.DataCRCErr_in,
					.DataTimeoutErr_in,
					.CommandIndexErr_in,
					.CommandEndBitErr_in,
					.CommandCRCErr_in,
					.CommandTimeoutErr_in,

					.VendorErr_out,
					.ADMAErr_out,
					.AutoCMD12Err_out,
					.CurrentLimitErr_out,
					.DataEndBitErr_out,
					.DataCRCErr_out,
					.DataTimeoutErr_out,
					.CommandIndexErr_out,
					.CommandEndBitErr_out,
					.CommandCRCErr_out,
					.CommandTimeoutErr_out
	
	);

	reg_024h 024h (			.clk(clock),
					.rst(reset),

					.CMDLineSignalLevel_in([24] 024h_CPU),
					.DAT3LineSignalLevel_in([23:20] 024h_CPU),
					.WriteProtectSwitchPinLevel([19] 024h_CPU),
					.CardDetectPinLevel_in([18] 024h_CPU),
					.CardStateStable_in([17] 024h_CPU),
					.CardInserted_in([16] 024h_CPU),
					.BufferReadEnable_in([11] 024h_CPU),
					.BufferWriteEnable_in([10] 024h_CPU),
					.ReadTransferActive_in([9] 024h_CPU),
					.WriteTransferActive_in([8] 024h_CPU),
					.DATlineActive_in([2] 024h_CPU),
					.CommandInhibitdat_in([1] 024h_CPU),
					.CommandInhibitcmd_in([0] 024h_CPU),
	
					.CMDLineSignalLevel_out(),
					.DAT3LineSignalLevel_out(),
					.WriteProtectSwitchPinLevout(),
					.CardDetectPinLevel_out(),
					.CardStateStable_out(),
					.CardInserted_out(),
					.BufferReadEnable_out(),
					.BufferWriteEnable_out(),
					.ReadTransferActive_out(),
					.WriteTransferActive_out(),
					.DATlineActive_out(),
					.CommandInhibitdat_out(),
					.CommandInhibitcmd_out(new_command),
					);

endmodule
	     
