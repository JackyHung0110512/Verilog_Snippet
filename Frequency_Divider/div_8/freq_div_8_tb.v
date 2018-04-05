`timescale 1ns / 1ps

module my_freq_div_tb();
    reg clk;
    
    wire div_2;
    wire div_8;
    
    my_freq_div UUT(clk, div_2, div_8);
    
    initial
        clk = 0;
    
    always
        #5 clk = ~clk;
        
endmodule
