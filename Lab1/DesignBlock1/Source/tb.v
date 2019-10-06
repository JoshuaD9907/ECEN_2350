`timescale 1 ns / 100 ps

module tb();

  wire [7:0] LEDR;
  reg [7:0] SWITCH;
  reg [1:0] KEY;

  reg [3:0] data;
  wire [7:0] display;

led_switch led_switch_inst(
	.LEDR(LEDR) ,	// output [7:0] LEDR_sig
	.SW(SWITCH) ,	// input [7:0] SW_sig
	.KEY(KEY) 	// input [1:0] KEY_sig
);

sevenseg sevenseg_inst(
	.data(data) ,	// input [3:0] data_sig
	.display(display) 	// output [7:0] display_sig
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
      $display("Starting sevenseg simulation");
      $display("bday 1");
      //#10 assign data =24'h030200;
      //$display("%b", display);
      $display("bday 2");
      //#10 assign data =24'h090621;
      //$display("%b", display);
      #10	$display("Ending sevenseg simulation.");
			$finish;
	  end

endmodule

