`timescale 1ns / 1ps


module summation_unit(S, P, C);

    //Instantiate input and output
    output wire[3:0]S; //Sum
    input wire [3:0]P, C;// propogate and carry
    
    //2ns delay for gate
    assign #2 S = P^C; //P xor C
endmodule
