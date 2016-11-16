all: control_capa_fisica.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  control_capa_fisica.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
