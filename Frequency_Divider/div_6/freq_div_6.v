// duty cycyle is 50%

module my_freq_div(
    input clk,
    
    output reg my_out=0
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
