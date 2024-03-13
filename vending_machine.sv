module vending_machine(
	input logic nickle_i,
	input logic dime_i,
	input logic quarter_i,
	input logic clk_i,
	output logic soda_o,
	output logic [2:0] change_o
	);
		
	logic [2:0] coins;
	typedef enum {S0, S1, S2, S3} state_e;
	
	/*
		S0: 0$
		S1: 5$
		S2: 10$
		S3: 15$
	*/
	
	state_e state = S0;
	//state_e next_state = S0;
	
	always_ff @(posedge clk_i) begin : update_next_state
	
//		if (nickle_i) coins <= 3'b001;
//		if (dime_i) coins <= 3'b010;
//		if (quarter_i) coins <= 3'b100;
		//else coins <= 3'b000;
		
		unique case (state)
			S0: begin
				soda_o <= 1'b0;
				change_o <= 3'b000;
				if (nickle_i) state <= S1;
				else if (dime_i) state <= S2;
				else if (quarter_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b001;
					state <= S0;
				end
				else state <= state;
			 end
			S1: begin
				if (nickle_i) state <= S2;
				else if (dime_i) state <= S3;
				else if (quarter_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b010;
					state <= S0;
				end
				else state <= state;
			 end
			S2: begin
				if (nickle_i) state <= S3;
				else if (dime_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b000;
					state <= S0;
				end
				else if (quarter_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b011;
					state <= S0;
				end
				else state <= state;
			 end
			S3: begin
				if (nickle_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b000;
					state <= S0;
				end
				else if (dime_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b001;
					state <= S0;
				end
				else if (quarter_i) begin
					soda_o <= 1'b1;
					change_o <= 3'b100;
					state <= S0;
				end
				else state <= state;
			 end
		endcase
	end
		
endmodule
