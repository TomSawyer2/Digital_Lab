 //ģ10������ģ��
module counter10(clk, rst_n, en, adjust_minute, isMin, dout, co);
 
input clk, rst_n, en, adjust_minute, isMin;
output[3:0] dout;
reg [3:0] dout;
output co;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		dout <= 4'b0000;        //ϵͳ��λ������������
	else if(en == 1)
	   if(dout == 4'b1001)     //����ֵ�ﵽ9ʱ������������
           dout <= 4'b0000;
       else
           dout <= dout + 1'b1; //���򣬼�������1
	else if((en == 0 && adjust_minute == 1) && isMin == 1)
		if(dout == 4'b1001)     //����ֵ�ﵽ9ʱ������������
			dout <= 4'b0000;
		else
			dout <= dout + 1'b1; //���򣬼�������1
	else
		dout <= dout;
end
 
assign co = dout[0] & dout[3];  //�������ﵽ9(4'b1001)ʱ����λΪ1������ֵΪ��������û�н�λ
endmodule