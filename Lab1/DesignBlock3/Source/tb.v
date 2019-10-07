`timescale 1 ns / 100 ps

module tb();

  wire [9:0] LEDR;
  reg [9:0] SW;
  reg [1:0] KEY;
  wire [3:0] input1;
  wire [3:0] input2;
  wire [3:0] select;

  wire [7:0] HEX0;
  wire [7:0] HEX1;
  wire [7:0] HEX2;
  wire [7:0] HEX3;
  wire [7:0] HEX4;
  wire [7:0] HEX5;

sevensegcall3 sevensegcall3_inst
(
	.HEX5(HEX5) ,	// output [7:0] HEX5_sig
	.HEX4(HEX4) ,	// output [7:0] HEX4_sig
	.HEX3(HEX3) ,	// output [7:0] HEX3_sig
	.HEX2(HEX2) ,	// output [7:0] HEX2_sig
	.HEX1(HEX1) ,	// output [7:0] HEX1_sig
	.HEX0(HEX0) ,	// output [7:0] HEX0_sig
	.input1(input1) ,	// input [3:0] input1_sig
	.input2(input2) ,	// input [3:0] input2_sig
	.select(select) ,	// input [3:0] select_sig
	.LEDR(LEDR) 	// output [9:0] LEDR_sig
);

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
      $display("Starting simulation");
        $display("Input: Binary 4 and 4");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b0001000100;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
        $display("Input: Binary 1 and 4");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b0000010100;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
        $display("Input: Binary 7 and 2");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b0001110010;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
      #10	$display("Ending simulation.");
      $display("Input: 2s Compliment: -4 and -4");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b1111001100;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
        $display("Input: 2s Compliment: 7 and -4");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b1101111100;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
        $display("Input: 2s Compliment: -4 and -8");
        $display("7 Segment displays (Left to Right)");
        #10 assign SW = 10'b1111001000;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("LEDs (Left to Right)");
        #10 $display("%b", LEDR[2]);
        #10 $display("%b", LEDR[1]);
        #10 $display("%b", LEDR[0]);
			$finish;
	  end

endmodule

