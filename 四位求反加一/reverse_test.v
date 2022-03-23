`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:30:52 03/09/2022
// Design Name:   reverse
// Module Name:   /home/hanserena/hanserena/module_3/reverse_test.v
// Project Name:  module_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: reverse
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reverse_test;

	// Inputs
	reg [3:0] a;

	// Outputs
	wire [3:0] b;

	// Instantiate the Unit Under Test (UUT)
	reverse uut (
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0000;
		
		#10;
		a = 0001;
		
		#10;
		a = 0010;
		
		#10;
		a = 0011;
		
		#10;
		a = 0100;
		
		#10;
		a = 0101;
		
		#10;
		a = 0110;
		
		#10;
		a = 0111;
		
		#10;
		a = 1000;
		
		#10;
		a = 1001;
		
		#10;
		a = 1010;
		
		#10;
		a = 1011;
		
		#10;
		a = 1100;
		
		#10;
		a = 1101;
		
		#10;
		a = 1110;
		
		#10;
		a = 1111;
	end
      
endmodule

