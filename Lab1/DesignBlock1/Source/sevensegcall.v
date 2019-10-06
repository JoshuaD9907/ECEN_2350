module sevensegcall (HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, KEY);
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

    integer bday1;
    integer bday2;
    integer bday3;
    integer bday4;
    integer bday5;
    integer bday6;

    always @ (KEY[1])
        begin
            if(KEY[1])
            begin
                bday1 = bday1_1;
                bday2 = bday1_2;
                bday3 = bday1_3;
                bday4 = bday1_4;
                bday5 = bday1_5;
                bday6 = bday1_6;
            end
            if(~KEY[1])
            begin
                bday1 = bday2_1;
                bday2 = bday2_2;
                bday3 = bday2_3;
                bday4 = bday2_4;
                bday5 = bday2_5;
                bday6 = bday2_6;
            end
        end

    sevenseg a0(bday1, HEX5);
    sevenseg a1(bday2, HEX4);
    sevenseg a2(bday3, HEX3);
    sevenseg a3(bday4, HEX2);
    sevenseg a4(bday5, HEX1);
    sevenseg a5(bday6, HEX0);
endmodule