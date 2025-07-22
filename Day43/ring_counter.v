module ring_counter (
    input clk,
    input reset,
    output reg [3:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b1000;  // Initialize with only MSB = 1
        else
            q <= {q[2:0], q[3]};  // Rotate left
    end
endmodule

