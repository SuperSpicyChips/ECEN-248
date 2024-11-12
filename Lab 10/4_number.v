`timescale 1ns / 1ps

module combination_lock_4(
    //instantiating outputs and inputs
    output reg [1:0] state,
    output wire [3:0] Lock,  
    input wire Key0, //Unlock button 1
    input wire Key1, //Unlock button 2
    input wire [3:0] Password, //INdicate number
    input wire Reset, //Reset
    input wire Clk //Clock
    );
    
    //Next state temporary
    reg [2:0] nextState; //3-bit from 000-111
    
    //Parameters
    parameter S0 = 3'b000; 
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    
    always @(*) //Always
        case(state)
            S0:begin //State 0
               if (Password == 4'b1101 && Key0) //If password is 13 and button 1 is being pressed
                   nextState = S1; //Go to next state
               else
                   nextState = S0; //Stay at same state
               end
            S1:begin  //State 1
                if (Password == 4'b0111 && Key1) //If password is 7 and button 2 is pressed
                    nextState = S2; //Go to next state
                else
                    nextState = S0; //Reset to beginning
                end
            S2:begin //state 2
                if (Password == 4'b1001 && Key0) //If password is 9 and button 1 is pressed
                    nextState = S3; //Go top next state
                else
                    nextState = S0; //Reset
                end
            S3:begin //State 4
                if (Password == 4'b1011 && Key1) //If password is 11 and button 2 is pressed
                    nextState = S0; //If reset is pressed, goes back to initial state
                else
                    nextState = S4; //Else stays at state 3
                end
            S4:begin //State 4
                if(Reset == 1)
                    nextState = S0; //If reset is pressed, goes back to initial state
                else
                    nextState = S4; //Else stays at state 4
                end
         endcase
         
     always@(posedge Clk) //Whenever at Clk = 1
        if(Reset)
            state <= S0;  //If reset then State = S0
        else
            state <= nextState; //Else state = nextState
            
     assign Lock = (state == S4) ? 4'b1111 : 4'b0000; //If state = S4 lock = 1111 else lock = 0000
            
endmodule

