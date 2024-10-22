`timescale 1ns / 1ps
module full_adder(S, Cout, A, B, Cin);
    //Inputs and outputs
    output wire S, Cout;
    input wire A, B, Cin;
    
    //Intermediate nets
    wire andBCin, andACin, andAB;
    
    assign #6 S=A^B^Cin;
    assign #4 andAB = A&B;
    assign #4 andBCin = B&Cin;
    assign #4 andACin = A&Cin;
    assign Cout = andAB | andBCin | andACin;
    
endmodule 