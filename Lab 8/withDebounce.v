`timescale 1ns / 1ps
`default_nettype none

module withDebounce(LEDs, BTN, Clk);
    //INputs and outputs
    output reg [3:0] LEDs;
    
    input wire BTN, Clk;

    /*-this is a keyword we have not seen yet!*
     *-as the name implies, it is a parameter *
     * that can be changed at compile time... */
    parameter n = 5;
    
    //Intermediate nets
    wire notMsb, Rst, En, Debounced;
    reg Synchronizer0, Synchronized;
    reg [n-1:0] Count;

    reg edge_detect0;
    wire rising_edge;
    /*This is just for simulation*/
     initial
        LEDs=0; 
    
   /********************************************/
   /* Debounce circuitry!!!                    */ 
   /********************************************/
    
    always@(posedge Clk) //When Clk at positive edge
      begin
        Synchronizer0 <= BTN;
        Synchronized <= Synchronizer0;
      end

    always@(posedge Clk) //When Clk at positive edge
        if(Rst) //If rst = 1'b1
            Count <= 0; //Count resets
        else if(En) //else if En = 1'b1
            Count <= Count + 1;  //Add 1 to count

    assign notMsb = ~Count[n-1];
    assign En = notMsb & Synchronized;
    assign Rst = ~Synchronized;
    assign Debounced = Count[n-1];

   /********************************************/
   /* End of Debounce circuitry!!!             */ 
   /********************************************/

    always@(posedge Clk)
        edge_detect0 <= Debounced;
    assign rising_edge = ~edge_detect0 & Debounced;

    always@(posedge Clk)
        if(rising_edge)
            LEDs <= LEDs + 1;

endmodule

