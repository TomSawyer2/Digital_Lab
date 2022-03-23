`timescale 1ns / 1ps
module digital_clock_tb();
	reg clk;
	reg rst_n;
	reg en;
	reg adjust_hour;
	reg adjust_minute;
	wire [7:0] hour;
	wire [7:0] min;
	wire [7:0] sec;
	wire tweet;

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
	   adjust_hour = 0;
       forever #100 adjust_hour = ~adjust_hour;
    end
    
    initial begin
       adjust_minute = 0;
       forever #150 adjust_minute = ~adjust_minute;
    end

	initial begin
		rst_n = 0;
		en = 0;
		#50
		@(negedge clk) 
        rst_n = 1;
		@(negedge clk) 
		en = 1;
		
	end

	digital_clock inst_digital_clock(
		.clk(clk),
		.rst_n(rst_n),
		.en(en),
		.adjust_hour(adjust_hour),
		.adjust_minute(adjust_minute),
		.hour(hour),
		.min(min),
		.sec(sec),
		.tweet(tweet)
		);
		
endmodule
