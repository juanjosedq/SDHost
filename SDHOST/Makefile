all: SDHOST.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  SDHOST.v
	vvp dsn
	gtkwave testbench.vcd

clean:
	rm -f dsn *.vcd
