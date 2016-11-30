all: control_cmd.v probador.v testbench.v
	iverilog -o dsn probador.v testbench.v  control_cmd.v
	vvp dsn
	gtkwave testbench.gtkw

clean:
	rm -f dsn *.vcd
