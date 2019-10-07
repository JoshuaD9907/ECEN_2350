module fullAdder(inputx, inputy, carryin, carryout, sum);
    input inputx, inputy, carryin;
    output carryout, sum;

    wire w1, w2, w3;
    
    and(w1, inputx, inputy);
	and(w2, inputx, carryin);
	and(w3, inputy, carryin);
	or(carryout, w1, w2, w3);
	xor(sum, inputx, inputy, carryin);

endmodule 