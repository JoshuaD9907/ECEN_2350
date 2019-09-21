`timescale 1 ns / 100 ps

module tb();

  reg [7:0] LED;
  reg [7:0] SWITCH;
  reg KEY;

  top U1 (
    .led(LED),
    .switch(SWITCH),
    .key0(KEY)
    );

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
		$display("Starting simulation");
                LED[7:0] = 8'b0000_0000;
                SWITCH[7:0] = 8'b0000_0000;
        #10     SWITCH[0] = 1'b1;
        #10	$display(LED[0]);
	    #10	$display("Simulation ended.");
			$finish;
	  end

endmodule
