module testbench;                                // Se define un modulo de prueba

	parameter n = 7; //paralell signal size at output
	wire input_1;
	wire clk;
	wire enable;
	wire reset;
	wire [n-1:0] output_n;
	wire push;

  initial begin                             // Bloque que se ejecuta al inicio
     $dumpfile("testbench.vcd");                 // El resultado se guarda en test.vcd
     $dumpvars(0,testbench);
  end
       

  probador valores (input_1, clk, enable, reset);

  s_pn c1 (output_n, input_1, clk, enable, reset, push); 
   

endmodule // test
