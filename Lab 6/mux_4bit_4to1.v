`timescale 1ns / 1ps

module mux_4bit_4to1(Y, A, B, C, D, S);
    //Defining input and output
    output reg [3:0] Y; //4 bit output
    input wire [3:0] A, B, C, D; //4 bit input
    input wire [1:0] S; // 2 bit input
    
    always@(*)//* means trigger anything that changes
        case(S)//Selection based on S
            2'b00: Y = A; //When S = 2'b00
            2'b01: Y = B; //When S = 2'b01
            2'b10: Y = C; //When S = 2'b10
            2'b11: Y = D; //When S = 2'b11
        endcase
    
endmodule
