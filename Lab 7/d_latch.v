`timescale 1ns / 1ps

module d_latch(Q, notQ, En, D);
    //Input and outputs
    output wire Q, notQ; //1-bit outputs
    input wire D, En; //1-bit inputs
    
    //Intermediate Wires after initial gate
    wire nandDEN, nandnotEn; //Output for first 2 nand gates
    
    assign nandDEN = ~(En & D);
    assign nandnotEn = ~(En & ~D);
    
    nand #2 nand0(Q, nandDEN, notQ); // Q output 
    nand #2 nand1(notQ, nandnotEn, Q); //notQ output

endmodule
