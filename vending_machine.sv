`timescale 1ns / 1ps

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
	
	state_e current_state, next_state;
	//state_e next_state = S0;
	
	always_ff @(posedge clk_i) begin : update_next_state
	
//		if (nickle_i) coins = 3'b001;
//		if (dime_i) coins = 3'b010;
//		if (quarter_i) coins = 3'b100;
		//else coins = 3'b000;
		
		current_state = next_state;
		
		unique case (current_state)
			S0: begin
				soda_o = 1'b0;
				change_o = 3'b000;
				if (nickle_i) next_state = S1;
				else if (dime_i) next_state = S2;
				else if (quarter_i) begin
					soda_o = 1'b1;
					change_o = 3'b001;
					next_state = S0;
				end
				else next_state = current_state;
			 end
			S1: begin
				if (nickle_i) next_state = S2;
				else if (dime_i) next_state = S3;
				else if (quarter_i) begin
					soda_o = 1'b1;
					change_o = 3'b010;
					next_state = S0;
				end
				else next_state = current_state;
			 end
			S2: begin
				if (nickle_i) next_state = S3;
				else if (dime_i) begin
					soda_o = 1'b1;
					change_o = 3'b000;
					next_state = S0;
				end
				else if (quarter_i) begin
					soda_o = 1'b1;
					change_o = 3'b011;
					next_state = S0;
				end
				else next_state = current_state;
			 end
			S3: begin
				if (nickle_i) begin
					soda_o = 1'b1;
					change_o = 3'b000;
					next_state = S0;
				end
				else if (dime_i) begin
					soda_o = 1'b1;
					change_o = 3'b001;
					next_state = S0;
				end
				else if (quarter_i) begin
					soda_o = 1'b1;
					change_o = 3'b100;
					next_state = S0;
				end
				else next_state = current_state;
			 end
		endcase
	end
		
endmodule
