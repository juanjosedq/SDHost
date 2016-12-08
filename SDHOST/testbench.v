`include "SDHOST.v"

module testbench;                                // Se define un modulo de prueba

	wire 		clock;
	wire 		reset;
	wire		sd_clock;
	wire		cmd_pin_in;

	wire		cmd_pin_out;

	wire [31:0]    024h_CPU;
	wire [15:0]    00eh_CPU;
	wire [15:0]    008h_CPU;
	wire [15:0]    032h_CPU;

	wire [127:0] response_outReg;

	wire [31:0]    024h_CPU_out;
	wire [15:0]    00eh_CPU_out;
	wire [15:0]    008h_CPU_out;
	wire [15:0]    032h_CPU_out;

       
 

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbenc.vcd");                 // El resultado se guarda en test.vcd
     .$dumpvars(0,testbench);
  end
       

  probador valores (		.clock(clock),
							.sd_clock(sd_clock),
							.reset(reset),
							.cmd_pin_in(cmd_pin_in),
							.024h_CPU(024h_CPU),
							.00eh_CPU(00eh_CPU),
							.008h_CPU(008h_CPU),
							.032h_CPU(032h_CPU)
					);

  SDHOST SDHOST1 (		.clock(clock),
						.sd_clock(sd_clock),
						.reset(reset),
						.cmd_pin_in(cmd_pin_in),
						.cmd_pin_out(cmd_pin_out),
						.024h_CPU(024h_CPU),
						.024h_CPU_out(024h_CPU_out),
						.00eh_CPU(00eh_CPU),
						.00eh_CPU_out(00eh_CPU_out),
						.008h_CPU(008h_CPU),
						.008h_CPU_out(008h_CPU_outh),
						.032h_CPU(032h_CPU),
						.032h_CPU_out(032h_CPU_out)
						);
		   

endmodule // test
