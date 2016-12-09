// `include "SDHOST.v"

module testbench;                                // Se define un modulo de prueba

	wire 		clock;
	wire 		reset;
	wire		sd_clock;
	wire		cmd_pin_in;

	wire		cmd_pin_out;

	wire [31:0]    R024h_CPU;
	wire [15:0]    R00eh_CPU;
	wire [31:0]    R008h_CPU;
	wire [15:0]    R032h_CPU;

	wire [127:0] response_outReg;

	wire [31:0]    R024h_CPU_out;
	wire [15:0]    R00eh_CPU_out;
	wire [31:0]    R008h_CPU_out;
	wire [15:0]    R032h_CPU_out;

       
 

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (		.clock(clock),
							.sd_clock(sd_clock),
							.reset(reset),
							.cmd_pin_in(cmd_pin_in),
							.R024h_CPU(R024h_CPU),
							.R00eh_CPU(R00eh_CPU),
							.R008h_CPU(R008h_CPU),
							.R032h_CPU(R032h_CPU)
					);

  SDHOST SDHOST1 (		.clock(clock),
						.sd_clock(sd_clock),
						.reset(reset),
						.cmd_pin_in(cmd_pin_in),
						.cmd_pin_out(cmd_pin_out),
						.R024h_CPU(R024h_CPU),
						.R024h_CPU_out(R024h_CPU_out),
						.R00eh_CPU(R00eh_CPU),
						.R00eh_CPU_out(R00eh_CPU_out),
						.R008h_CPU(R008h_CPU),
						.R008h_CPU_out(R008h_CPU_out),
						.R032h_CPU(R032h_CPU),
						.R032h_CPU_out(R032h_CPU_out)
						);
		   

endmodule // test
