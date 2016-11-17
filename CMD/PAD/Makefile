all: pad.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  pad.v
	vvp dsn
	gtkwave testbench.vcd

clean:
	rm -f dsn *.vcd
