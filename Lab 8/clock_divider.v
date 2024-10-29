`timescale 1ns / 1ps
`default_nettype none

module clock_divider(ClkOut, ClkIn);
    // Input and outputs
    output wire [3:0] ClkOut; //4 bit output
    input wire ClkIn; //1 bit input
    
    parameter n = 25; //Makes Count 26 bits
    
    reg [n:0] Count; //Count bit is based on N parameter
    
    always@(posedge ClkIn) //Only activates when at positive edge of ClkIn
        Count <= Count + 1; //
    
    assign ClkOut[3:0] = Count[n:n-3];

    initial begin
        Count <= 0;
    end
 
endmodule
