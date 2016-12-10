module testbench;

	wire	 reset;						// reset
	wire	 clock;	
	wire 	 ack;					// clock
	wire	 enb_block0;
	wire	 enb_block1;				// ENABLE BLOCKS
	wire	 enb_block2;

	wire	[4:0] CommandIndex_in;
	wire	[1:0] CommandType_in;
	wire	DataPresentState_in;
	wire	CommandIndezCheckEnable_in;		// DATA IN
	wire	CommandCRCCheckEnable_in;
	wire	[1:0] ResponseTypeSelect_in;

	wire	[4:0] CommandIndex_out;
	wire	[1:0] CommandType_out;
	wire	DataPresentState_out;
	wire	CommandIndezCheckEnable_out;
	wire	CommandCRCCheckEnable_out;
	wire	[1:0] ResponseTypeSelect_out;

initial begin
	$dumpfile("testbench.vcd");
	$dumpvars(0,testbench);
end

probador probadorreg (	.clock(clock), 
						.reset(reset),
						.enb_block0(enb_block0), 
						.enb_block1(enb_block1), 
						.enb_block2(enb_block2), 

						.CommandIndex_in(CommandIndex_in), 
						.CommandType_in(CommandType_in),
						.DataPresentState_in(DataPresentState_in),
						.CommandIndezCheckEnable_in(CommandIndezCheckEnable_in),
						.CommandCRCCheckEnable_in(CommandCRCCheckEnable_in),
						.ResponseTypeSelect_in(ResponseTypeSelect_in)
					);
reg_template reg0 (
					.clk(clock),
					.rst(reset),
					
					.ack(ack),
					.enb_block0(enb_block0),
					.enb_block1(enb_block1),
					.enb_block2(enb_block2),

					.CommandIndex_in(CommandIndex_in),
					.CommandType_in(CommandType_in),
					.DataPresentState_in(DataPresentState_in),
					.CommandIndezCheckEnable_in(CommandIndezCheckEnable_in),
					.CommandCRCCheckEnable_in(CommandCRCCheckEnable_in),
					.ResponseTypeSelect_in(ResponseTypeSelect_in),

					.CommandIndex_out(CommandIndex_out),
					.CommandType_out(CommandType_out),
					.DataPresentState_out(DataPresentState_out),
					.CommandIndezCheckEnable_out(CommandIndezCheckEnable_out),
					.CommandCRCCheckEnable_out(CommandCRCCheckEnable_out),
					.ResponseTypeSelect_out(ResponseTypeSelect_out)
					
					);
endmodule