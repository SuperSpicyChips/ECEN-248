`timescale 1ns / 1ps

module combination_lock_fsm(
    //instantiating outputs and inputs
    output reg [1:0] state,
    output wire [3:0] Lock,  
    input wire Key1, //Unlock button 1
    input wire Key2, //Unlock button 2
    input wire [3:0] Password, //INdicate number
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
        case(state)
            S0:begin //State 0
               if (Password == 4'b1101 && Key0) //If password is 13 and button 1 is being pressed
                   nextState = S1; //Go to next state
               else
                   nextState = S0; //Stay at same state
               end
            S1:begin  //State 1
                if (Key2) //IF Key 2 is being pressed
                    if (Password == 4'b0111) //if correct password then go next
                        nextState = S2;
                    else
                        nextState = S0;  //else if wrong then reset
                end
            S2:begin //state 2
                if (Key1) //If key 1 is being pressed
                    if (Password == 4'b1001) //If correct password
                        nextState = S3; //Go next
                    else
                        nextState = S0; //else reset
                end
            S3:begin //State 3
                if(Reset == 1)
                    nextState = S0; //If reset is pressed, goes back to initial state
                else
                    nextState = S3; //Else stays at state 3
                end
         endcase
         
     always@(posedge Clk) //Whenever at Clk = 1
        if(Reset)
            state <= S0;  //If reset then State = S0
        else
            state <= nextState; //Else state = nextState
            
     assign Lock = (state == S3) ? 4'b1111 : 4'b0000; //If state = S3 lock = 1111 else lock = 0000
            
endmodule

