module fullAdder(sum, carryIn, carryOut, inputx, inputy);
    output sum;
    input carryIn;
    output carryOut;
    input inputx;
    input inputy;
    
    wire w1;
    wire w2;
    wire w3;
    wire w4;
    
    xor(w1, inputx, inputy);
    xor(sum, carryIn, w1);
    and(w2, inputx, inputy);   
    and(w3, inputx, carryIn);
    and(w4, inputy, carryIn);   
    or(carryOut, w2, w3, w4);
endmodule 