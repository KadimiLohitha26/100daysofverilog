// File: down_counter_tb.v
`timescale 1ns/1ps

module down_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the DUT
    down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tCount");
        $monitor("%0t\t%b\t%0d", $time, reset, count);

        clk = 0;
        reset = 1;  // Apply reset to load 1111
        #10;

        reset = 0;  // Begin counting down
        #100;

        reset = 1;  // Reset again to 1111
        #10;

        reset = 0;
        #50;

        $finish;
    end

endmodule

