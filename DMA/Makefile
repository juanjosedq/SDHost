all: TestBench.v Probador.v TransicionEstados.v 
	iverilog -o transicion TestBench.v Probador.v TransicionEstados.v
	vvp transicion
	gtkwave test.vcd

clean:
	rm -f *.vcd



