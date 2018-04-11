`timescale 1ns / 1ps

module my_seven(
    //  MSB <--> LSB
    // in[3] in[2] in[1] in[0]
    input [3:0]in,
    // Left  <--> Right
    // an_sel[7] an_sel[6] ... an_sel[1] an_sel[0]
    input [7:0] an_sel,
    
    input dp_in,
    //        a         b         c         d        e         f         g
    // out[0] out[1] out[2] out[3] out[4] out[5] out[6] 
    output reg [6:0]out,
    output [7:0]an_out,
    output dp
    );
    
    always @(in) begin
        case(in)   //  7'b abcdefg  common-anthode 
            0: out = 7'b0_00_0_00_1;
            1: out = 7'b1_00_1_11_1;
            2: out = 7'b0_01_0_01_0;
            3: out = 7'b0_00_0_11_0;
            4: out = 7'b1_00_1_10_0;
            5: out = 7'b0_10_0_10_0;
            6: out = 7'b1_10_0_00_0;
            7: out = 7'b0_00_1_11_1;
            8: out = 7'b0_00_0_00_0;
            9: out = 7'b0_00_1_10_0;
            10: out = 7'b1_11_0_01_0;
            11: out = 7'b1_10_0_11_0;
            12: out = 7'b1_01_1_10_0;
            13: out = 7'b0_11_0_10_0;
            14: out = 7'b1_11_0_00_0;
            15: out = 7'b1_11_1_11_1;
            default: out = 7'b1111111;
        endcase
    end
    
    assign an_out = ~an_sel;
    assign dp = ~dp_in;
    
endmodule