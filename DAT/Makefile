all: aFIFO.v DAT.v communication.v
	iverilog -o prueba_1 testing/testbench_width.v
	vvp prueba_1
	iverilog -o prueba_2 testing/testbench_int.v
	vvp prueba_2
	iverilog -o prueba_3 testing/testbench_2.v
	vvp prueba_3 
	gtkwave testbench_width.vcd gtkw/test_signals.gtkw &
	gtkwave testbench_int.vcd gtkw/integrated_test.gtkw &
	gtkwave testbench_card_write.vcd gtkw/test_card_out.gtkw &
	gtkwave testbench_card_write.vcd gtkw/test_card_out_2.gtkw &

clean:
	rm -f prueba_* *.vcd
	
