`timescale 1ns / 1ps


module generate_propogate_unit(G, P, X, Y);
    //Instantiate input and output
    output wire[15:0]G, P; //16 bit output
    input wire[15:0]X, Y; //16 bit input
    
    
    assign G = X&Y;  //X and Y
    assign P = X^Y; // X xor Y
    
endmodule
