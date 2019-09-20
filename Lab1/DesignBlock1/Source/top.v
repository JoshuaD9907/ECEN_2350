module top(led, switch, key0);
    input [7:0] switch;
    input key0;
    output [7:0] led;

    led_switch U0 (led, switch), key0;

endmodule