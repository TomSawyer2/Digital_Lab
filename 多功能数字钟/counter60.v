//ģ60��������Verilog HDL���
module counter60(clk, rst_n, en, adjust_minute,, isMin, dout, co);

input clk, rst_n, en, adjust_minute, isMin;
output[7:0] dout;
output co;
wire co10_1, co10, co6;
wire[3:0] dout10, dout6;
 
counter10 inst_counter10(.clk(clk), .rst_n(rst_n), .en(en), .adjust_minute(adjust_minute), .isMin(isMin), .dout(dout10), .co(co10_1)); //ģ10�������Ľ�λΪco10_1
and u3(co10, en,co10_1); //co10_1��en����Ϊco10
//and(col0, col0_1, 1);
counter6 inst_counter6(.clk(clk), .rst_n(rst_n), .en(co10), .dout(dout6), .co(co6)); //co10_1��en����Ϊco10,��Ϊģ6��������ʹ���ź�
and u4(co, co10, co6); //ģ6�������Ľ�λ��ģ6��ʹ���ź�co10������Ϊģ60�������Ľ�λ
 
assign dout = {dout6,dout10}; //ģ60���������������λΪģ6���������������λΪģ10�������������������8421BCD�����
 
endmodule
 

 

 
 