`timescale 1ns / 1ps
module TOP(
	input clk,
    input rst_n,
    input en,
    input adjust_hour,
    input adjust_minute,
    output  [7:0] an,   //片选
    output  [7:0] sseg,  //段选
    output tweet //整点报时
    );
	reg [27:0] cnt;
    reg out_1hz;
    always@(posedge clk or negedge rst_n)
        if(~rst_n) begin
            cnt <= 0;
            out_1hz <= 0;
        end
        else if(cnt >= 50000000) begin
            cnt <= 0;
            out_1hz <= ~out_1hz;
            end
        else
            cnt<=cnt+1;
            
    wire [7:0] hour;
	wire [7:0] min;
	wire [7:0] sec;

	digital_clock inst_digital_clock(
		.clk(out_1hz),
		.rst_n(rst_n),
		.en(en),
		.adjust_hour(adjust_hour),
		.adjust_minute(adjust_minute),
		.hour(hour),
		.min(min),
		.sec(sec),
		.tweet(tweet)
		);

	wire [3:0] hex0; //第一个数码管显示的数字
    wire [3:0] hex1;
    wire [3:0] hex2;
    wire [3:0] hex3;
    wire [3:0] hex4;
    wire [3:0] hex5;
    
	//sec display
	assign hex0 = sec[3:0];
	assign hex1 = sec[7:4];

	//min display
	assign hex2 = min[3:0];
	assign hex3 = min[7:4];

	//hour display
	assign hex4 = hour[3:0];
	assign hex5 = hour[7:4];
    
	//共阳极数码管
	digital_tube_display inst_digital_tube_display(
		.clk(clk),
		.rst_n(rst_n),
		.hex0(hex0),
		.hex1(hex1),
		.hex2(hex2),
		.hex3(hex3),
		.hex4(hex4),
		.hex5(hex5),
		.dp_in(1),
		.an(an),
		.sseg(sseg)
		);
endmodule
