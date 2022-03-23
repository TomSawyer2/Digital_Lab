`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:48:35 03/09/2022 
// Design Name: 
// Module Name:    reverse 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module reverse(input [3:0]a, output [3:0]b);
		and(b[0], a[0], a[0]);
		xor(b[1], a[0], a[1]);
		wire c, d;
		or(c, a[0], a[1]);
		xor(b[2], a[2], c);
		or(d, c, a[2]);
		xor(b[3], a[3], d);
endmodule
