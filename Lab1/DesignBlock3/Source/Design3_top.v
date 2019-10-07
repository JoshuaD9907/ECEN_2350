module Design3_top(LEDR[2:0], SW[9:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [9:0] SW;
    input [1:0] KEY;
    output reg [2:0] LEDR;
    output reg [7:0] HEX5;
    output [7:0] HEX4;
    output reg [7:0] HEX3;
    output reg [7:0] HEX2;
    output reg [7:0] HEX1;
    output [7:0] HEX0;

    reg [3:0] input1;
    reg [3:0] input2;
    reg input1neg;
    reg input2neg;

    always @(SW[9:0])
    begin
            LEDR[2:0] = 0;
    
            input1[3] = SW[7];
            input1[2] = SW[6];
            input1[1] = SW[5];
            input1[0] = SW[4];

            input2[3] = SW[3];
            input2[2] = SW[2];
            input2[1] = SW[1];
            input2[0] = SW[0];

            HEX1[7:0] = 8'b11_11_11_11;
            HEX2[7:0] = 8'b11_11_11_11;
            HEX3[7:0] = 8'b11_11_11_11;
            HEX5[7:0] = 8'b11_11_11_11;

            input1neg = 0;
            input2neg = 0;

        if(SW[9:8] == 2'b11)
        begin
            //input1disp = input1;
            //input2disp = input2;
            if(SW[3] == 1)
            begin
                input1[3] = SW[7];
                input1[2] = SW[6];
                input1[1] = SW[5];
                input1[0] = SW[4];

                input2[3] = SW[3];
                input2[2] = SW[2];
                input2[1] = SW[1];
                input2[0] = SW[0];

                input1neg = 0;
                input2neg = 0;

                input2 = input2 - 1'd1;
                input2 = ~input2;
                HEX1[7:0] = 8'b10_11_11_11;

                input2neg = 1;
            end
            if(SW[3] == 0)
            begin
                input1[3] = SW[7];
                input1[2] = SW[6];
                input1[1] = SW[5];
                input1[0] = SW[4];

                input2[3] = SW[3];
                input2[2] = SW[2];
                input2[1] = SW[1];
                input2[0] = SW[0];

                input1neg = 0;
                input2neg = 0;

                HEX1[7:0] = 8'b11_11_11_11;

            end
            if(SW[7] == 1)
            begin
                input1 = input1 - 1'd1;
                input1 = ~input1;
                HEX5[7:0] = 8'b10_11_11_11;

                input1neg = 0;
                input2neg = 0;

                input1neg = 1;
            end
        end

            if(input1 == input2)
                LEDR[2] = 1;
            if(input1 > input2)
                LEDR[1] = 1;
            if(input1 < input2)
                LEDR[0] = 1;

        if((input1neg == 1) && (input2neg == 0))
        begin
            LEDR[0] = 1;
            LEDR[1] = 0;
            LEDR[2] = 0;
        end
        if((input2neg == 1) && (input1neg == 0))
        begin
            LEDR[0] = 0;
            LEDR[1] = 1;
            LEDR[2] = 0;
        end
        if((input2neg == 1) && (input1neg == 1))
        begin
            if(input1 == input2)
                LEDR[2] = 1;
            if(input1 > input2)
                LEDR[1] = 1;
            if(input1 < input2)
                LEDR[0] = 1;
        end
    end

    sevenseg3 s1 (input1, HEX4);
    sevenseg3 s5 (input2, HEX0);
endmodule
