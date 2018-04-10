`timescale 1ns / 1ps

module mod_cnt_tb();
    reg clk;
    wire [1:0]out;

    main_mod UUT(clk, out);

    initial 
        clk = 1;

    always
        #5 clk = ~clk;
endmodule
