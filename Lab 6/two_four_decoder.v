`timescale 1ns / 1ps
`default_nettype none


module two_four_decoder(Y, W, En);
    output reg [3:0]Y; //4 bit output 
    input wire [1:0]W; // 2 bit input
    input wire En; // 1 bit input
    
    always@(*)//Triggers when anything changes
        begin
            if(En == 1'b1)
                case(W)
                    2'b00: Y = 4'b0001; //When W = 00, Y == 0001
                    2'b01: Y = 4'b0010; //When W = 01, Y == 0001
                    2'b10: Y = 4'b0100; //When W = 10, Y == 0001
                    2'b11: Y = 4'b1000; //When W = 11, Y == 0001
                endcase //End of case
            else
                Y = 4'b0000; //Disables all outputs
        end     
          
endmodule
