`timescale 1ns / 1ps


module tlc_fsm(
    //instantiate inputs and outputs
    output reg [2:0] state, 
    output reg RstCount,
    output reg [1:0] highwaySignal, farmSignal,
    input wire [30:0] Count,
    input wire Clk, Rst
    );
    
    //Parameters
    parameter S0 = 3'b001,
              S1 = 3'b010,
              S2 = 3'b011,
              S3 = 3'b100,
              S4 = 3'b101,
              S5 = 3'b110;
              
    //intermediate nets
    reg [2:0] nextState; //3 bits for 5 states
    
    always@(*)
        case(state)
            S0: begin //State 0
                if (Count == 50000000) //if at 1 second
                begin //If right count then next color
                    highwaySignal = 2'b11; //red
                    farmSignal = 2'b01; //red
                    RstCount = 1;
                    nextState = S1; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b01;
                    farmSignal = 2'b01;
                    RstCount = 0;
                    nextState = S0; //Stay
                end
            end
            S1: begin //State 1
                if (Count == 1500000000) //if at 30 second
                begin
                    highwaySignal = 2'b10; //green
                    farmSignal = 2'b01; //red
                    RstCount = 1;
                    nextState = S2; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b11;
                    farmSignal = 2'b01;
                    RstCount = 0;
                    nextState = S1; //Stay
                end
            end
            S2: begin //State 2
                if (Count == 150000000) //if at 3 second
                begin
                    highwaySignal = 2'b10; //yellow
                    farmSignal = 2'b01; //red
                    RstCount = 1;
                    nextState = S3; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b01;
                    farmSignal = 2'b01;
                    RstCount = 0;
                    nextState = S2; //Stay
                end
            end
            S3: begin //State 3
                if (Count == 50000000) //if at 1 second
                begin
                    highwaySignal = 2'b01; //red
                    farmSignal = 2'b11; //red
                    RstCount = 1;
                    nextState = S4; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b11;
                    farmSignal = 2'b01;
                    RstCount = 0;
                    nextState = S3; //Stay
                end
            end
            S4: begin //State 4
                if (Count == 750000000) //if at 15 second
                begin
                    highwaySignal = 2'b01; //red
                    farmSignal = 2'b10; //green
                    RstCount = 1;
                    nextState = S5; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b01;
                    farmSignal = 2'b11;
                    RstCount = 0;
                    nextState = S4; //Stay
                end
            end
            S5: begin //State 5
                if (Count == 150000000) //if at 3 second
                begin
                    highwaySignal = 2'b01; //red
                    farmSignal = 2'b01; //yellow
                    RstCount = 1;
                    nextState = S0; //Moves to state 1
                end
                else begin
                    highwaySignal = 2'b01;
                    farmSignal = 2'b10;
                    RstCount = 0;
                    nextState = S5; //Stay
                end
            end
        endcase
    always@(posedge Clk)
        if(Rst)
            state <= S0;
        else
            state <= nextState;
              
endmodule
