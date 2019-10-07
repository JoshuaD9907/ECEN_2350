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
    integer val1, val2, val3, val4, val5, s, over, in1, in2;

    always @(sum, overflow, input1, input2)
    begin
    s=sum;
    over=overflow;
    in1=input1;
    in2=input2;
    val4=in1;
    val2=in2;
    end

    always @(in1)
        begin
        if(in1>=0)
        begin
            val5=98;
        end
        if(in1<=0)
        begin
            val5=99;
        end
    end

    always @(in2)
        begin
        if(in2>=0)
        begin
            val3=98;
        end
        if(in2<=0)
        begin
            val3=99;
        end
    end
    
    always @(overflow, s)
        begin
        if(overflow>=0)
        begin
            val1=0;
            val0=15;
        end
        if(overflow<=0 && s>=0)
        begin
            val1=98;
            val0=s;
        end
        if(overflow<=0 && s<=0)
        begin
            val1=99;
            val0=s;
        end
    end
    


    sevenseg a0(val5, HEX5);
    sevenseg a1(val4, HEX4);
    sevenseg a2(val3, HEX3);
    sevenseg a3(val2, HEX2);
    sevenseg a4(val1, HEX1);
    sevenseg a5(val0, HEX0);
endmodule