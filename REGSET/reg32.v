
module reg32_000(
	clk,
	rst,
	data_in,
	data_out,
	ack,
	busy_in,
	busy_out,
	// sdma_sysadd_h,
	// sdma_sysadd_l,
	enb_block0,
	enb_block1,
	enb_block2);
//Parameters before
parameter width = 32;

//INPUT & OUTPUT DECLARATION
input [(width-1):0] data_in;	// entrada de width bits
input enb_block0;				// enable del bloque0
input enb_block1;				// enable del bloque1
input enb_block2;				// enable del bloque2
input enb_transfer;
input rst;						// reset
input clk;						// clock
input busy_in;
// output [((width/2)-1):0]sdma_sysadd_l;
// output [(width-1):((width/2)-1)]sdma_sysadd_h;  // Prueba con diferentes salidas para cada seccion

output [(width-1):0] data_out;
output ack;
output busy;
//Port Types
wire [(width-1):0] data_in;
wire enb_block0;
wire enb_block1;
wire enb_block2;
wire rst;		
wire clk;
wire busy_in;

reg ack;
reg busy_out; 						// 
reg [(width-1):0] data_out;
// reg sdma_sysadd_l;
// reg sdma_sysadd_h;

//parameters after
// parameter sdma_sysadd_l = data_in[15:0];
// parameter sdma_sysadd_h = data_in[31:16];


//CODE

//Bloque combinacional
always @(*) begin
	// comportamiento del ack
	if (data_in == data_out) begin
		ack = 1'b1;
	end
	else begin
		ack = 1'b0;	
	end
	// comportamiento de busy
	if (enb_block0 ^ enb_block1 ^ enb_block2) begin
		busy_out = 1'b1;
	end
	else begin
		busy_out = 1'b0;
	end
	// busy con or
	/*if (enb_block0 || enb_block1 || enb_block2) begin
		busy = 1'b1;
	end
	else begin
		busy = 1'b0;
	end*/
end

//Bloque secuencial 
always @(posedge clk or posedge rst) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (enb_block0 && ~busy_in ) begin
		data_out <= data_in;
	end
	else if (enb_block1 && ~busy_in) begin
		data_out <= data_in;
	end
	else if (enb_block2 && ~busy_in) begin
		data_out <= data_in;
	end
end

endmodule

