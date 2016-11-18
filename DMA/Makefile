all: TestBench.v Probador.v TransicionEstados.v DescriptorPointer.v
	iverilog -o transicion TestBench.v Probador.v TransicionEstados.v DescriptorPointer.v
	vvp transicion
	gtkwave test.vcd

clean:
	rm -f *.vcd



