all: s_pn.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  s_pn.v
	vvp dsn
	gtkwave testbench.vcd

clean:
	rm -f dsn *.vcd
