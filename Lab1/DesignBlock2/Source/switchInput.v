module switchInput(LEDR[2:0], SW[9:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [9:0] SW;
    input [1:0] KEY;
    output [2:0] LEDR;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;

    wire [3:0] input1;
    wire [3:0] input2;
    reg twos = 0;

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
        if(SW[9:8] == 2'b11)
        begin
            twos = 1;
            input1 = ~input1 + 1;
            input2 = ~input2 + 1;
        end
        if(input1 == input2)
            LEDR[2] = 1;
        begin
        if(input1 > input2)
            LEDR[1] = 1;
        begin
        if(input1 < input2)
            LEDR[0] = 1;
        begin
        end
    end

endmodule
