`timescale 1 ns / 100 ps

module tb();

  wire [9:0] LEDR;
  reg [9:0] SWITCH;

  wire [7:0] HEX0;
  wire [7:0] HEX1;
  wire [7:0] HEX2;
  wire [7:0] HEX3;
  wire [7:0] HEX4;
  wire [7:0] HEX5;

sevenseg sevenseg_inst(
  .LEDR(LEDR) ,	// output [7:0] LEDR_sig
  .SW(SWITCH),
	.HEX0(HEX0) ,
  .HEX1(HEX1) ,
  .HEX2(HEX2) ,
  .HEX3(HEX3) ,
  .HEX4(HEX4) ,
  .HEX5(HEX5)
);

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
      $display("Starting simulation");
        $display("Input: Binary 4 and 4");
        $display("7 Segment displays (Left to Right)");
        #10 assign SWITCH = 10'b0001000100;
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
        #10 assign SWITCH = 10'b0000010100;
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
        #10 assign SWITCH = 10'b0001110010;
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
        #10 assign SWITCH = 10'b1111001100;
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
        #10 assign SWITCH = 10'b1101111100;
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
        #10 assign SWITCH = 10'b1111001000;
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

