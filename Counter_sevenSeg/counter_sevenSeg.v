`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/04/11 09:11:01
// Design Name: 
// Module Name: counter_seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counter_seg(
    input clk,
    input isUP,
    output [6:0]out,
    output [7:0]an_out,
    output dp
    );
    wire [31:0]my_wire;
    wire [7:0]my_wire2;
 
    
    my_counter g1(clk, isUP, my_wire);
    my_decode g2(my_wire[25:23], my_wire2);
    my_seven g3(my_wire[29:26], my_wire2, 0, out, an_out, dp);
endmodule

module my_counter(
    input clk,
    input isUP,
    output reg [31:0]counter = 0
    );
    
    always @(posedge clk)
        if(isUP==1)
            counter <= counter + 1;
        else
            counter <= counter - 1;
endmodule



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
            0: out = 7'b0000001;
            1: out = 7'b1001111;
            2: out = 7'b0010010;
            3: out = 7'b0000110;
            4: out = 7'b1001100;
            5: out = 7'b0100100;
            6: out = 7'b1100000;
            7: out = 7'b0001111;
            8: out = 7'b0000000;
            9: out = 7'b0001100;
            10: out = 7'b1110010;
            11: out = 7'b1100110;
            12: out = 7'b1011100;
            13: out = 7'b0110100;
            14: out = 7'b1110000;
            15: out = 7'b1111111;
            default: out = 7'b1111111;
        endcase
    end
    
    assign an_out = ~an_sel;
    assign dp = ~dp_in;
    
endmodule

module my_decode(
    input [2:0]dein,
    output reg [7:0]deout
    );
    
    always@(dein) begin
        case(dein)
            0: deout = 8'b0000_0001;
            1: deout = 8'b0000_0010;
            2: deout = 8'b0000_0100;
            3: deout = 8'b0000_1000;
            
            4: deout = 8'b0001_0000;
            5: deout = 8'b0010_0000;
            6: deout = 8'b0100_0000;
            7: deout = 8'b1000_0000;
            default: deout = 8'b0000_0000;
        endcase
    end
endmodule