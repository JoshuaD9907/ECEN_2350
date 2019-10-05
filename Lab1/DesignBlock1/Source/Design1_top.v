module Design1_top(LEDR[7:0], SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    output reg [7:0] LEDR;
    parameter bday1 =24'h030200;
    parameter bday=bday1;
    parameter bday2 =24'h090621;
    always @(KEY[1])
        begin
        bday[3:0]=bday1[3:0];
            if(KEY[1])
            bday[3:0]=bday2[3:0];
        end
    led_switch U0 (LEDR, SW, KEY[0]);
    sevenseg U1 (bday, HEX5);

endmodule

