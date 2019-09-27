module top(LEDR, SW, KEY[0]);
    input [7:0] SW;
    input KEY[0];
    output [7:0] LEDR;

    led_switch U0 (LEDR, SW, KEY[0]);

endmodule