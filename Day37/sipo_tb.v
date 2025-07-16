module tb_sipo_shift_register;

    reg clk;
    reg rst;
    reg serial_in;
    wire [3:0] parallel_out;

    // Instantiate the module
    sipo_shift_register uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        serial_in = 0;

        // Apply reset
        #10;
        rst = 0;

        // Apply serial input bits one by one (e.g., 1 0 1 1)
        #10 serial_in = 1;  // shift in '1'
        #10 serial_in = 0;  // shift in '0'
        #10 serial_in = 1;  // shift in '1'
        #10 serial_in = 1;  // shift in '1'
        #10 serial_in = 0;  // optional extra bit

        // Observe output
        #20;

        $display("Final Parallel Output: %b", parallel_out);
        $finish;
    end

endmodule

