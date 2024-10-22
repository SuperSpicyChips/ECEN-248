`timescale 1ns / 1ps

module adder_2bit(Carry, Sum, A, B);
    //Inputs and outputs
    output wire Carry; //1-bit output
    output wire [1:0]Sum; //2-bit output
    input wire [1:0]A, B; //2-bit input
    
    wire Cin; //initial carry from full-adder
    
    full_adder adder0(Sum[0], Cin, A[0], B[0], 1'b0);
    full_adder adder1(Sum[1], Carry, A[1], B[1], Cin);

endmodule
