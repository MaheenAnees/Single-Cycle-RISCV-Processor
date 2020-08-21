module EX_MEM(
	input clk, reset,
	input Zero, [63:0] Result, [63:0] ReadData2, [4:0] rd, [63:0] sum,
	input Branch, MemRead, MemWrite, //MEM
	input Regwrite, MemtoReg, //WB
	output reg Zero_out, [63:0] Result_out, [63:0] ReadData2_out, [4:0] rd_out, [63:0] sum_out,
	output reg Branch_out, MemRead_out, MemWrite_out, 
	output reg Regwrite_out, MemtoReg_out

);
always@(posedge clk)
begin
if (reset == 1'b0)
begin
	Zero_out = Zero;
	Result_out = Result;
	ReadData2_out = ReadData2;
	rd_out = rd;
	sum_out = sum;
	Branch_out = Branch;
	MemRead_out = MemRead;
	MemWrite_out = MemWrite;
	Regwrite_out = Regwrite;
	MemtoReg_out = MemtoReg;
end	
else
begin
	Zero_out = 0;
	Result_out = 0;
	ReadData2_out = 0;
	rd_out = 0;
	sum_out = 0;
	Branch_out = 0;
	MemRead_out = 0;
	MemWrite_out = 0;
	Regwrite_out = 0;
	MemtoReg_out = 0;
end	
end
endmodule