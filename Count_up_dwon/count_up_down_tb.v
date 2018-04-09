`timescale 1ns / 1ps

module counter_tb();
    reg clk;
    reg isUP;
    reg reset;

    wire [3:0]q;

    counter UUT(
        clk,
        isUP,
        reset,
        q
    );

    initial 
      clk = 0;
    
    always
        #5 clk = ~clk;

    always begin
        isUP = 1;
        #150 isUP = 0;
        #150 isUP = 1;
    end

    initial
        reset = 0;

endmodule
