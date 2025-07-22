module ring_counter_tb;
    reg clk;
    reg reset;
    wire [3:0] q;

    // Instantiate the ring counter
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Generate clock: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Apply stimulus
    initial begin
        $monitor("Time=%0t | Reset=%b | Q=%b", $time, reset, q);

        // Initialize
        reset = 1;
        #10;
        reset = 0;

        // Let it run for 40 clock cycles
        #200;

f        $finish;
    end
endmodule

