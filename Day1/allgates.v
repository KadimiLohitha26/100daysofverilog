module basic_gates (
    input A,
    input B,
    output AND_out,
    output OR_out,
    output NOT_A,
    output NOT_B,
    output NAND_out,
    output NOR_out,
    output XOR_out,
    output XNOR_out
);

    // Dataflow modeling using continuous assignments
    assign AND_out  = A & B;
    assign OR_out   = A | B;
    assign NOT_A    = ~A;
    assign NOT_B    = ~B;
    assign NAND_out = ~(A & B);
    assign NOR_out  = ~(A | B);
    assign XOR_out  = A ^ B;
    assign XNOR_out = ~(A ^ B);

endmodule
