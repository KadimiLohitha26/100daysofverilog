// File: tb_D_FF_negedge_highreset.v
`timescale 1ns/1ps

module D_FF_negedge_highreset_tb;

    reg clk;
    reg reset;
    reg D;
    wire Q;

    // Instantiate the DUT (Device Under Test)
    D_FF_negedge_highreset dut (
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q)
    );

    // Clock generation: 10ns period, falling edge at 5ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        D = 0;
        #10;  // Wait 10ns

        // Release reset
        reset = 0;
        D = 1;
        #10;

        D = 0;
        #10;

        D = 1;
        #10;

        // Assert reset again
        reset = 1;
        #7;

        reset = 0;
        D = 0;
        #10;

        D = 1;
        #10;

f        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tclk\treset\tD\tQ");
        $monitor("%g\t%b\t%b\t%b\t%b", $time, clk, reset, D, Q);
    end

endmodule

