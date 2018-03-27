// Nexys4 DDR
module	ID_Marquee  (input  clk,
                     output [7:0]light_switch,[7:0]data, output chk_light);
	reg [3:0]id[7:0];
	reg [3:0] temp;
	wire div_clk;
	assign chk_light=div_clk;
	reg start;
	reg [63:0]counter;
	clk_divider_roam dclk1 (clk,div_clk);
  show_control s1(clk,id[0],id[1],id[2],id[3],id[4],id[5],id[6],id[7],light_switch,data);
    //                right                                      left
	initial id[7]=10;
	initial id[6]=0;
	initial id[5]=1;
	initial id[4]=1;
	initial id[3]=0;
	initial id[2]=5;
	initial id[1]=1;
	initial id[0]=2;
	 	
	always@(posedge clk)begin
	   if (counter==50000000)begin
	                id[7]<=id[6];
                  id[6]<=id[5];
                  id[5]<=id[4];
                  id[4]<=id[3];
                  id[3]<=id[2];
                  id[2]<=id[1];
                  id[1]<=id[0];
                  id[0]<=id[7];
                  counter<=0;  
                  end
       else 
	           counter=counter+1;            
	  end	

endmodule

module show_control(input clk,[3:0]data1,[3:0]data2,[3:0]data3,[3:0]data4,
							                [3:0]data5,[3:0]data6,[3:0]data7,[3:0]data8,
					          output reg [7:0]light_switch,[7:0]seven_seg);
	reg  [3:0]odata;
	reg  [3:0]counter;
  wire div_clk;
	seven_seg_decoder de1 (odata,seven_seg);
	clk_divider a1(clk,div_clk);
		
	always @ (posedge div_clk) begin
		case(counter)
			0:begin counter=1;
					odata=data1; //right
					light_switch=8'b11111110; end
			1:begin counter=2;
					odata=data2;
					light_switch=8'b11111101; end
			2:begin odata=data3;
					counter=3;
					light_switch=8'b11111011; end		
			3:begin odata=data4;
					counter=4;
					light_switch=8'b11110111; end
			4:begin odata=data5;
					counter=5;
					light_switch=8'b11101111; end
			5:begin odata=data6;
					counter=6;
					light_switch=8'b11011111; end		
			6:begin odata=data7;
					counter=7;
					light_switch=8'b10111111; end
			7:begin odata=data8;
					counter=0;
					light_switch=8'b01111111; end
			default:begin odata=data1;
					counter=1;
					light_switch=8'b11111110; end		
				
		endcase
	end
endmodule	

module  clk_divider	(input iclk,output reg oclk);
	reg [31:0]count;	
	always @ (posedge iclk) begin
		if (count==100000)begin
			oclk <=1;
			count<=0;		end
		
		else begin
		  oclk <=0;
		  count=count+1;		end
	end
endmodule

module  clk_divider_roam	(input iclk,output reg oclk);
	reg [39:0]count;	
	always @ (posedge iclk) begin
		if (count==50000000)begin
			oclk <=1;
			count<=0;		end
		
		else begin
		  oclk <=0;
		  count=count+1;		end
	end
endmodule


module  seven_seg_decoder(input  [3:0]data,
						              output [7:0]seg_light);
    reg [7:0] nseg_light;//for low inducement
    always @(data) begin
        case (data)
            4'b0000: nseg_light = 8'b11111100; // 0
            4'b0001: nseg_light = 8'b01100000; // 1
            4'b0010: nseg_light = 8'b11011010; // 2
            4'b0011: nseg_light = 8'b11110010; // 3
            4'b0100: nseg_light = 8'b01100110; // 4
            4'b0101: nseg_light = 8'b10110110; // 5
            4'b0110: nseg_light = 8'b10111110; // 6
            4'b0111: nseg_light = 8'b11100100; // 7
            4'b1000: nseg_light = 8'b11111110; // 8
            4'b1001: nseg_light = 8'b11110110; // 9
            4'b1010: nseg_light = 8'b00000000; // 10=blank
			default: nseg_light = 8'b00000000; //  
        endcase
    end
    assign seg_light = ~nseg_light;					 												 
endmodule 
