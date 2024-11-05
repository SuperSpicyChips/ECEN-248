`timescale 1ns / 1ps
`default_nettype none


module block_carry_lookahead_unit(G_star, P_star, C, G, P, C0);
//instantiate inputs and outputs
    output wire G_star, P_star;
    output wire [3:1]C; //C1, C2, C3
    input wire [3:0]G, P; //4bit generate and propogate
    input wire C0; //Carry
    
    assign P_star = P[0]&P[1]&P[2]&P[3];
    assign G_star = G[3] | G[2]&P[3] | G[1]&P[2]&P[3] | G[0]&P[1]&P[2]&P[3];
    assign C[3] = G[2] | G[1]&P[2] | G[0]&P[1]&P[2] | C0&P[0]&P[1]&P[2];
    assign C[2] = G[1] | G[0]&P[1] | C0&P[0]&P[1];
    assign C[1] = G[0] | P[0]&C0;


endmodule
