`include "CMD.v"
`include "reg16.v"

module SDHOST(clock, busy_out);

	input clock;

	output busy_out


	wire  clock;

	reg busy_out;


	wire ack00E;


   CMD CMD1 (				.new_command(),
					.cmd argument(),
					.cmd_index(),
					.timeout_enable(),
					.command_complete(),
					.command_index_error(),
					.cmd_pin_in(),
					.cmd_pin_out(),
					.sd_clock(),
					.clock(clock),
					.reset(),
					.response()
					);
 
   reg_00E 00E (			.clk(clock),
					.rst(),
					.ack(ack00E),
					.busy_out(),
					.CommandIndex_in(),
					.CommandType_in(),
					.DataPresentState_in(),
					.CommandIndezCheckEnable_in(),
					.CommandCRCCheckEnable_in(),
					.ResponseTypeSelect_in(),
					.CommandIndex_out(),
					.CommandType_out(),
					.DataPresentState_out(),
					.CommandIndezCheckEnable_out(),
					.CommandCRCCheckEnable_out(),
					.ResponseTypeSelect_out(),
					);


	busy_out = ack00E;


endmodule
	
	     
