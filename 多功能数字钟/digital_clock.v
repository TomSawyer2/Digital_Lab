//数字时钟计数器
module digital_clock(
	input clk,
	input rst_n,
	input en,
	input adjust_hour,
	input adjust_minute,
	input adjust_minute_10,
	output [7:0] hour,
	output [7:0] min,
	output [7:0] sec,
	output tweet
	);
 
 
wire co_sec1,co_sec,co_min,co_min1;
 
counter60 inst_sec(.clk(clk), .rst_n(rst_n), .en(en), .adjust_minute(adjust_minute), .adjust_minute_10(adjust_minute_10), .isMin(0), .dout(sec), .co(co_sec1));
and inst_and_sec(co_sec, en, co_sec1);
counter60 inst_min(.clk(clk), .rst_n(rst_n), .en(co_sec), .adjust_minute(adjust_minute), .adjust_minute_10(adjust_minute_10), .isMin(1), .dout(min), .co(co_min1));
and inst_and_min(co_min,co_sec,co_min1);

assign tweet = (min == 0 && sec < hour * 2 && sec % 2 == 0) ? 1 : 0; // report time signal

counter24 inst_hour(.clk(clk), .rst_n(rst_n), .en(en), .co_min(co_min), .adjust_hour(adjust_hour), .dout(hour));
 
endmodule
 