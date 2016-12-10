`timescale 1 ns / 1 ps

module probador (	clock, 
					reset,
					enb_block0, 
					enb_block1, 
					enb_block2, 

					CommandIndex_in, 
					CommandType_in,
					DataPresentState_in,
					CommandIndezCheckEnable_in,
					CommandCRCCheckEnable_in,
					ResponseTypeSelect_in);

output reset;						// reset
output clock;						// clock
output enb_block0;
output enb_block1;				// ENABLE BLOCKS
output enb_block2;



output	[4:0] CommandIndex_in;
output	[1:0] CommandType_in;
output	DataPresentState_in;
output	CommandIndezCheckEnable_in;		// DATA IN
output	CommandCRCCheckEnable_in;
output	[1:0] ResponseTypeSelect_in;

reg		 reset;						// reset
reg		 clock;						// clock
reg		 enb_block0;
reg		 enb_block1;				// ENABLE BLOCKS
reg		 enb_block2;



reg		[4:0] CommandIndex_in;
reg		[1:0] CommandType_in;
reg		DataPresentState_in;
reg		CommandIndezCheckEnable_in;		// DATA IN
reg		CommandCRCCheckEnable_in;
reg		[1:0] ResponseTypeSelect_in;


initial begin
	reset = 1;
	clock = 0;
	enb_block0 = 0;
	enb_block1 = 0;
	enb_block2 = 0;

	CommandIndex_in  = 5'b11110;
	CommandType_in  = 2'b10;
	DataPresentState_in  = 1;
	CommandIndezCheckEnable_in  = 0;		// DATA IN
	CommandCRCCheckEnable_in  = 1;
	ResponseTypeSelect_in  = 2'b01;


	#15 reset=0;

	enb_block0 = 0;
	enb_block1 = 0;
	enb_block2 = 0;

	CommandIndex_in  = 5'b10110;
	CommandType_in  = 2'b11;
	DataPresentState_in  = 0;
	CommandIndezCheckEnable_in  = 1;		// DATA IN
	CommandCRCCheckEnable_in  = 0;
	ResponseTypeSelect_in  = 2'b11;

	#15 reset=0;

	enb_block0 = 1;
	enb_block1 = 0;
	enb_block2 = 0;

	CommandIndex_in  = 5'b10111;
	CommandType_in  = 2'b01;
	DataPresentState_in  = 1;
	CommandIndezCheckEnable_in  = 0;		// DATA IN
	CommandCRCCheckEnable_in  = 1;
	ResponseTypeSelect_in  = 2'b01;

	#15 reset=0;

	enb_block0 = 1;
	enb_block1 = 1;
	enb_block2 = 0;

	CommandIndex_in  = 5'b11111;
	CommandType_in  = 2'b11;
	DataPresentState_in  = 1;
	CommandIndezCheckEnable_in  = 1;		// DATA IN
	CommandCRCCheckEnable_in  = 1;
	ResponseTypeSelect_in  = 2'b11;

	#15

	enb_block0 = 1;
	enb_block1 = 0;
	enb_block2 = 0;


	CommandIndex_in  = 5'b10010;
	CommandType_in  = 2'b00;
	DataPresentState_in  = 0;
	CommandIndezCheckEnable_in  = 0;		// DATA IN
	CommandCRCCheckEnable_in  = 0;
	ResponseTypeSelect_in  = 2'b00;

	#15

	CommandIndex_in  = 5'b10101;
	CommandType_in  = 2'b01;
	DataPresentState_in  = 1;
	CommandIndezCheckEnable_in  = 1;		// DATA IN
	CommandCRCCheckEnable_in  = 0;
	ResponseTypeSelect_in  = 2'b00;

	#15 $finish;
end

always begin
	#1 clock = !clock;
end

endmodule