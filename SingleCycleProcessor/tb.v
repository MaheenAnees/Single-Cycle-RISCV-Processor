module tb();
reg clk, reset;

RISC_V_Processor RP1(
	.clk(clk),
	.reset(reset)
);
	
initial
begin
	clk = 1'b0;
	reset = 1'b1;
	
	#10 reset = 1'b0;
end
	
always
	#5 clk = ~ clk;
	
endmodule