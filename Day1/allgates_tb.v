`timescale 1ns / 1ps

module tb_basic_gates;

    // Testbench signals
    reg A, B;
    wire AND_out, OR_out, NOT_A, NOT_B, NAND_out, NOR_out, XOR_out, XNOR_out;

    // Instantiate the basic_gates module
    basic_gates uut (
        .A(A),
        .B(B),
        .AND_out(AND_out),
        .OR_out(OR_out),
        .NOT_A(NOT_A),
        .NOT_B(NOT_B),
        .NAND_out(NAND_out),
        .NOR_out(NOR_out),
        .XOR_out(XOR_out),
        .XNOR_out(XNOR_out)
    );

    // Stimulus block
    initial begin
        $display(" A B | AND OR NOT_A NOT_B NAND NOR XOR XNOR");
        $display("----|----------------------------------------");

        // Test all input combinations
        A = 0; B = 0; #10;
        $display(" %b %b |  %b   %b    %b      %b     %b    %b   %b    %b", 
                 A, B, AND_out, OR_out, NOT_A, NOT_B, NAND_out, NOR_out, XOR_out, XNOR_out);

        A = 0; B = 1; #10;
        $display(" %b %b |  %b   %b    %b      %b     %b    %b   %b    %b", 
                 A, B, AND_out, OR_out, NOT_A, NOT_B, NAND_out, NOR_out, XOR_out, XNOR_out);

        A = 1; B = 0; #10;
        $display(" %b %b |  %b   %b    %b      %b     %b    %b   %b    %b", 
                 A, B, AND_out, OR_out, NOT_A, NOT_B, NAND_out, NOR_out, XOR_out, XNOR_out);

        A = 1; B = 1; #10;
        $display(" %b %b |  %b   %b    %b      %b     %b    %b   %b    %b", 
                 A, B, AND_out, OR_out, NOT_A, NOT_B, NAND_out, NOR_out, XOR_out, XNOR_out);

        $finish;
    end

endmodule
