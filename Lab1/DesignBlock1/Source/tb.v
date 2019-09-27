`timescale 1 ns / 100 ps

module tb();

  reg [7:0] LEDR;
  reg [7:0] SWITCH;
  reg [1:0] KEY;

  top U1 (
    .LEDR(LEDR),
    .SW(SWITCH),
    .KEY(KEY)
    );

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
		$display("Starting simulation");
                LEDR[7:0] = 8'b0000_0000;
                SWITCH[7:0] = 8'b0000_0000;
        #10     SWITCH[0] = 1'b1;
        #10	$display(LEDR[0]);
	    #10	$display("Simulation ended.");
			$finish;
	  end

endmodule
