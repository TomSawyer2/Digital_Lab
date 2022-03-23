`timescale 1ns / 1ps
module digital_tube_display(
    input clk,
    input rst_n,
    input [3:0] hex0, //��һ���������ʾ������
    input [3:0] hex1,
    input [3:0] hex2,
    input [3:0] hex3,
    input [3:0] hex4,
    input [3:0] hex5,
    input [5:0] dp_in, //С�������
    output reg [5:0] an,   //Ƭѡ
    output reg [7:0] sseg  //��ѡ
    );
	
	localparam N = 19; //ʹ��16λ��50Mhz��ʱ�ӽ��з�Ƶ(50MHZ/2^16)
	reg [N-1:0] regN; //��Ƶ
	reg [3:0] hex_in; //��ѡ�����ź�
	reg dp; 
	
	always@(posedge clk, posedge rst_n)
	begin
		if(rst_n)
			regN <= 0;
		else
			regN <= regN + 1;
	end
	
	always@ *
	begin
		case(regN[N-1:N-3])
		3'b000:begin
			an = 6'b111110; //ѡ��1�������
			hex_in = hex0; //�������ʾ��������hex_in���ƣ���ʾhex0���������
			dp = dp_in[0]; //���Ƹ�����ܵ�С�������
		end
		3'b001:begin
			an = 6'b111101; //ѡ�еڶ��������
			hex_in = hex1;
			dp = dp_in[1];
		end
		3'b010:begin
			an = 6'b111011;
			hex_in = hex2;
			dp = dp_in[2];
		end
		3'b011: begin
			an = 6'b110111;
			hex_in = hex3;
			dp = dp_in[3];
		end
		3'b010: begin
			an = 6'b101111;
			hex_in = hex4;
			dp = dp_in[4];
		end
		3'b011: begin
			an = 6'b011111;
			hex_in = hex5;
			dp = dp_in[5];
		end
		default:begin
			an = 6'b111111;
			hex_in = 0;
			dp = 1'b1;
		end
		
		endcase
	
	end
	always@ *
	begin
		case(hex_in)
			4'h0: sseg[6:0] = 7'b0000001; //�����������
			4'h1: sseg[6:0] = 7'b1001111;
			4'h2: sseg[6:0] = 7'b0010010;
			4'h3: sseg[6:0] = 7'b0000110;
			4'h4: sseg[6:0] = 7'b1001100;
			4'h5: sseg[6:0] = 7'b0100100;
			4'h6: sseg[6:0] = 7'b0100000;
			4'h7: sseg[6:0] = 7'b0001111;
			4'h8: sseg[6:0] = 7'b0000010;
			4'h9: sseg[6:0] = 7'b0000100;
			4'ha: sseg[6:0] = 7'b0001000;
			4'hb: sseg[6:0] = 7'b1100000;
			4'hc: sseg[6:0] = 7'b0110001;	
			4'hd: sseg[6:0] = 7'b1000010;
			4'he: sseg[6:0] = 7'b0110000;
			default: sseg[6:0] = 7'b0111000;
		endcase
		sseg[7] = dp;
	end
endmodule