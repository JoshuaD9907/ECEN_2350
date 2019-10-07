`timescale 1 ns / 100 ps

module tb2();

    reg [1:0] KEY;
    wire [7:0] LEDR;
    wire [7:0] HEX5;
    wire [7:0] HEX4;
    wire [7:0] HEX3;
    wire [7:0] HEX2;
    wire [7:0] HEX1;
    wire [7:0] HEX0;
    wire [3:0] sum;
    reg [7:0] SWITCH;
    wire carryout;
    wire carryin;
    wire overflow;
    wire [3:0] input1;
    wire [3:0] input2;
    wire carry1, carry2, carry3;

fullAdder fullAdder_inst(
	.input1(input1) ,
	.input2(input2) ,
	.carryin(carryin) ,
    .carryout(carryout) ,
    .sum(sum)
);

sevensegcall2 sevensegcall2_inst(	
    .HEX0(HEX0) ,
    .HEX1(HEX1) ,
    .HEX2(HEX2) ,
    .HEX3(HEX3) ,
    .HEX4(HEX4) ,
    .HEX5(HEX5) ,
    .sum(sum) ,
    .input1(input1) ,
	.input2(input2) ,
    .overflow(overflow)
);

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
		$display("Starting adder simulation");
        $display("Input 00100100");
                assign SWITCH[7:0] = 8'b0010_0100;
        $display("All positive inputs");
        #10	$display("%b", input1);
        #10	$display("%b", input2);
        #10	$display("%b", carryin);
        #10	$display("%b", carryout);
        #10	$display("%b", sum);
        $display("Subtract");
        #10     assign KEY[0] = 1'b1;
        #10	$display("%b", input1);
        #10	$display("%b", input2);
        #10	$display("%b", carryin);
        #10	$display("%b", carryout);
        #10	$display("%b", sum);
	    #10	$display("Ending adder imulation.");
      $display("--------------------------------------------------");
      $display("Starting sevenseg simulation");
        $display("Positive inputs and sum");
        #10 assign SWITCH[7:0]= 8'b0010_0010;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Negative and positive inputs and sum");
        #10 assign SWITCH[7:0]= 8'b1010_0010;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Negative inputs and sum");
        #10 assign SWITCH[7:0]= 8'b1111_1111;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Overflow");
        #10 assign SWITCH[7:0]= 8'b0010_0111;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Zero");
        #10 assign SWITCH[7:0]= 8'b0001_1111;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Positive inputs and subtract");
        #10 assign SWITCH[7:0]= 8'b0010_0001;
        #10     assign KEY[0] = 1'b1;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Negative and positive inputs and subtract");
        #10 assign SWITCH[7:0]= 8'b1110_0001;
        #10     assign KEY[0] = 1'b1;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Negative inputs and subtract");
        #10 assign SWITCH[7:0]= 8'b1110_1111;
        #10     assign KEY[0] = 1'b1;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("Overflow");
        #10 assign SWITCH[7:0]= 8'b1000_0111;
        #10     assign KEY[0] = 1'b1;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
      #10	$display("Ending sevenseg simulation.");
			$finish;
	  end

endmodule

