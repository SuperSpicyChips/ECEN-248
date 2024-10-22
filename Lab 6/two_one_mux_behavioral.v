`timescale 1ns / 1ps


module two_one_mux(Y, A, B, S);
//Defining intput and outputs
    output reg Y;
    input wire A, B, S;

    always@(A or B or S) //Whenever A, B, or S changes
        begin
            if(S==1'b0)  //When S = 1, 1'b0  1 bit binary value 0
                Y = A; //Drive Y with A
            else
                Y = B; //Driver Y with B
        end
        
endmodule
