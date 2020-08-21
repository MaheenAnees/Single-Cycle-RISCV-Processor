module ID_EX(
	input clk, reset,
    input [63:0] PC,
	input [63:0] ReadData1, [63:0] ReadData2,
	input [63:0] imm_data,
	input [4:0] rd, 
	input [3:0] Funct,
    input [1:0] ALUOp,  
	input ALUSrc, //EX
	input Branch, MemRead, MemWrite, //MEM
	input Regwrite, MemtoReg, //WB
    
	output reg [63:0] PC_out,
	output reg Branch_out, MemRead_out, MemtoReg_out, MemWrite_out, ALUSrc_out, Regwrite_out,
	output reg [63:0] ReadData1_out, [63:0] ReadData2_out,
	output reg [3:0] Funct_out, [4:0] rd_out, [63:0] imm_data_out, [1:0] ALUOp_out
);

always@(posedge clk)
begin
if (reset == 1'b0)
begin
	PC_out = PC;
	Branch_out = Branch; 
	MemRead_out = MemRead;
	MemtoReg_out = MemtoReg;
	MemWrite_out = MemWrite;
	ALUSrc_out = ALUSrc;
	Regwrite_out = Regwrite;
	ReadData1_out = ReadData1;
	ReadData2_out = ReadData2;
	Funct_out =  Funct;
	rd_out = rd;
	imm_data_out = imm_data;
	ALUOp_out = ALUOp;
end	
else
begin
	PC_out = 0;
	Branch_out = 0; 
	MemRead_out = 0;
	MemtoReg_out = 0;
	MemWrite_out = 0;
	ALUSrc_out = 0;
	Regwrite_out = 0;
	ReadData1_out = 0;
	ReadData2_out = 0;
	Funct_out =  0;
	rd_out = 0;
	imm_data_out = 0;
	ALUOp_out = 0;
end	
end    


endmodule