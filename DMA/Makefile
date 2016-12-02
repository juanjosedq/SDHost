all: TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v
	iverilog -o transicion TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v
	vvp transicion
	gtkwave test.vcd

clean:
	rm -f *.vcd



