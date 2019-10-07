module sevensegcall2 (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, sum);
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;
    input [3:0]sum;

    integer val1, val2, val3, val4, val5;

    sevenseg a0(val5, HEX5);
    sevenseg a1(val4, HEX4);
    sevenseg a2(val3, HEX3);
    sevenseg a3(val2, HEX2);
    sevenseg a4(val1, HEX1);
    sevenseg a5(val0, HEX0);
endmodule