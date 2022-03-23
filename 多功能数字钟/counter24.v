//8421BCD���������ģ24
module counter24(clk, rst_n, en, co_min, adjust_hour, dout);
 
input clk, rst_n, en, co_min, adjust_hour;
output[7:0] dout;
reg[7:0] dout;
 
always@(posedge clk or negedge rst_n)          //�첽��λ
begin
	if(!rst_n)       //��λ�ź���Чʱ���������
		dout <= 8'b00000000;
	else if(en == 1'b0)   //����ʹ����Чʱ���������
		dout <= dout;
	else if(co_min == 1'b0 && adjust_hour == 0)
	    dout <= dout;
	else if( (dout[7:4] == 4'b0010) && (dout[3:0] == 4'b0011) )  //�����ﵽ23ʱ���������
		dout <= 8'b00000000;
	else if(dout[3:0] == 4'b1001)       //��λ�ﵽ9ʱ����λ���㣬��λ��1
	begin
		dout[3:0] <= 4'b0000;
		dout[7:4] <= dout[7:4] + 1'b1;
	end
	else                     //���������û�з��������λ���䣬��λ��1
	begin
		dout[7:4] <= dout[7:4];
		dout[3:0] <= dout[3:0] + 1'b1;
	end
end
endmodule