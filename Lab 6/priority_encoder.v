`timescale 1ns / 1ps
`default_nettype none

module priority_encoder(
//Defining inputs and outputs
    output reg [1:0]Y, //2 bit output
    output wire zero, //1 bit output
    input wire [3:0]W //4 bit input  
    );
    
    assign zero =(W == 4'b0000);
    
    always@(W)//Triggers whenever W changes
        begin
            casex(W)
                4'b0001: Y = 2'b00; //When W[0] Y = 00
                4'b001X: Y = 2'b01; //W[1] Lit up
                4'b01XX: Y = 2'b10; //W[2] Lit up
                4'b1XXX: Y = 2'b11; //W[3] Lit up
                default: Y = 2'bXX; //default covers those not listed
            endcase
        end              
    
endmodule
