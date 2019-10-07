module Design2_top(SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;

    wire [3:0] inputx;
    wire [3:0] inputy;
    assign inputx = SW[7:4];
    always @(KEY[0])
    begin
        assign inputy = ~SW[3:0];
        if (KEY[0])
        assign inputy = SW[3:0];
    end
    adder U0 ();

endmodule
