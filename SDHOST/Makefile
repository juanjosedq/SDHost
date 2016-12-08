all: CMD.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  CMD.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
