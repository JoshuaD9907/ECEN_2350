module led_switch(led, switch, key0);
    input [7:0] switch;
    input key0;
    output reg [7:0] led;
    always @ (switch[7:0], key0)
        begin
          led[7:0]=switch[7:0];
          if (key0)
            led[7:0]=~switch[7:0];
        end
endmodule