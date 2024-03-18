`timescale 1ns / 1ps
`define clk_p 10

module vending_machine_tb();

	logic clk;
	logic nickle;
	logic dime;
	logic quarter;
	logic soda;
	logic [2:0] change;
	
	vending_machine M0(nickle, dime, quarter, clk, soda, change); 
	
	initial begin 
		nickle <= 0;
		dime <= 0;
		quarter <= 0;
		clk <= 0;
		
		#10; 
		nickle <= 1'b0; 
		dime <= 1'b1;
		quarter <= 0;
		#15;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		
		#10;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#20;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#15;
		nickle <= 0;
		dime <= 0;
		quarter <= 1'b1;

		#10;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#10;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#15;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;

		#10;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#10;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#15;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;

		#15;
		nickle <= 0;
		dime <= 0;
		quarter <= 1'b1;

		#10;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#20;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#15;
		nickle <= 0;
		dime <= 0;
		quarter <= 1'b1;

		#10;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#20;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#15;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		

		#10;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#10;
		nickle <= 0;
		dime <= 0;
		quarter <= 1'b1;


		#10;
		nickle <= 0;
		dime <= 1'b1;
		quarter <= 0;
		#10;
		nickle <= 1'b1;
		dime <= 0;
		quarter <= 0;
		#15;
		nickle <= 0;
		dime <= 0;
		quarter <= 1'b1;
		$finish; 
		
	end
	
	always #(`clk_p/2) clk = ~clk; 

endmodule
