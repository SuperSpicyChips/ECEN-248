`timescale 1ns / 1ps
`default_nettype none

module tlc_controller(
    //instantiate input and ouptut
    output wire [1:0] highwaySignal, farmSignal,
    output wire [3:0] JB,
    input wire Clk,
    input wire Rst,
    input wire farmSensor
    );
    
    //intermediate nets\
    wire RstSync;
    wire RstCount;
    reg [30:0] Count;
    
    assign JB[3] = RstCount;
    
    //synchronize button inputs
    synchronizer syncRst(RstSync, Rst, Clk);
    
    //instantiate FSM
    tlc_fsm FSM(
            .state(JB[2:0]),
            .Clk(Clk),
            .Rst(RstSync),
            .highwaySignal(highwaySignal),
            .farmSignal(farmSignal),
            .RstCount(RstCount),
            .Count(Count),
            .farmSensor(farmSensor)
    );
    
    // counter
    always@(posedge Clk)
        if(Rst) //reset
            Count = 0;
        else
            Count = Count + 1; //add 1
endmodule
