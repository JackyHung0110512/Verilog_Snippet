`timescale 1ns / 1ps

module my_7_segment(
	input [3:0] q,
	input [7:0] an_in,
	input dp_sw,
	output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output dp,
	output [7:0] an
    );

	assign a = (~q[3] & ~q[2] & ~q[1] & q[0]) | (q[2] & ~q[0]) | (q[3] & q[1]);
	assign b = (q[2] & ~q[1] & q[0]) | (q[2] & q[1] & ~q[0]) | (q[3] & q[1]);
	assign c = (~q[2] & q[1] & ~q[0]) | (q[3] & q[2]);
	assign d = (~q[2] & ~q[1] & q[0]) | (q[2] & ~q[1] & ~q[0]) | (q[2] & q[1] & q[0]);
	assign e = q[0] + (q[2] & ~q[1]);
	assign f = (~q[3] & ~q[2] & q[0]) | (~q[2] & q[1]) | (q[1] & q[0]);
	assign g = (~q[3] & ~q[2] & ~q[1]) | (q[2] & q[1] & q[0]);
	assign dp = ~dp_sw;
	assign an = ~an_in;
		

endmodule
