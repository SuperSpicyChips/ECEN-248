`timescale 1ns / 1ps
`default_nettype none


module four_two_encoder(Y, W, zero);
//Defining input and output
    output reg [1:0]Y; //2 bit output
    output wire zero; //1 bit output
    input wire [3:0]W; // 4 bit input
    
    assign zero =(W == 4'b0000);
    
    always@(W) //Triggers when W changes
        begin 
            case(W)//Based on W
                4'b0001: Y = 2'b00; //W[0]If W = 0001, Y = 00
                4'b0010: Y = 2'b01; //W[1]If W = 0010, Y = 01
                4'b0100: Y = 2'b10; //W[2]If W = 0100, Y = 10
                4'b1000: Y = 2'b11; //W[3]If W = 1000, Y = 11
                default: Y = 2'bXX; //don't care
            endcase // End of case
        end
                
    
endmodule
