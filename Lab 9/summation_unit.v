`timescale 1ns / 1ps


module summation_unit(S, P, C);

    //Instantiate input and output
    output wire[15:0]S; //Sum 16 bit
    input wire [15:0]P, C;// propogate and carry 16 bit
    
    assign S = P^C; //P xor C
endmodule
