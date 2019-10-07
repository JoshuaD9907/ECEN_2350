module adder(inputx, inputy, carryin, sum, carryout, overflow);
    output [3:0] sum;
    output carryout;
    input [3:0] inputx;
    input [3:0] inputy;
    input carryin;

    fullAdder add1(inputx[0], inputy[0], carryin, carryout);
    fullAdder add1(inputx[1], inputy[1], carryin, carryout);
    fullAdder add1(inputx[2], inputy[2], carryin, carryout);
    fullAdder add1(inputx[3], inputy[3], carryin, carryout);

endmodule 