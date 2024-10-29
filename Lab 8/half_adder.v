`timescale 1ns / 1ps
`default_nettype none
/* This module describes the gate-level model of a half adder in Verilog */

module half_adder(S, Cout, A, B);

    /* declare output and input ports */
    // 1-bit wires
    input wire A, B; // 1-bit wires
    
    output wire S, Cout;
    
    /* use dataflow to describe the gate-level activity */
    assign S = A ^ B;
    assign Cout = A & B;
    
endmodule