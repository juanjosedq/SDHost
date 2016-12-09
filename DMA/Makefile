all: TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v aFIFO.v ProbadorFIFO.v
	iverilog -o transicion TestBench.v Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v aFIFO.v ProbadorFIFO.v
	vvp transicion
	gtkwave test.vcd

clean:
	rm -f *.vcd



