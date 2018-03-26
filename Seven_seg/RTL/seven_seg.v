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
