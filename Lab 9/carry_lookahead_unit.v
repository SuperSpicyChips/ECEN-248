`timescale 1ns / 1ps


module carry_lookahead_unit(C, G, P, C0);
    //Input and outputs
    output wire [4:1] C; //c4, c3, c2, c1  4bit
    input wire [3:0]G, P; //4 bit 
    input wire C0; //carry input
    
    assign C[1] = G[0] | P[0]&C0;
    assign C[2] = G[1] | P[1]&G[0] | C0&P[0]&P[1];
    assign C[3] = G[2] | P[2]&G[1] | G[0]&P[1]&P[2] | C0&P[0]&P[1]&P[2];
    assign C[4] = G[3] | P[3]&G[2] | G[1]&P[2]&P[3] | G[0]&P[1]&P[2]&P[3] | C0&P[0]&P[1]&P[2]&P[3];

endmodule
