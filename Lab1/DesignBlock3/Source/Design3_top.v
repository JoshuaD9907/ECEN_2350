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
    reg [2:0] input12s;
    reg [2:0] input22s;
    //reg twos = 0;

    /*HEX5[7:0] = 8'b11_11_11_11;
    HEX4[7:0] = 8'b11_11_11_11;
    HEX3[7:0] = 8'b11_11_11_11;
    HEX2[7:0] = 8'b11_11_11_11;
    HEX1[7:0] = 8'b11_11_11_11;
    HEX0[7:0] = 8'b11_11_11_11;*/

    always @(SW[9:0])
    begin
            LEDR[2:0] = 0;
            //twos = 0;
    
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
        if(SW[9:8] == 2'b11)
        begin
            //twos = 1;
            input1 = input1 - 1;
            input2 = input2 - 1;
            input1 = ~input1;
            input2 = ~input2;

            HEX1[7:0] = 8'b11_11_11_11;
            HEX2[7:0] = 8'b11_11_11_11;
            HEX3[7:0] = 8'b11_11_11_11;
            HEX5[7:0] = 8'b11_11_11_11;

            //if(input1[3] == 1 & input2[3] == 1)
            //begin
            HEX1[7:0] = 8'b11_11_11_11;
            HEX5[7:0] = 8'b11_11_11_11;
            //end
            /*if(input1[3] == 0 & input2[3] == 0)
            begin
                input12s = -input1[2:0];
                input22s = -input2[2:0];
                input1[3] = 1'b0;
                input1[2:0] = input12s;
                input2[3] = 1'b0;
                input2[2:0] = input22s;
            end*/
            if(input1[3] == 1)
                input12s = -input1[2:0];
                //input22s = input2[2:0];
                input1[3] = 1'b0;
                input1[2:0] = input12s;
                //input2[3] = 1'b0;
                //input2[2:0] = input22s;
                HEX5[7:0] = 8'b10_11_11_11;
            if(input2[3] == 1)
                input22s = -input2[2:0];
                //input12s = input1[2:0];
                //input1[3] = 1'b0;
                //input1[2:0] = input12s;
                input2[3] = 1'b0;
                input2[2:0] = input22s;
                HEX1[7:0] = 8'b10_11_11_11;
        end


        if(input1 == input2)
            LEDR[2] = 1;
        if(input1 > input2)
            LEDR[1] = 1;
        if(input1 < input2)
            LEDR[0] = 1;

        /*if(twos)
        begin
            if(input12s == input22s)
                LEDR[2] = 1;
            if(input12s > input22s)
                LEDR[1] = 1;
            if(input12s < input22s)
                LEDR[0] = 1;
        end*/
    end

    //sevenseg s0 (8'd98, HEX5);
    sevenseg s1 (input1, HEX4);
    //sevenseg s2 (8'd98, HEX3);
    //sevenseg s3 (8'd98, HEX2);
    //sevenseg s4 (8'd98, HEX1);
    sevenseg s5 (input2, HEX0);
endmodule
