module led_switch(LEDR, SW, KEY[0]);
    input [7:0] SW;
    input KEY[0];
    output reg [7:0] LEDR;
    always @ (SW[7:0], KEY[0])
        begin
          LEDR[7:0]=~SW[7:0];
          if (KEY[0])
            LEDR[7:0]=SW[7:0];
        end
endmodule