all: regs.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  regs.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
