// mux_in: my_in, mux_out_my_out, select bit: sel
module mux_5_1(
    input [4:0]my_in,
    input [2:0]sel,
    
    output reg my_out
    );
    
    always @(sel) begin
        case(sel)
            0: my_out = my_in[0];
            1: my_out = my_in[1];
            2: my_out = my_in[2];
            3: my_out = my_in[3];
            4: my_out = my_in[4];
        endcase
    end
    
endmodule
/* Button Location
              BTN_U(M18)
   BTN_L(P17) BTN_C(N17) BTN_R(M17)
              BTN_D(P18)
*/   
