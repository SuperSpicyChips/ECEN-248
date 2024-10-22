`timescale 1ns / 1ps
`default_nettype none

module d_flip_flop(Q, notQ, Clk, D);
    //Input and outputs
    output wire Q, notQ; //1-bit output for slave latch
    input wire Clk, D; //1-bit input
    
    //Intermediate wires after initial gate
    wire notClk, notNotClk;
    wire Qm; //Output of master latch
    wire notQm; //unconnected
    
    assign notClk = ~Clk; //not clock = notClock
    assign notNotClk = ~(~Clk); // = not(notClock)
    
    //d_latch(output, output, input, input)
    d_latch dlatch0(Qm, notQm, notClk, D); //First D-Latch with inputs not clock and D
    d_latch dlatch1(Q, notQ, notNotClk, Qm); //2nd D-latch

endmodule
