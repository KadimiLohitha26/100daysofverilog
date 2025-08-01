// File: D_FF_negedge_highreset.v
module D_FF_negedge_highreset (
    input wire clk,
    input wire reset,  // Active-high asynchronous reset
    input wire D,
    output reg Q
);

always @(negedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule

