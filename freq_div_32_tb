module my_counter_tb();
    reg clk;
    wire [31:0]counter;
    
    my_counter UUT(clk, counter);
    
    initial 
        clk = 0;
    
    always 
        #5 clk = ~clk;
    
endmodule
