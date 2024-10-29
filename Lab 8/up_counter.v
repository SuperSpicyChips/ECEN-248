`timescale 1ns / 1ps
`default_nettype none

module up_counter(Count, Carry2, En, Clk, Rst);
    //instantiating inputs and outputs
    output reg [2:0] Count; //3 bit output
    output wire Carry2; //1 bit output
    input wire En, Clk, Rst; // 1 bit inputs
    
    //intermediate nets
    wire [2:0] Carry, Sum;
    
    Threebit_counter UC1(Sum, Carry2, Count, En);
    
    always@ (posedge Clk or posedge Rst) //If at Clk or Rst posedge
        if (Rst) // if Rst == 1`b1
            Count <= 0; // reset count
        else
            Count <= Sum; //Latch the sum
endmodule


module Threebit_counter(Sum, Carry2, Count, En);
    //declaring variables
    input wire En; // 1 bit
    input wire [2:0]Count; // 3 bit
    output wire [2:0]Sum; // 3 bit
    output wire Carry2; //1 bit
    
    //intermediate net
    wire [2:0]Carry; //3 bit
    
    //Instantiate and wire half-adder
    //S, Cout, A, B
    half_adder h0(Sum[0], Carry[0], En, Count[0]);
    half_adder h1(Sum[1], Carry[1], Carry[0], Count[1]);
    half_adder h2(Sum[2], Carry[2], Carry[1], Count[2]);
    
    assign Carry2 = Carry[2];

endmodule