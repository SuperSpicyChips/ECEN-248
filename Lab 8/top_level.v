`timescale 1ns / 1ps
`default_nettype none

module top_level(LEDs, SWs, BTNs, FastClk);
    //Input and outputs
    output wire [3:0]LEDs; // 4 LEDs
    input wire [1:0]SWs, BTNs; //2 switches and buttons
    input wire FastClk;//1 bit input 
    
    //intermediate nets
    wire [3:0] Clocks;
    reg SlowClk;
    wire Carry2;
    wire [2:0]Count;
    
    always@(*)
        case(SWs) //When SW
            2'b00: SlowClk = Clocks[0];
            2'b01: SlowClk = Clocks[1];
            2'b10: SlowClk = Clocks[2];
            2'b11: SlowClk = Clocks[3];
        endcase
        
    //instantiate up_counter
    //Count, Carry2, En, Clk, Rst
    up_counter count(Count, Carry2, BTNs[0], SlowClk, BTNs[1]);
    
    assign LEDs[0] = Count[0];
    assign LEDs[1] = Count[1];
    assign LEDs[2] = Count[2];
    assign LEDs[3] = Carry2; 

    //Instantiate clock divider
    clock_divider clk_div0(
        .ClkOut(Clocks),
        .ClkIn(FastClk)
    );

endmodule
