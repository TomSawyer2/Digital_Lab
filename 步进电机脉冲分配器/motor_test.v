`timescale 1ns / 1ps

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
