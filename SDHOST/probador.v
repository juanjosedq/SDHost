`timescale 1 ns / 1 ps

module probador (clock, sd_clock, reset, cmd_pin_in, 024h_CPU, 00eh_CPU, 008h_CPU, 032h_CPU);

	output 		clock;
	output 		reset;
	output		sd_clock;
	output		cmd_pin_in;

	output [31:0]    024h_CPU;
	output [15:0]    00eh_CPU;
	output [15:0]    008h_CPU;
	output [15:0]    032h_CPU;       

	reg 		clock;
	reg 		reset;
	reg		sd_clock;
	reg		cmd_pin_in;

	reg [31:0]    024h_CPU;
	reg [15:0]    00eh_CPU;
	reg [15:0]    008h_CPU;
	reg [15:0]    032h_CPU;          
         


   initial begin
      reset = 1;
      clock = 0;
      sd_clock = 0;

      cmd_pin_in = 0;

      024h_CPU [31:4]= 28'hCAFECAF;
      024h_CPU [3:0]= 4'b0000;

      00eh_CPU [7:0]= 8'hCA;
      00eh_CPU [13:8]= 6'b110011;
      00eh_CPU [15:14]= 6'b00;

      008h_CPU [31:0]= 32'hBEBEBEBE;       
     
      032h_CPU [15:4]= 8'hFEA;
      0032h_CPU [3:0]= 4'b0001;

     #2 reset = 0;

     #30 024h_CPU [3:0] = 4'b0001;

     #800
     

     $finish;
   end

   always #1 clock = !clock;
   always #1 sd_clock = !sd_clock;
   always #2 cmd_pin_in = !cmd_pin_in;

endmodule // probador
