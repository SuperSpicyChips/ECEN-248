`timescale 1ns / 1ps

module sr_latch(Q, notQ, En, S, R);
    //Input and outputs
    output wire Q, notQ; // 1-bit outputs
    input wire En, S, R; //1-bit inputs
    
    //nandSEN is output of NAND(S, En)
    //nandREN is output of NAND(R, En)
    wire nandSEN, nandREN;
    
    //Delay of gate is 2ns
    nand #4 nand0(Q, nandSEN, notQ); 
    nand #4 nand1(notQ,nandREN, Q);
    nand #4 nand2(nandSEN, S, En);
    nand #4 nand3(nandREN, R, En);    
    
endmodule
