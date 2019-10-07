module Design2_top(SW[7:0], LEDR[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0], sum[3:0], carryout, overflow, input1, input2, input3);
    input [1:0] KEY;
    output reg [7:0] LEDR;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output [3:0] sum;
    input [7:0] SW;
    inout carryout;
    reg carryin;
    output reg overflow;
    output reg [3:0] input1;
    output reg [3:0] input2;
    output reg [3:0] input3;
    wire carry1, carry2, carry3;

    initial 
    begin
    LEDR[7:0] =10'b0010_0010_00;
    end

    always @(KEY[0], SW[7:0])
    begin
        input2[3:0] = ~SW[3:0];
        input3[3:0] = SW[3:0];
        input1[3:0] = SW[7:4];
        if (KEY[0])
        begin
        input2[3:0] = SW[3:0];
        input1[3:0] = SW[7:4];
        end
    end

    always @(KEY[0])
    begin
    carryin=~KEY[0];
    end

    always @(sum[3:0], input2[3:0], input1[3:0])
        begin
        overflow=0;
        if (input2[3]==1 && input1[3]==1 && sum[3]==0)
        begin
        overflow=1;
        end
        if (input2[3]==0 && input1[3]==0 && sum[3]==1)
        begin
        overflow=1;
        end
    end
    fullAdder U0(input1[0], input2[0], carryin, carry1, sum[0]);
    fullAdder U1(input1[1], input2[1], carry1, carry2, sum[1]);
    fullAdder U2(input1[2], input2[2], carry2, carry3, sum[2]);
    fullAdder U3(input1[3], input2[3], carry3, carryout, sum[3]);
    sevensegcall2 U4 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input3, sum, overflow);

endmodule
