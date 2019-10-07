module Design2_top(SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0], sum[3:0], carry, overflow);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output [3:0] sum;
    output carry;
    integer overflow=0;

    wire [3:0] inputx;
    wire [3:0] inputy;
    assign inputx = SW[7:4];
    always @(KEY[0])
    begin
        assign inputy = ~SW[3:0];
        if (KEY[0])
        begin
        assign inputy = SW[3:0];
        end
    end
    assign carry=~KEY[0];
    adder U0 (inputx, inputy, carry, overflow, sum, carryout);
    sevensegcall2 U1 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input2, sum, overflow);

endmodule
