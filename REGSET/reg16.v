module reg16_004(
	clk,
	rst,
	ack,
	busy_out,
	host_sdmabuffb_in,
	tranfer_bsize_in,
	host_sdmabuffb_out,
	tranfer_bsize_out,
	// sdma_sysadd_h,
	// sdma_sysadd_l,
	enb_block0,
	enb_block1,
	enb_block2);
//Parameters before
parameter width = 16;

//INPUT & OUTPUT DECLARATION

input enb_block0;				// enable del bloque0
input enb_block1;				// enable del bloque1
input enb_block2;				// enable del bloque2
input rst;						// reset
input clk;						// clock

input [2:0] host_sdmabuffb_in;
input [11:0] tranfer_bsize_in;

// output [((width/2)-1):0]sdma_sysadd_l;
// output [(width-1):((width/2)-1)]sdma_sysadd_h;  // Prueba con diferentes salidas para cada seccion
output [11:0] tranfer_bsize_out;
output [2:0] host_sdmabuffb_out;
output ack;
output busy_out;


//Port Types
wire [(width-1):0] data_in;
wire enb_block0;
wire enb_block1;
wire enb_block2;
wire rst;		
wire clk;
wire [2:0] host_sdmabuffb_in;
wire [11:0] tranfer_bsize_in;

wire [11:0] tranfer_bsize_out;
wire [2:0] host_sdmabuffb_out;

reg ack;
reg busy_out; 						// 
reg [(width-1):0] data_out;
// reg sdma_sysadd_l;
// reg sdma_sysadd_h;


//CODE
assign data_in [15] = 1'b0 ;		
assign data_in [11:0] = tranfer_bsize_in;
assign data_in [14:12]= host_sdmabuffb_in;

assign tranfer_bsize_out = data_out [11:0];
assign host_sdmabuffb_out = data_out [14:12];

//Bloque combinacional
always @(*) begin
	// comportamiento del ack
// if ((data_in == data_out)&& ~busy_in) begin
	if (data_in == data_out) begin
		ack = 1'b1;
	end
	else begin
		ack = 1'b0;	
	end
	// comportamiento de busy
	/*if (enb_block0 ^ enb_block1 ^ enb_block2) begin
		busy_out = 1'b1;
	end
	else begin
		busy_out = 1'b0;
	end*/
	// busy con or
	if ((enb_block0 && enb_block1) || (enb_block0 && enb_block2) || (enb_block2 && enb_block1) ||(enb_block0&&enb_block1&&enb_block2) ) begin
		busy_out = 1'b1;
	end
	else begin
		busy_out = 1'b0;
	end
	/*if ((enb_block0 && enb_block1) || (enb_block0 && enb_block2) || (enb_block2 && enb_block1) ||(enb_block0&&enb_block1&&enb_block2) ) begin
		busy_in = 1'b1;
	end
	else begin
		busy_in = 1'b0;
	end*/
end

//Bloque secuencial
always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 && ~busy_out ) begin
		data_out <= data_in;
	end
	else if (enb_block1 && ~busy_out) begin
		data_out <= data_in;
	end
	else if (enb_block2 && ~busy_out) begin
		data_out <= data_in;
	end
	else begin
		data_out <= data_out;
	end
end

endmodule

