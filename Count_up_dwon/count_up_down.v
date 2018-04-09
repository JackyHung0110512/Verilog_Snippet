// 自製計數器，對於輸入觸發的時間點（邊緣或是位準）未嚴謹考慮
// 參考 ISE 設計範例

`timescale 1ns / 1ps

module counter(
    input clk,
    input isUP,
    input reset,
    
    output [3:0]q
);

    reg [3:0]count = 0;

    always@(posedge clk or reset) begin
        if (reset==1) begin
            count <= 0;
        end
        else begin
            if (isUP==1)
                count <= count + 1;
            else
                count <= count - 1;
        end
    
    end
    
    assign q = count;
    
endmodule