all: sintetizado.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  sintetizado.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
