module sevensegcall3 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input2, select, LEDR);
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    input [3:0] input1;
    input [3:0] input2;
    input [3:0] select;
    reg [3:0] val1;
    reg [3:0] val5;
    reg [3:0] var;
    reg [3:0] state;
    reg signed [3:0] compare1;
    reg signed [3:0] compare2;
    reg unsigned [3:0] compare3;
    reg unsigned [3:0] compare4;
    output reg [9:0] LEDR;
    reg [3:0] blank;

    always @(state)
    begin
    state[3:0]=4'b0000;
    var[3:0]=4'b1000;
    blank[3:0]=4'b0001;
    end

    always @(input1, input2, select)
        begin
        if(select[3]==1)
            begin
            compare1 [3:0]= input1[3:0];
            compare2 [3:0]= input2[3:0];
            end
        if(select[3]==0)
            begin
            compare3 [3:0]= input1[3:0];
            compare4 [3:0]= input2[3:0];
            end
        end

    always @(compare1, compare2, compare3, compare4, select)
        begin
            if(compare1[3:0]>=compare2[3:0] && select[3]==1)
                begin
                LEDR[9:0]=10'b00_00_00_10;
                end
            if(compare1[3:0]<=compare2[3:0] && select[3]==1)
                begin
                LEDR[9:0]=10'b00_00_00_01;
                end
            if(compare1[3:0]==compare2[3:0] && select[3]==1)
                begin
                LEDR[9:0]=10'b00_00_01_00;
                end

            if(compare3[3:0]>=compare4[3:0] && select[3]==0)
                begin
                LEDR[9:0]=10'b00_00_00_10;
                end
            if(compare3[3:0]<=compare4[3:0] && select[3]==0)
                begin
                LEDR[9:0]=10'b00_00_00_01;
                end
            if(compare3[3:0]==compare4[3:0] && select[3]==0)
                begin
                LEDR[9:0]=10'b00_00_01_00;
                end
        end
            


    always @(input1, select)
        begin
        if(input1[3]==0 && select[3]==1)
        begin
            val5[3:0]=4'b0001; //blanks
        end
        if(input1[3]==1 && select[3]==1)
        begin
            val5[3:0]=4'b0100; //minus
        end
        if(select[3]==0)
        begin
            val5[3:0]=4'b0001;
        end
    end

    always @(input2, select)
        begin
        if(input2[3]==0 && select[3]==1)
        begin
            val1[3:0]=4'b0001;
        end
        if(input2[3]==1 && select[3]==1)
        begin
            val1[3:0]=4'b0100; //minus
        end
        if(select[3]==0)
        begin
            val1[3:0]=4'b0001;
        end
    end

    sevenseg3 a0(val5, state, select, HEX5);
    sevenseg3 a1(input1, var, select, HEX4);
    sevenseg3 a2(val1, state, select, HEX1);
    sevenseg3 a3(input2, var, select, HEX0);
    sevenseg3 a4(blank, state, select, HEX3);
    sevenseg3 a5(blank, state, select, HEX2);
endmodule