`timescale 1ns / 1ps

module combination_lock_fsm(
    //instantiating outputs and inputs
    output reg [1:0] state,
    output wire [3:0] Lock,  
    input wire Key1, //Unlock button 1
    input wire Key2, //Unlock button 2
    input wire [3:0] Password, //Indicate number
    input wire Reset, //Reset
    input wire Clk //Clock
    );
    
    //Next state temporary
    reg [2:0] nextState;
    
    //Parameters
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    always @(*) //Always
        if (Reset)
            nextState = S0; //If reset is ever pressed it goes to S0
        else
        case(state)
            S0:begin //State 0
                if (Key1 == 1'b1 && Password == 4'b1101) //If password is 13 and button 1 is being pressed
                    nextState = S1; //Go to next state
                else if (Key1 == 1'b1 && Password != 4'b1101)
                    nextState = S0; //reset
                else
                    nextState = S0; //Reset
                end
            S1:begin  //State 1
                if (Key2 == 1'b1 && Password == 4'b0111) //If password is 7 and button 2 is being pressed
                    nextState = S2; //Go to next state
                else if (Password != 4'b0111 && Key2 == 1'b1)
                    nextState = S0; //Reset
                else
                    nextState = S1; //Stay
                end
            S2:begin //state 2
                if (Key1 == 1'b1 && Password == 4'b1001) //If password is 13 and button 1 is being pressed
                    nextState = S3; //Go to next state
                else if (Password != 4'b1001 && Key1 == 1'b1)
                    nextState = S0; //Reset
                else
                    nextState = S2; //Stay
                end
            S3:begin //State 3
                nextState = S3; // set to S3
            end
         endcase
         
     always@(posedge Clk) //Whenever at Clk = 1
        begin
            state = nextState;
        end
            
    assign Lock = (state == S3) ? 4'b1111 : (state == S2) ? 4'b0111 : (state == S1) ? 4'b0011 : 4'b0001; //
            
endmodule
