`timescale 1ns / 1ps

module main_mod(
    input clk,
    output [1:0]out
);

    wire [3:0]my_wire;

    my_counter g1(clk, my_wire);
    my_buf g2(my_wire[3:2], out);

endmodule

module my_counter(
    input clk,
    output reg [3:0]cnt = 0
);

    always @(posedge clk)
        cnt <= cnt + 1;

endmodule

module my_buf(
    input [1:0]bin,
    output [1:0]bout
);
    assign bout = bin;

endmodule
