// 1st divided by 3, 2nd divided by 2
// duty cycyle is 50%
`timescale 1ns / 1ps

module my_freq_div(
    input clk,
    
    output reg my_out = 0
    );
    
    reg [7:0]counter = 0;
    
    always @(posedge clk) begin
        if(counter==2)
            counter = 0;
        else
            counter = counter + 1;
    end
    
    always @(posedge clk) 
        if(counter==2)
            my_out = ~my_out;
        
endmodule
