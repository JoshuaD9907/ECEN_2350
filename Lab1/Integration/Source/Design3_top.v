module Design3_top(LEDR[9:0], SW[9:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0], input1, input2, select, LEDR);
    input [9:0] SW;
    input [1:0] KEY;
    output wire [9:0] LEDR;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output reg [3:0] input1;
    output reg [3:0] input2;
    output reg [3:0] select;
    reg [3:0] unsign;
    reg [3:0] twos;

    always @(KEY[0], SW[7:0])
    begin
        input2[3:0] = SW[3:0];
        input1[3:0] = SW[7:4];
    end

    always @(twos)
    begin
    twos[3:0]=4'b1100;
    unsign[3:0]=4'b0011;
    end

    always @(SW[9:8])
        begin
            case(SW[9:8])
            default:select[3:0]=unsign[3:0];
            2'b10:select[3:0]=unsign[3:0];
            2'b11:select[3:0]=twos[3:0];
            endcase
        end

    sevensegcall3 U0 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input2, select, LEDR);

endmodule
