// T_FF 定義如下
// 括弧內為：輸出 q、輸入 clk、輸入 reset
module T_FF(q, clk, reset);
    
    input clk;
    input reset;
    output q;
    
// 此處宣告一個內部連接線 d，型別為 wire
    wire d;

// 呼叫自定義的 D_FF，其實體名稱為：dff0  
    D_FF dff0(q, d, clk, reset);
	
// 呼叫內建的 not，其實體名稱為：n1  
    not n1(d, q);
    
endmodule