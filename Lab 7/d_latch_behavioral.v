`timescale 1ns / 1ps

module d_latch_behavioral(Q, notQ, D, En);
    //Output and inputs
    output reg Q; //driven with behavioral statement
    output wire notQ;
    input wire D, En;
    
    always@(En or D)
        if(En) //if En != 1'b0
            Q = D;
            
    assign notQ = ~Q; //reg can drive wire
    
endmodule
