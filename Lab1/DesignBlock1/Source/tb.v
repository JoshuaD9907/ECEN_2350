`timescale 1 ns / 100 ps

module tb();

  wire [7:0] LEDR;
  reg [7:0] SWITCH;
  reg [1:0] KEY;

  wire [7:0] HEX0;
  wire [7:0] HEX1;
  wire [7:0] HEX2;
  wire [7:0] HEX3;
  wire [7:0] HEX4;
  wire [7:0] HEX5;

led_switch led_switch_inst(
	.LEDR(LEDR) ,	// output [7:0] LEDR_sig
	.SW(SWITCH) ,	// input [7:0] SW_sig
	.KEY(KEY) 	// input [1:0] KEY_sig
);

sevensegcall sevensegcall_inst(
	.KEY(KEY) ,	
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
		$display("Starting led switch simulation");
                assign SWITCH[7:0] = 8'b0000_0000;
        $display("All zero inputs");
        #10	$display("%b", LEDR);
        $display("Press Button");
        #10     assign KEY[0] = 1'b1;
        #10	$display("%b", LEDR);
        $display("Input 01101010");
        assign SWITCH[7:0] = 8'b0110_1010;
        #10	$display("%b", LEDR);
	    #10	$display("Ending led switch imulation.");
      $display("--------------------------------------------------");
      $display("Starting sevenseg simulation");
        $display("bday 1");
        #10 assign KEY[1] = 1'b0;
        #10 $display("%b", HEX5);
        #10 $display("%b", HEX4);
        #10 $display("%b", HEX3);
        #10 $display("%b", HEX2);
        #10 $display("%b", HEX1);
        #10 $display("%b", HEX0);
        $display("bday 2");
        #10 assign KEY[1] = 1'b1;
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

