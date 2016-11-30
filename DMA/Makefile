all: TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v
	iverilog -o transicion TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v
	vvp transicion
	gtkwave test.vcd

clean:
	rm -f *.vcd



