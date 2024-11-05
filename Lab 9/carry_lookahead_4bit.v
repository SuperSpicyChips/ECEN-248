`timescale 1ns / 1ps
`default_nettype none


module carry_lookahead_4bit(Cout, S, X, Y, Cin);
//INput and outputs
    
    output wire Cout; //C4 for 4-bit adder
    output wire [3:0]S; // Sum
    input wire [3:0]X, Y; //4-bit addends
    input wire Cin;// Input carry
    
    //internal nets
    wire [3:0]G, P; //4-bit G and P
    wire [4:0]C;    // C for CLU
    assign C[0] = Cin;
    
    generate_propogate_unit gp(G, P, X, Y);
    carry_lookahead_unit clu(C[4:1], G, P, Cin);
    summation_unit sum(S, P, C[3:0]);
    
    assign Cout = C[4];
    
endmodule
