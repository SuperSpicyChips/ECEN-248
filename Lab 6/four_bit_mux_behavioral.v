`timescale 1ns / 1ps

module four_bit_mux(Y, A, B, S);
//Defining intput and outputs
    output reg [3:0]Y; //4 bit output
    input wire [3:0]A, B; //4 bit input
    input wire S; // 1 bit input

    always@(A or B or S) //Whenever A, B, or S changes
        begin
            if(S==1'b0)  //When S = 1, 1'b0  1 bit binary value 0
                Y = A; //Drive Y with A
            else
                Y = B; //Driver Y with B
        end
        
endmodule
