module reg_032h(
	clk,
	rst,

	VendorErr_in, 
	ADMAErr_in, 
	AutoCMD12Err_in, 
	CurrentLimitErr_in, 
	DataEndBitErr_in, 
	DataCRCErr_in, 
	DataTimeoutErr_in, 
	CommandIndexErr_in, 
	CommandEndBitErr_in, 
	CommandCRCErr_in, 
	CommandTimeoutErr_in, 

	VendorErr_out,
	ADMAErr_out,
	AutoCMD12Err_out,
	CurrentLimitErr_out,
	DataEndBitErr_out,
	DataCRCErr_out,
	DataTimeoutErr_out,
	CommandIndexErr_out,
	CommandEndBitErr_out,
	CommandCRCErr_out,
	CommandTimeoutErr_out
	
	);
//Parameters before
parameter width = 16;

//INPUT & OUTPUT DECLARATION


input rst;						// reset
input clk;						// clock


input [3:0] VendorErr_in;
input ADMAErr_in;
input AutoCMD12Err_in;
input CurrentLimitErr_in;
input DataEndBitErr_in;
input DataCRCErr_in;
input DataTimeoutErr_in;
input CommandIndexErr_in;
input CommandEndBitErr_in;
input CommandCRCErr_in;
input CommandTimeoutErr_in;

output [3:0] VendorErr_out;
output ADMAErr_out;
output AutoCMD12Err_out;
output CurrentLimitErr_out;
output DataEndBitErr_out;
output DataCRCErr_out;
output DataTimeoutErr_out;
output CommandIndexErr_out;
output CommandEndBitErr_out;
output CommandCRCErr_out;
output CommandTimeoutErr_out;


//REG SIZE
wire [(width-1):0] data_in;

//WIRES
	//Regular Blocks
	wire rst;		
	wire clk;

	//INPUTS
	wire [3:0] VendorErr_in;
	wire ADMAErr_in;
	wire AutoCMD12Err_in;
	wire CurrentLimitErr_in;
	wire DataEndBitErr_in;
	wire DataCRCErr_in;
	wire DataTimeoutErr_in;
	wire CommandIndexErr_in;
	wire CommandEndBitErr_in;
	wire CommandCRCErr_in;
	wire CommandTimeoutErr_in;

	//OUTPUTS
	wire [3:0] VendorErr_out;
	wire ADMAErr_out;
	wire AutoCMD12Err_out;
	wire CurrentLimitErr_out;
	wire DataEndBitErr_out;
	wire DataCRCErr_out;
	wire DataTimeoutErr_out;
	wire CommandIndexErr_out;
	wire CommandEndBitErr_out;
	wire CommandCRCErr_out;
	wire CommandTimeoutErr_out;
//REG
	//OUTPUTS
	reg [(width-1):0] data_out;


//REG INPUT OUTPUT ASSIGNS
	//RESERVED
	assign data_in [11:10] = 0 ;

	//INPUTS
	assign data_in [15:12] = VendorErr_in;
	assign data_in [9] = ADMAErr_in;
	assign data_in [8] = AutoCMD12Err_in;
	assign data_in [7] = CurrentLimitErr_in;
	assign data_in [6] = DataEndBitErr_in;
	assign data_in [5] = DataCRCErr_in;
	assign data_in [4] = DataTimeoutErr_in;
	assign data_in [3] = CommandIndexErr_in;
	assign data_in [2] = CommandEndBitErr_in;
	assign data_in [1] = CommandCRCErr_in;
	assign data_in [0] = CommandTimeoutErr_in;


	//OUTPUTS
	assign VendorErr_out = data_out [15:12];
	assign ADMAErr_out = data_out [9];
	assign AutoCMD12Err_out = data_out [8];
	assign CurrentLimitErr_out = data_out [7];
	assign DataEndBitErr_out = data_out [6];
	assign DataCRCErr_out = data_out [5];
	assign DataTimeoutErr_out = data_out [4];
	assign CommandIndexErr_out = data_out [3];
	assign CommandEndBitErr_out = data_out [2];
	assign CommandCRCErr_out = data_out [1];
	assign CommandTimeoutErr_out = data_out [0];

//Bloque secuencial
always @(posedge clk) begin
	if (rst) begin
		// reset
		data_out <= 32'b0;
	end
	else if (1) begin
		data_out <= data_in;
	end
	else begin
		data_out <= data_out;
	end
end


//Bloque combinacional


endmodule
