module Design1_top(LEDR[7:0], SW, KEY[0]);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] LEDR;

    led_switch U0 (LEDR, SW, KEY[0]);

endmodule