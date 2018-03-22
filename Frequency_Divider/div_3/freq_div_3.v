module my_freq_div(
    input clk,
    
    output my_out
    );
    
    reg [7:0]counter = 0;
    
    always @(posedge clk) begin
        if(counter==2)
            counter = 0;
        else
            counter = counter + 1;
    end
    
    assign my_out = counter[1];
    
endmodule
