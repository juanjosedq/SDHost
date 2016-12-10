all:  Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v aFIFO.v fifo_testbench.v Transferencia.v
	iverilog -o transicion  Probador.v TransicionEstados.v Descriptor_Table.v Registers.v TransferType.v aFIFO.v fifo_testbench.v Transferencia.v
	vvp transicion
	gtkwave testbench.vcd

clean:
	rm -f *.vcd



