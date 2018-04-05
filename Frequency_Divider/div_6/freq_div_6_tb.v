`timescale 1ns / 1ps

module my_freq_div_tb();
    reg clk;
    
    wire my_out;
    
    my_freq_div UUT(clk, my_out);
    
    initial 
        clk = 0;
    
    always
        #5 clk = ~clk;
        
endmodule
