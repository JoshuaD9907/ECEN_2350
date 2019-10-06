`timescale 1 ns / 100 ps

module tb();

  wire [7:0] LEDR;
  reg [7:0] SWITCH;
  reg [1:0] KEY;

led_switch led_switch_inst(
	.LEDR(LEDR) ,	// output [7:0] LEDR_sig
	.SW(SWITCH) ,	// input [7:0] SW_sig
	.KEY(KEY) 	// input [1:0] KEY_sig
);

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
		$display("Starting simulation");
                //assign LEDR[7:0] = 8'b0000_0000;
                assign SWITCH[7:0] = 8'b0000_0000;
        $display("All zero inputs");
        #10	$display("%b", LEDR);
        $display("Press Button");
        #10     assign KEY[0] = 1'b1;
        #10	$display("%b", LEDR);
        $display("Input 01101010");
        assign SWITCH[7:0] = 8'b0110_1010;
        #10	$display("%b", LEDR);
	    #10	$display("Simulation ended.");
			$finish;
	  end

endmodule
