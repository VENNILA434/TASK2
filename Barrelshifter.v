module mux4to1 (
    input [1:0] sel,
    input [3:0] I,
    output y
);

assign y = (sel == 2'b00) ? I[0] :
           (sel == 2'b01) ? I[1] :
           (sel == 2'b10) ? I[2] :
                            I[3];

endmodule



module barrel_shifter(
    input [3:0] w,
    input [1:0] s,
    output [3:0] y
);

  // y[3] = select from w[3], w[0], w[1], w[2]
  mux4to1 mux3 (.sel(s), .I({w[2], w[1], w[0], w[3]}), .y(y[3]));

  // y[2] = select from w[2], w[3], w[0], w[1]
  mux4to1 mux2 (.sel(s), .I({w[1], w[0], w[3], w[2]}), .y(y[2]));

  // y[1] = select from w[1], w[2], w[3], w[0]
  mux4to1 mux1 (.sel(s), .I({w[0], w[3], w[2], w[1]}), .y(y[1]));

  // y[0] = select from w[0], w[1], w[2], w[3]
  mux4to1 mux0 (.sel(s), .I({w[3], w[2], w[1], w[0]}), .y(y[0]));

endmodule
