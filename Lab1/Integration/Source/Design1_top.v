module Design1_top(LEDR[7:0], SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output wire [7:0] LEDR;

    led_switch U0 (LEDR, SW, KEY);
    sevensegcall U1 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, KEY);


endmodule
