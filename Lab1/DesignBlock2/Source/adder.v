module adder(inputx, inputy, carryin, overflow, sum, carryout);
    output [3:0] sum;
    output carryout;
    input [3:0] inputx;
    input [3:0] inputy;
    input carryin, overflow;

    fullAdder add1(inputx[0], inputy[0], carryin, carryout);
    fullAdder add2(inputx[1], inputy[1], carryin, carryout);
    fullAdder add3(inputx[2], inputy[2], carryin, carryout);
    fullAdder add4(inputx[3], inputy[3], carryin, carryout);

endmodule 