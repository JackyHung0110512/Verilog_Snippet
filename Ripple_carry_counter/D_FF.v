// D_FF 定義如下
// 括弧內為：輸出 q、輸入 d、輸入 clk、輸入 reset
module D_FF(q, d, clk, reset);

// 欲將變數放入 always 中，其型別必須增加成 reg
    output reg q;
    input d;
    input clk;
    input reset;

// always 中 @ 括弧內表示觸發時需要偵測的訊號，本範例在 reset 上升邊緣與 clk 下降邊緣會進行偵測
    always @(posedge reset or negedge clk)
// 欲使用 if 條件判斷，須先有 always 區塊
// 當 reset 為上升邊緣或 clk為下降邊緣 且 reset 為 true 時，令 q = 0
        if(reset)
            q = 1'b0;
// 否則將 d 值存入 q 中
        else
            q = d;
                
endmodule