module MEM_WB(
	input clk, reset, Regwrite, MemtoReg, //WB
	input [63:0] Read_Data, [63:0] Result, [4:0] rd,
	output reg Regwrite_out, MemtoReg_out, 
	output reg [63:0] Read_Data_out, [63:0] Result_out, [4:0] rd_out
);

always@(posedge clk)
begin
if (reset == 1'b0)
begin
	Regwrite_out = Regwrite;
	MemtoReg_out = MemtoReg;
	Read_Data_out = Read_Data;
	Result_out = Result;
	rd_out = rd;
end	
else
begin
	Regwrite_out = 0;
	MemtoReg_out = 0;
	Read_Data_out = 0;
	Result_out = 0;
	rd_out = 0;
end	
end
endmodule