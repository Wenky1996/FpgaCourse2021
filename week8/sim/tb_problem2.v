`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:51:02 05/16/2021
// Design Name:   problem2
// Module Name:   E:/Project/ISEproject/FpgaCourse/week8/problem1/sim/tb_problem2.v
// Project Name:  problem1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problem2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_problem2;

	// Inputs
	reg in_clk;
	reg reset;

	// Outputs
	wire out_clk;

	// Instantiate the Unit Under Test (UUT)
	problem2 uut (
		.in_clk(in_clk), 
		.reset(reset), 
		.out_clk(out_clk)
	);

	initial begin
		// Initialize Inputs
		in_clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
      reset = 0;
		// Add stimulus here

	end
      always #50 in_clk = ~in_clk;
		
endmodule

