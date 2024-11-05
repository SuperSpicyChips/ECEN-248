`timescale 1ns / 1ps


module generate_propogate_unit(G, P, X, Y);
    //Instantiate input and output
    output wire[3:0]G, P; //4 bit output
    input wire[3:0]X, Y; //4bit input
    
    
    assign G[0] = X[0]&Y[0];
    assign P[0] = X[0]^Y[0];
    
    assign G[1] = X[1]&Y[1];
    assign P[1] = X[1]^Y[1];
    
    assign G[2] = X[2]&Y[2];
    assign P[2] = X[2]^Y[2];
    
    assign G[3] = X[3]&Y[3];
    assign P[3] = X[3]^Y[3];
    
endmodule
