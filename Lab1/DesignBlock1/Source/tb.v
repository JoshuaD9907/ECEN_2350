`timescale 1 ns / 100 ps

module tb();

  wire [7:0] LED;
  wire [7:0] SWITCH;
  wire KEY;

  top U1 (
    .led(LED),
    .switch(SWITCH),
    .key(KEY)
    );

	initial
	  begin
		$dumpfile("output.vcd");
		$dumpvars;
		$display("Starting simulation");
                LED = 0;
                SWITCH = 0;
                b = 0;
        #10     a = 1;
        #10     b = 1;
	    #10     a = 0;
	    #10	$display("Simulation ended.");
			$finish;
	  end

  initial
    begin
      $monitor($time, "  a = %b,  b = %b,  c = %b", a, b, c);
    end
endmodule
