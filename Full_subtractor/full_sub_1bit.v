module my_sub(
  input x, 
  input y, 
  input bin,
  
  output d,
  output bout
  );
  
  assign {bout,d} = x - y - bin;

endmodule
