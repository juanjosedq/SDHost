module pad(output_input, enable, data_in, data_out, sd_clock, i_port, o_port);

   
	input output_input;	// salida (1) o entrada (0) (CCF)
	input enable;		// Habilitacion	(CCF)
	input data_in;		// Datos por enviar (wrapper P-S)
	input sd_clock;		// Reloj de la tarjeta SD
	input i_port;		// Linea de la tarjeta SD (SD)

	output data_out;	// Datos recibidos (wrapper S-P)
	output o_port;		// Linea hacia la tarjeta SD (SD)


	wire output_input;
	wire enable;
	wire data_in;
	wire sd_clock;
	wire i_port;

	reg data_out;
	reg o_port;

   
	always @(posedge sd_clock) begin
		if (enable) begin
			if (output_input == 1) begin
				o_port <= data_in;
				data_out <= 1'bz;
			end else begin
				o_port <= 1'bz;
				data_out <= i_port;
			end
		end else begin
			o_port <= 1'bz;
			data_out <= 1'bz;
		end
	end					

endmodule 

