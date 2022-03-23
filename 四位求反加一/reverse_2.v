`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:01 03/09/2022 
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
module reverse(input [3:0]a,output reg [3:0]b);	
		always@(a) begin
		b <= ~a+1;
		end 
endmodule