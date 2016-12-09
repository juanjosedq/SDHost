`timescale 1 ns / 1 ps

module probador(clock, sd_clock, reset, cmd_pin_in, R024h_CPU, R00eh_CPU, R008h_CPU, R032h_CPU,R030h_CPU);

	output 		clock;
	output 		reset;
	output		sd_clock;
	output		cmd_pin_in;

	output [31:0]    R024h_CPU;
	output [15:0]    R00eh_CPU;
	output [31:0]    R008h_CPU;
  output [15:0]    R032h_CPU;       
	output [15:0]    R030h_CPU;       

	reg 		clock;
	reg 		reset;
	reg		sd_clock;
	reg		cmd_pin_in;

	reg [31:0]    R024h_CPU;
	reg [15:0]    R00eh_CPU;
	reg [31:0]    R008h_CPU;
  reg [15:0]    R032h_CPU;          
	reg [15:0]    R030h_CPU;          
         


   initial begin
      reset = 1;
      clock = 0;
      sd_clock = 0;

      cmd_pin_in = 0;

      R024h_CPU [31:4]= 28'hCAFECAF;
      R024h_CPU [3:0]= 4'b0000;

      R00eh_CPU [7:0]= 8'hCA;
      R00eh_CPU [13:8]= 6'b110011;
      R00eh_CPU [15:14]= 6'b00;

      R008h_CPU [31:0]= 32'hBEBEBEBE;       
      
      R032h_CPU [15:4]= 12'hFEA;
      R032h_CPU [3:0]= 4'b0001;

      R030h_CPU [15:1]= 15'hFEAE;
      

     #2 reset = 0;

     #30 R024h_CPU [3:0] = 4'b0001;

     #800
     

     $finish;
   end

   always #1 clock = !clock;
   always #1 sd_clock = !sd_clock;
   always #2 cmd_pin_in = !cmd_pin_in;

endmodule // probador
