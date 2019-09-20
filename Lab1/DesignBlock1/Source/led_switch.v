module led_switch(led, switch, key0);
    input [7:0] switch;
    input key0;
    output [7:0] led;
    always @ ([7:0] switch, key0)
        begin
          led=switch;
          if (key0)
            led=~switch;
        end
endmodule