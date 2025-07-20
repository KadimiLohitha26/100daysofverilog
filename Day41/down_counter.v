// File: down_counter.v
module down_counter (
    input clk,
    input reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b1111;  // Start from 15
        else
            count <= count - 1;
    end

endmodule

