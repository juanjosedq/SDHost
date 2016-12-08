`include "CMD.v"
`include "reg.v"

module SDHOST(clock, sd_clock, reset, cpu_in_00eh, cpu_in_008h, response_outReg, cmd_pin_in, cmd_pin_out);

	input 		clock;
	input 		reset;
	input [15:0]	cpu_in_00eh;
	input [31:0]	cpu_in_008h;
	input		sd_clock;
	input		cmd_pin_in;
	input		cmd_pin_out;

	output [127:0] response_outReg;

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


	CMD CMD1 (			.new_command(),
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


endmodule
	
	     
