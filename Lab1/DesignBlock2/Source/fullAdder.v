module fullAdder(input1, input2, carryin, carryout, sum);
    input input1, input2, carryin;
    output carryout, sum; 
    wire w1,w2,w3;
    
    xor(w1, input1, input2);
    xor(sum, w1, carryin);
    and(w2, w1, carryin);   
    and(w3, input1, input2); 
    or(carryout, w2, w3);
endmodule