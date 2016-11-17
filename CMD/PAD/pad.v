

module pad(output_input, enable, data_in, data_out, sd_clock, io_port);

   
	input output_input;	//salida (1) o entrada (0)
	input enable;		//Habilitacion
	input data_in;		//Datos por enviar
	input sd_clock;		//Reloj de la tarjeta SD

	output data_out;	//Datos recibidos

  	inout io_port;      	//Linea hacia la tarjeta SD

	wire output_input;
	wire enable;
	wire data_in;
	wire sd_clock;

	reg Q1;
	reg D2;
	reg out_buf;

	reg data_out;

  	//reg io_port;    	//no es un reg
   
	assign out_buf = output_input ? Q1 : 1'bz;  

	always @(posedge sd_clock) begin
		if (enable == 1) begin		
			Q1 <= data_in;
			data_out <= D2;
		end else begin
			Q1 <= Q1;
			data_out <= data_out;
		end
	end


	always @(*) begin
		if(output_input == 1) begin
			io_port <= out_buf;
		end else begin
			D2 <= io_port;
		end
	end					

   
endmodule 

