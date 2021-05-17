`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:11:59 05/16/2021
// Design Name:   problem3
// Module Name:   E:/Project/ISEproject/FpgaCourse/week8/problem1/sim/tb_problem3.v
// Project Name:  problem1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problem3
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_problem3;

	// Inputs
	reg clk_50m;
	reg clk_measure;
	reg rst_n;

	// Outputs
	wire [13:0] measuring_frequency;
	wire overrange;
	// Instantiate the Unit UnderTest (UUT)
	problem3 uut (
		.clk_50m(clk_50m), 
		.clk_measure(clk_measure), 
		.rst_n(rst_n), 
		.overrange(overrange),
		.measuring_frequency(measuring_frequency)
	);

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		clk_measure = 0;
		rst_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst_n = 1;
		// Add stimulus here

	end
always #10 clk_50m=~clk_50m;

always #50_0000 clk_measure=~clk_measure;//1khz   
   
endmodule

