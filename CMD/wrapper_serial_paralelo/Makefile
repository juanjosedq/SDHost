all: wrapper_serial_paralelo.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  wrapper_serial_paralelo.v
	vvp dsn
	gtkwave testbench.vcd

clean:
	rm -f dsn *.vcd
