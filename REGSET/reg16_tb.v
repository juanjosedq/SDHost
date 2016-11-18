`include "reg16.v"
module reg16_tb();
reg clk; 
reg rst;
reg enb_block0;
reg enb_block1;
reg enb_block2;
reg [11:0] tranfer_bsize_in;
reg [2:0] host_sdmabuffb_in;

wire [2:0] host_sdmabuffb_out;
wire [11:0] tranfer_bsize_out;
wire busy_out;
wire ack;

integer i;

initial begin
	$dumpfile("reg16_tb.vcd");
    $dumpvars(0,reg16_tb);
  

 	clk = 1;
 	rst =1;
 	enb_block0 = 0;
 	enb_block1 = 0;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b0000_1010_1111;
 	host_sdmabuffb_in = 3'b101;
 	#8
 	rst =0;
 	enb_block0 = 1;
 	enb_block1 = 0;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b0000_1010_1111;
 	host_sdmabuffb_in = 3'b101;

 	#8
 	enb_block0 = 0;
 	enb_block1 = 1;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b0000_1010_0000;
 	host_sdmabuffb_in = 3'b111;
  	#8
 	enb_block0 = 0;
 	enb_block1 = 0;
 	enb_block2 = 1;

 	tranfer_bsize_in = 12'b0000_0000_1111;
 	host_sdmabuffb_in = 3'b101;
  	#8
 	enb_block0 = 1;
 	enb_block1 = 1;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b0000_1011_1111;
 	host_sdmabuffb_in = 3'b001;
 	 #8
 	enb_block0 = 0;
 	enb_block1 = 1;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b0000_1010_1111;
 	host_sdmabuffb_in = 3'b101;
 	 	#8
 	rst =0;
 	enb_block0 = 1;
 	enb_block1 = 0;
 	enb_block2 = 0;

 	tranfer_bsize_in = 12'b000_1010_1111;
 	host_sdmabuffb_in = 3'b111;


 	#4 $finish;
end
always begin
	#1 clk = ~clk;
end
reg16_004 reg2(clk,rst,ack,busy_out,host_sdmabuffb_in,tranfer_bsize_in,host_sdmabuffb_out,
	tranfer_bsize_out,
	// sdma_sysadd_h,
	// sdma_sysadd_l,
	enb_block0,
	enb_block1,
	enb_block2);
endmodule