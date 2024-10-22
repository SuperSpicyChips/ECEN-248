`timescale 1ns / 1ps

module adder_synchronous(Carry_reg, Sum_reg, Clk, A, B);
    //Outputs and inputs
    output reg Carry_reg; //1-bit output
    output reg [1:0] Sum_reg; //2-bit output
    input wire Clk; //1-bit input 
    input wire [1:0]A, B; //2-bit begin
    
    //Intermediate Nets
    reg [1:0] A_reg, B_reg; //2-bit registers
    wire Carry; //connect registers
    wire [1:0] Sum;
    
    // Instantiateing 2-bit adder
    adder_2bit add(Carry, Sum, A_reg, B_reg);
    
    //Input
    always@(posedge Clk) //Trigger at positive edge of Clk
        begin //because 2 statements
            A_reg <= A;
            B_reg <= B;
        end
    
    //Output
    always@(posedge Clk) 
        begin
            Carry_reg <= Carry; //Different bit width
            Sum_reg <= Sum;
        end
    
endmodule
