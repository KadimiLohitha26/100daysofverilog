`timescale 1ns / 1ps

module up_counter_tb;

reg clk;
reg rst;
wire [3:0] count;

up_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Hold reset for some time
    #10;
    rst = 0;

    // Let the counter run for a few clock cycles
    #100;

    // Assert reset again
    rst = 1;
    #10;
    rst = 0;

    // Run again
    #50;

    // Finish simulation
f    $finish;
end

initial begin
    $monitor("Time = %0t | Reset = %b | Count = %b", $time, rst, count);
end

endmodule

