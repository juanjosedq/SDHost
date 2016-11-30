module testbench;                                // Se define un modulo de prueba

   wire output_input;
   wire enable;
   wire data_in;
   wire data_out;
   wire sd_clock;
   wire i_port;
   wire o_port;


  initial begin   
     $dumpfile("testbench.vcd");   
     $dumpvars(0,testbench);
  end
       

  probador valores (output_input, enable, data_in, sd_clock, i_port);

  pad c1 (output_input, enable, data_in, data_out, sd_clock, i_port, o_port);
   

endmodule // test
