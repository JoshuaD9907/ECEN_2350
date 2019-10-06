module Design2_top(SW[7:0], KEY[1:0], HEX5[7:0], HEX4[7:0], HEX3[7:0], HEX2[7:0], HEX1[7:0], HEX0[7:0]);
    input [7:0] SW;
    input [1:0] KEY;
    output [7:0] HEX5;
    output [7:0] HEX4;
    output [7:0] HEX3;
    output [7:0] HEX2;
    output [7:0] HEX1;
    output [7:0] HEX0;

    wire [3:0] inputx;
    wire [3:0] inputy;
    assign inputx = SW[7:4];
    always
        assign inputy = ~SW[3:0];
        if (KEY[0])
        assign inputy = SW[3:0];
    end
    
    //wire [3:0] bday1;
    //reg [3:0] bday;
    //wire [3:0] bday2;
    //assign bday1 =24'h030200;
    //assign bday2 =24'h090621;
    /*always @(KEY[1])
        begin
        bday[3:0]=bday1[3:0];
            if(KEY[1])
            bday[3:0]=bday2[3:0];
        end*/
    adder U0 ();

endmodule
