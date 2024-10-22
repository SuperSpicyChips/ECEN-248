`timescale 1ns / 1ps

module d_flip_flop_behavioral(Q, notQ, D, Clk);
    //Inputs and outputs
    output reg Q;
    output wire notQ;
    input wire D;
    input wire Clk;
    
    always@(posedge Clk) //Trigger edge is positive rising edge
        Q <= D; //Trigger whenever CLK is high
        
    assign notQ = ~Q;

endmodule
