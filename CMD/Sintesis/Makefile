all: sintetizado.v probador.v testbench.v cmos_cells.v
	iverilog -o dsn probador.v testbench.v  sintetizado.v cmos_cells.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
