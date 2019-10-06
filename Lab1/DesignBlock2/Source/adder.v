module adder(sum, carry, inputx, inputy, overflow, operation);
    output [3:0] sum;
    output carry;
    input [0:3] inputx;
    input [0:3] inputy;
    output overflow;
    input operation;

    wire y1;
    wire y2;
    wire y3;
    wire y4;

    wire c1;
    wire c2;
    wire c3;
    wire c4;

    xor(y1, inputy[0], operation);
    xor(y2, inputy[1], operation);
    xor(y3, inputy[2], operation);
    xor(y4, inputy[3], operation);
    xor(carry, c3, Op);
    xor(overflow, c3, c2);

    fullAdder add1(sum[0], c1, inputx[0], y1, operation); 
    fullAdder add2(sum[1], c2, inputx[1], y2, c1);
    fullAdder add3(sum[2], c3, inputx[2], y3, c2);
    fullAdder add4(sum[3], c4, inputx[3], y4, c3);

endmodule 