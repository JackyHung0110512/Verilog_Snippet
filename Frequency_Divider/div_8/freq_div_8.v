// example for divisor is equal to 2-order
`timescale 1ns / 1ps

module my_freq_div(
    input clk,
    output div_out_2,
    output div_out_8
    );
    reg [15:0]counter = 0;
    
    always@(posedge clk)
        counter <= counter + 1;
        
    // board clock freq / 2^(0+1)
    assign div_out_2 = counter[0];
    
    // board clock freq / 2^(2+1)
    assign div_out_8 = counter[2];
       
endmodule
