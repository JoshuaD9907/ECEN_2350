module Design2_top(SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0], sum[3:0], carryin, carryout, overflow, inputx, inputy);
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output [3:0] sum;
    output reg [7:0] SW;
    input carryin;
    output carryout;
    output reg overflow;
    output reg [3:0] inputx;
    output reg [3:0] inputy;
    wire carry1, carry2, carry3;

    always @(KEY[0], SW[7:0])
    begin
        inputy[3:0] = ~SW[3:0];
        inputx[3:0] = SW[7:4];
        if (KEY[0])
        begin
        inputy[3:0] = SW[3:0];
        end
    end

    assign carry=~KEY[0];

    always @(sum[3:0], inputy[3:0], inputx[3:0])
        begin
        overflow=0;
        if (inputy[3]==1 && inputx[3]==1 && sum[3]==0)
        begin
        overflow=1;
        end
        if (inputy[3]==0 && inputx[3]==0 && sum[3]==1)
        begin
        overflow=1;
        end
    end
    fullAdder U0(inputx[0], inputy[0], carryin, carry1, sum[0]);
    fullAdder U1(inputx[1], inputy[1], carry1, carry2, sum[1]);
    fullAdder U2(inputx[2], inputy[2], carry2, carry3, sum[2]);
    fullAdder U3(inputx[3], inputy[3], carry3, carryout, sum[3]);
    sevensegcall2 U4 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input2, sum, overflow);

endmodule
