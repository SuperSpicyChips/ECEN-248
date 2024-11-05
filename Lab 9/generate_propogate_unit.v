`timescale 1ns / 1ps


module generate_propogate_unit(G, P, X, Y);
    //Instantiate input and output
    output wire[3:0]G, P; //4 bit output
    input wire[3:0]X, Y; //4bit input
    
    //2ns delay per gate
    assign #2 G[0] = X[0]&Y[0];
    assign #2 P[0] = X[0]^Y[0];
    
    assign #2 G[1] = X[1]&Y[1];
    assign #2 P[1] = X[1]^Y[1];
    
    assign #2 G[2] = X[2]&Y[2];
    assign #2 P[2] = X[2]^Y[2];
    
    assign #2 G[3] = X[3]&Y[3];
    assign #2 P[3] = X[3]^Y[3];
    
endmodule
