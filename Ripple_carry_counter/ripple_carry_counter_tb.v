// 'timescale 設置模擬時「單位時間」 / 模擬計算時最小的刻度（游標可移動的最小刻度）
// 關於模擬狀態裡面的時間長度表示法
// 例 #10 表示延遲 10 個單位時間，以本範例來說，總共延遲 10 * 1ns = 10 nano second
`timescale 1ns / 1ps

// testbench 本身也是 verilog 的一個模組，但是括弧內不寫任何參數
module ripple_carry_counter_tb();

// testbench 中，輸入性質的變數須宣告為 reg
    reg clk;
    reg reset;
// testbench 中，輸出性質的變數須宣告為 wire
// 注意，本範例有 2 位元
    wire [1:0]q;

// 呼叫待測的電路。格式為「待測電路名稱當作型別」（此處為ripple_carry_counter）「實體名稱」(此處命名UUT)
    ripple_carry_counter UUT(q, clk, reset);

// 設定 clk 值（只會發生一遍）
    initial
        clk = 1'b0;
// 用 always 設定重複事件
// 此處每 5 個單位時間，將 clk 反相。亦即產生一個週期為 10 個單位時間的方波（頻率為 100 M Hz）   
    always
        #5 clk = ~clk;

// 設定 reset 值（只會發生一遍）
    initial begin
// 初值為 1
        reset = 1'b1;
// 100 個單位時間後，設為 0。也就是歸零 100 個單位時間，之後計數器正常開始計算
        #100 reset = 1'b0;
    end
    
endmodule