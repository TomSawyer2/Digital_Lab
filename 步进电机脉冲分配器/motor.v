`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/16 20:02:20
// Design Name: 
// Module Name: motor
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


module motor(
    input M,
    input CP, CR,
    output reg [2:0] state
    );
    parameter S0=3'b100, S1=3'b101, S2=3'b001, S3=3'b011, S4=3'b010, S5=3'b110, S6=3'b000, S7=3'b111;
    always @(negedge CP or negedge CR)
        begin
            if(~CR) begin state <= S0; end // CRÏÂ½µÑØÉèÖÃS0Îª³õÌ¬
            else 
                case (state)
                    S0: begin; if (M == 1) state <= S1; else state <= S5; end
                    S1: begin; if (M == 1) state <= S2; else state <= S0; end
                    S2: begin; if (M == 1) state <= S3; else state <= S1; end
                    S3: begin; if (M == 1) state <= S4; else state <= S2; end
                    S4: begin; if (M == 1) state <= S5; else state <= S3; end
                    S5: begin; if (M == 1) state <= S0; else state <= S4; end
                    S6: begin; state <= S5; end
                    S7: begin; state <= S6; end
                    default: begin; state <= S0; end
                endcase
            end
endmodule
