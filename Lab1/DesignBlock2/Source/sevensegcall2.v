module sevensegcall2 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, input1, input2, sum, overflow);
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    input [3:0]sum;
    input [3:0]input1;
    input [3:0]input2;
    reg [3:0] val0;
    reg [3:0] val1;
    reg [3:0] val2;
    reg [3:0] val3;
    reg [3:0] val4;
    reg [3:0] val5;
    output overflow;

    always @(input1)
        begin
        if(input1[3]==0)
        begin
            val5[3:0]=4'b0001; //blanks
        end
        if(input1[3]==1)
        begin
            val5[3:0]=4'b0100; //minus
        end
    end

    always @(input2)
        begin
        if(input2[3]==0)
        begin
            val3[3:0]=4'b0001;
        end
        if(input2[3]==1)
        begin
            val3[3:0]=4'b0100;
        end
    end
    
    always @(overflow, sum)
        begin
        if(overflow>=0)
        begin
            val1[3:0]=4'b0000;
            val0[3:0]=4'b1000;
        end
        if(overflow<=0 && sum[3]==0)
        begin
            val1[3:0]=4'b0001;
            val0[3:0]=sum[3:0];
        end
        if(overflow<=0 && sum[3]==1)
        begin
            val1[3:0]=4'b0100;
            val0[3:0]=sum[3:0];
        end
    end

    sevenseg a0(x, val5, HEX5);
    sevenseg a1(val4, x, HEX4);
    sevenseg a2(x, val3, HEX3);
    sevenseg a3(val2, x, HEX2);
    sevenseg a4(x, val1, HEX1);
    sevenseg a5(val0, x, HEX0);
endmodule