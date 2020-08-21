module adder(
    input [63:0]a, [63:0]b,
    output reg [63:0]out 
);

always@(*)
	out = a + b;

endmodule