`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:39:22 05/16/2021
// Design Name:   problem1
// Module Name:   E:/Project/ISEproject/FpgaCourse/week8/problem1/sim/tb_problem1.v
// Project Name:  problem1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: problem1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_problem1;

	// Inputs
	reg clk;
	reg xin;

	// Outputs
	wire yout;

	// Instantiate the Unit Under Test (UUT)
	problem1 uut (
		.clk(clk), 
		.xin(xin), 
		.yout(yout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		xin = 0;
		// Wait 100 ns for global reset to finish
		#100;
      xin=1;
		#100;
      xin=0;
		#100;
      xin=1;
		#100;
      xin=0;   		
		// Add stimulus her
	end
      
always  #20 clk=~clk; 
	
		
endmodule

