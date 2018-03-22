module my_sub(
  input x, y, bin,
  
  output d,bout
  );
  
  assign {bout,d} = x - y - bin;

endmodule
