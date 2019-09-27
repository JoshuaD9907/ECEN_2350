module led_switch(LEDR[7:0], SW, KEY[0]);
    input [7:0] SW;
    input [1:0] KEY;
    output reg [7:0] LEDR;
    always @ (SW[7:0], KEY[0])
        begin
          LEDR[7:0]=~SW[7:0];
          if (KEY[0])
            LEDR[7:0]=SW[7:0];
        end
endmodule