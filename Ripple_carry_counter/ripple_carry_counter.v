// top module 名稱為 ripple_carry_counter
// 括弧內變數依序為：輸出 q、輸入 clk、輸入 reset
module ripple_carry_counter(q, clk, reset);

// 此範例輸入輸出的型別定義在括弧外
// 輸出有 2 個位元
    output [1:0] q;
    input clk;
    input reset;

// 呼叫兩個自定義的 T_FF，其實體名稱分別為：tff0、tff1    
    T_FF tff0(q[0], clk, reset);
    T_FF tff1(q[1], q[0], reset);
    
endmodule