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
    output reg [7:0] an,   //Ƭѡ
    output reg [7:0] sseg  //��ѡ
    );
	
	localparam N = 19; //ʹ��16λ��50Mhz��ʱ�ӽ��з�Ƶ(50MHZ/2^16)
	reg [N-1:0] regN; //��Ƶ
	reg [3:0] hex_in; //��ѡ�����ź�
	reg dp; 
	
	always@(posedge clk)
	begin
	    regN <= regN + 1;
	end
	
	always@(posedge clk)
	begin
		case(regN[N-1:N-3])
		3'b000:begin
			an = 8'b11111110; //ѡ��1�������
			hex_in = hex0; //�������ʾ��������hex_in���ƣ���ʾhex0���������
			dp = dp_in[0]; //���Ƹ�����ܵ�С�������
		end
		3'b001:begin
			an = 8'b11111101; //ѡ�еڶ��������
			hex_in = hex1;
			dp = dp_in[1];
		end
		3'b010:begin
			an = 8'b11111011;
			hex_in = hex2;
			dp = dp_in[2];
		end
		3'b011: begin
			an = 8'b11110111;
			hex_in = hex3;
			dp = dp_in[3];
		end
		3'b100: begin
			an = 8'b11101111;
			hex_in = hex4;
			dp = dp_in[4];
		end
		3'b101: begin
			an = 8'b11011111;
			hex_in = hex5;
			dp = dp_in[5];
		end
		default:begin
			an = 8'b11111111;
			hex_in = 4'ha;
//			dp = 1'b1;
		end
		
		endcase
	
	end
	always@ *
	begin
		case(hex_in)
			4'h0: sseg[7:0] = 8'b0000_0011; //�����������
			4'h1: sseg[7:0] = 8'b1001_1111;
			4'h2: sseg[7:0] = 8'b0010_0101;
			4'h3: sseg[7:0] = 8'b0000_1101;
			4'h4: sseg[7:0] = 8'b1001_1001;
			4'h5: sseg[7:0] = 8'b0100_1001;
			4'h6: sseg[7:0] = 8'b0100_0001;
			4'h7: sseg[7:0] = 8'b0001_1111;
			4'h8: sseg[7:0] = 8'b0000_0001;
			4'h9: sseg[7:0] = 8'b0000_1001;
			4'ha: sseg[7:0] = 8'b1111_1111;
			default: sseg[7:0] = 8'b0000_0001;
		endcase
//		sseg[7] = dp;
	end
endmodule