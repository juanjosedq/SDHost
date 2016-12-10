module n_m (enable, p_n, p_m, complete, reset, sd_clock, load_send);
	
	input           enable;			// Habilitacion de la carga (CCF)
	input           load_send;		// Enviar (1) cargar (0) (CCF)
	input [n-1 : 0] p_n;		// Trama por enviar (CMD)
	input           reset;
	input           sd_clock;

	output [m-1:0]p_m;				// Salida serializada (PAD)
	output complete;			// Transmision completa (CCF)

	wire           enable;
	wire           load_send;
	wire [n-1 : 0] p_n;
	wire           reset;
	wire           sd_clock;

	reg [m-1:0]p_m;
	reg complete;
	reg next_complete;

	integer count = 0;		
	parameter n = 32;
	parameter m = 4;
	reg [n-1:0] parallel_cargado;


	always @ (posedge sd_clock)
		begin
			if (reset) begin
				p_m <= 0;
				parallel_cargado <= 0;
			end else begin
				if (enable) begin
					parallel_cargado <= p_n;
				end else begin
					parallel_cargado <= parallel_cargado;
				end
				if (load_send) begin
					p_m <= parallel_cargado [n-1-count*m -: m];
				end else begin
					 p_m <= p_m;
				end
			end
		end
	
	always @ (negedge sd_clock)
		begin
			if(reset) begin
				count <= 0;
			end else begin
				if(load_send) begin
					if(count != n/m-1) begin
						count <= (count + 1);
					end else begin
						count <= 0;
					end 
				end	
			end
		end
	//complete signal generation
	always @ (posedge sd_clock)
		begin
			if (count == n/m-1) begin
				next_complete = 1'b1;
			end else begin
				next_complete = 1'b0;
			end
		end

	always @ (negedge sd_clock) begin
		complete <= next_complete;
	end

endmodule

