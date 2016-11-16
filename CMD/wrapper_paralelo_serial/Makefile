all: wrapper_paralelo_serial.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  wrapper_paralelo_serial.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
