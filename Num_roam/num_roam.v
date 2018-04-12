module num_roam(input clk,U_D, output reg [7:0]light_switch,[7:0]data);

	reg [3:0]num;
	reg [31:0]count;
	wire d_clk;
	seven_seg_decoder d1 (num,data);
	clk_divider	c1(clk,d_clk);
		
	initial light_switch=8'b10111111;
	initial num=0;

	always @ (posedge d_clk) begin
		if (U_D) begin //Up=1,Down=0
		    if (light_switch==8'b11111110)begin
                num=num+1;
                light_switch=8'b01111111;               
            end
            
            else begin  
			light_switch[6]<=light_switch[7];
			light_switch[5]<=light_switch[6];
			light_switch[4]<=light_switch[5];
			light_switch[3]<=light_switch[4];
			light_switch[2]<=light_switch[3];
			light_switch[1]<=light_switch[2];
			light_switch[0]<=light_switch[1];
			light_switch[7]<=light_switch[0];
			end  
		end
		else begin
		    if (light_switch==8'b01111111)begin
               num=num-1;   
               light_switch=8'b11111110;             
            end 
            
            else begin  
			light_switch[7]<=light_switch[6];
            light_switch[6]<=light_switch[5];
            light_switch[5]<=light_switch[4];
            light_switch[4]<=light_switch[3];
            light_switch[3]<=light_switch[2];
            light_switch[2]<=light_switch[1];
            light_switch[1]<=light_switch[0];
            light_switch[0]<=light_switch[7];
			end		    
		end
	end
endmodule

module  clk_divider	(input iclk,output reg oclk);
	reg [31:0]count;
	initial count=0; 	
	always @ (posedge iclk) begin
		if (count==10000000)begin
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
            4'b1010: nseg_light = 8'b00011010; // 10
            4'b1011: nseg_light = 8'b00110010; // 11
            4'b1100: nseg_light = 8'b01000110; // 12
            4'b1101: nseg_light = 8'b10010110; // 13
            4'b1110: nseg_light = 8'b00011110; // 14
            4'b1111: nseg_light = 8'b00000000; // 15
			default: nseg_light = 8'b00000000; //  
        endcase
    end
    assign seg_light = ~nseg_light;					 												 
endmodule 
