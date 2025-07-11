module priorityencoder(
    input [3:0] I,
    output reg [1:0] Y
);

always @(*) begin
  casex (I)
    4'b1xxx: Y = 2'b11; // I[3]
    4'b01xx: Y = 2'b10; // I[2]
    4'b001x: Y = 2'b01; // I[1]
    4'b0001: Y = 2'b00; // I[0]
    default: Y = 2'bxx; // No inputs active
  endcase
end

endmodule
