`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/23 18:11:07
// Design Name: 
// Module Name: motor_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module motor_test;
    reg M;
    reg CP, CR;
    wire [2:0] y;
    motor uut(M, CP, CR, y);
    initial begin
        CP = 0;
        forever #50 CP = ~CP;
    end
    
    initial begin
        M = 0;
    end
endmodule
