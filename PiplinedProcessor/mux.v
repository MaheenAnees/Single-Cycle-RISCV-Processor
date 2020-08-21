module mux(
    input [63:0]a, [63:0]b, 
	input sel,
    output [63:0]data_out
);

assign data_out = sel? b : a;   

endmodule

