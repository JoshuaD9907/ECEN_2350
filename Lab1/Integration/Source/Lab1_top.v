module Lab1_top(LEDR[9:0], SW[9:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [9:0] SW;
    input [1:0] KEY;
    output reg [7:0] HEX5;
    output reg [7:0] HEX4;
    output reg [7:0] HEX3;
    output reg [7:0] HEX2;
    output reg [7:0] HEX1;
    output reg [7:0] HEX0;
    output reg [9:0] LEDR;

    wire [7:0] HEX5OUT;
    wire [7:0] HEX4OUT;
    wire [7:0] HEX3OUT;
    wire [7:0] HEX2OUT;
    wire [7:0] HEX1OUT;
    wire [7:0] HEX0OUT;
    wire [7:0] LEDROUT;

    always @ (SW[9:8])
        begin
            LEDR[9:8]=SW[9:8];
                LEDR[7:0] = 8'b1111_1111;
                HEX5 = 8'b1111_1111;
                HEX4 = 8'b1111_1111;
                HEX3 = 8'b1111_1111;
                HEX2 = 8'b1111_1111;
                HEX1 = 8'b1111_1111;
                HEX0 = 8'b1111_1111;
            if(SW[9:8] == 2'b00)
            begin
                LEDR[7:0] = LEDROUT[7:0];
                HEX5 = HEX5OUT;
                HEX4 = HEX4OUT;
                HEX3 = HEX3OUT;
                HEX2 = HEX2OUT;
                HEX1 = HEX1OUT;
                HEX0 = HEX0OUT;
            end
            /*if(SW[9:8] == 2'b01)
            begin
                
            end
            if(SW[9] == 2'b1)
            begin
                
            end*/
        end

    Design1_top u0 (LEDROUT[7:0], SW[7:0], KEY[1:0], HEX5OUT[7:0], HEX4OUT[7:0], HEX3OUT[7:0], HEX2OUT[7:0], HEX1OUT[7:0], HEX0OUT[7:0]);
    //Design2_top u1 ();
    //Design3_top u2 ();
    
    

endmodule
