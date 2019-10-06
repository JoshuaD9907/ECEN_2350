module sevensegcall (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, KEY[1]);
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;

    integer bday1_1=0;
    integer bday1_2=3;
    integer bday1_3=0;
    integer bday1_4=2;
    integer bday1_5=0;
    integer bday1_6=0;

    integer bday2_1=0;
    integer bday2_2=8;
    integer bday2_3=0;
    integer bday2_4=7;
    integer bday2_5=0;
    integer bday2_6=0;

    always @ (KEY[1])
        begin
            if(KEY[1])
            reg x =sevenseg(bday1_1, HEX5);
            sevenseg(bday1_2, HEX4);
            sevenseg(bday1_3, HEX3);
            sevenseg(bday1_4, HEX2);
            sevenseg(bday1_5, HEX1);
            sevenseg(bday1_6, HEX0);
            if(~KEY[1])
            sevenseg(bday2_1, HEX5);
            sevenseg(bday2_2, HEX4);
            sevenseg(bday2_3, HEX3);
            sevenseg(bday2_4, HEX2);
            sevenseg(bday2_5, HEX1);
            sevenseg(bday2_6, HEX0);
        end
endmodule