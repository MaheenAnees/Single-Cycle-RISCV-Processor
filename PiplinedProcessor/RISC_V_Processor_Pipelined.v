module RISC_V_Processor_Pipelined(
input clk, reset
);

wire [63:0] Result; //ALU 64bit
wire [63:0]ReadData1; wire [63:0]ReadData2; //Register
wire [63:0] PC_Out; // PC
wire [6:0]opcode; wire [4:0]rd; wire [2:0]funct3; wire [4:0]rs1; wire [4:0]rs2; wire [6:0]funct7; //Parser
wire [63:0]data_out1; //mux1
wire [63:0]data_out2; //mux2
wire [63:0]data_out3; //mux3
wire [31:0] Instruction; //Instruction memory
wire [63:0] Read_Data; //Data memory
wire [63:0]imm_data; //data extractor
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero; //CU
wire [1:0] ALUOp; wire [3:0] Operation; //ALU control
wire [63:0]out1; //adder1
wire [63:0]out2; //adder2
wire [31:0]Instruction_outFD; wire [63:0] PC_outFD; //IFID
wire [63:0] PC_outDE; // IDEXE
wire Branch_outDE, MemRead_outDE, MemtoReg_outDE, MemWrite_outDE, ALUSrc_outDE, Regwrite_outDE; //IDEXE
wire [63:0] ReadData1_outDE; wire [63:0] ReadData2_outDE; wire [3:0] Funct_outDE; wire [4:0] rd_outDE; wire [63:0] imm_data_outDE; wire [1:0] ALUOp_outDE; //IDEXE
wire Zero_outEM; wire [63:0] Result_outEM; wire [63:0] ReadData2_outEM; wire [4:0] rd_outEM; wire [63:0] sum_outEM; //EXEMEM
wire Branch_outEM, MemRead_outEM, MemWrite_outEM ,Regwrite_outEM, MemtoReg_outEM; //EXEMEM
wire Regwrite_outMW, MemtoReg_outMW; wire [63:0] Read_Data_outMW; wire [63:0] Result_outMW; wire [4:0] rd_outMW; //MEMWB



Program_Counter PC(	
	.PC_In(data_out1),
	.clk(clk),
	.reset(reset),
	.PC_Out(PC_Out)
);

Instruction_Memory IM(
	.Inst_Address(PC_Out),
	.Instruction(Instruction)
);

IF_ID IFID(
	.clk(clk), 
	.reset(reset),
	.Instruction(Instruction),
	.PC(PC_Out),
	.Instruction_out(Instruction_outFD),
	.PC_out(PC_outFD)
);

parser P1(
    .instruction(Instruction_outFD),
    .opcode(opcode), 
	.rd(rd), 
	.funct3(funct3), 
	.rs1(rs1), 
	.rs2(rs2), 
	.funct7(funct7)
);

ID_EX IDEXE(
	.clk(clk),
	.reset(reset),
	.PC(PC_outFD),
	.ReadData1(ReadData1),
	.ReadData2(ReadData2),
	.imm_data(imm_data),
	.rd(rd), 
	.Funct({Instruction_outFD[30], Instruction_outFD[14:12]}),
	.ALUOp(ALUOp),  
	.ALUSrc(ALUSrc),
	.Branch(Branch), 
	.MemRead(MemRead), 
	.MemWrite(MemWrite),
	.Regwrite(RegWrite), 
	.MemtoReg(MemtoReg),   
	.PC_out(PC_outDE),
	.Branch_out(Branch_outDE), 
	.MemRead_out(MemRead_outDE), 
	.MemtoReg_out(MemtoReg_outDE), 
	.MemWrite_out(MemWrite_outDE), 
	.ALUSrc_out(ALUSrc_outDE), 
	.Regwrite_out(Regwrite_outDE),
	.ReadData1_out(ReadData1_outDE), 
	.ReadData2_out(ReadData2_outDE),
	.Funct_out(Funct_outDE), 
	.rd_out(rd_outDE), 
	.imm_data_out(imm_data_outDE), 
	.ALUOp_out(ALUOp_outDE)
);

EX_MEM EXEMEM(
	.clk(clk), 
	.reset(reset),
	.Zero(Zero),
	.Result(Result),
	.ReadData2(ReadData2_outDE),
	.rd(rd_outDE),
	.sum(out2),
	.Branch(Branch_outDE),
	.MemRead(MemRead_outDE), 
	.MemWrite(MemWrite_outDE),
	.Regwrite(Regwrite_outDE), 
	.MemtoReg(MemtoReg_outDE),
	.Zero_out(Zero_outEM), 
	.Result_out(Result_outEM), 
	.ReadData2_out(ReadData2_outEM), 
	.rd_out(rd_outEM), 
	.sum_out(sum_outEM),
	.Branch_out(Branch_outEM), 
	.MemRead_out(MemRead_outEM), 
	.MemWrite_out(MemWrite_outEM), 
	.Regwrite_out(Regwrite_outEM), 
	.MemtoReg_out(MemtoReg_outEM)
);

MEM_WB MEMWB(
	.clk(clk), 
	.reset(reset),
	.Regwrite(Regwrite_outEM), 
	.MemtoReg(MemtoReg_outEM),
	.Read_Data(Read_Data),
	.Result(Result_outEM),
	.rd(rd_outEM),
	.Regwrite_out(Regwrite_outMW), 
	.MemtoReg_out(MemtoReg_outMW), 
	.Read_Data_out(Read_Data_outMW),
	.Result_out(Result_outMW),
	.rd_out(rd_outMW)
);
 
registerFile RF(
    .clk(clk), 
	.reset(reset), 
	.RegWrite(Regwrite_outMW),
    .WriteData(data_out3), 
	.RS1(rs1), 
	.RS2(rs2), 
	.RD(rd_outMW),
    .ReadData1(ReadData1), 
	.ReadData2(ReadData2)
);

ALU_64_bit ALU1(
	.a(ReadData1_outDE),
	.b(data_out2),
	.ALUOp(Operation),
	.Result(Result),
	.Zero(Zero)
);

mux M1(
    .a(out1), 
	.b(sum_outEM), 
	.sel(Branch_outEM & Zero_outEM),
    .data_out(data_out1)
);

mux M2(
    .a(ReadData2_outDE), 
	.b(imm_data_outDE), 
	.sel(ALUSrc_outDE),
    .data_out(data_out2)
);

mux M3(
    .b(Read_Data_outMW), 
	.a(Result_outMW), 
	.sel(MemtoReg_outMW),
    .data_out(data_out3)
);

Data_Memory DM(
	.Mem_Addr(Result_outEM), 
	.Write_Data(ReadData2_outEM),
	.clk(clk), 
	.MemWrite(MemWrite_outEM), 
	.MemRead(MemRead_outEM),
	.Read_Data(Read_Data)
);

data_extractor DE(
    .instruction(Instruction_outFD),
    .imm_data(imm_data)
);

Control_Unit CU(
	.Opcode(opcode),
	.Branch(Branch), 
	.MemRead(MemRead), 
	.MemtoReg(MemtoReg), 
	.MemWrite(MemWrite), 
	.ALUSrc(ALUSrc), 
	.RegWrite(RegWrite),
	.ALUOp(ALUOp)
);

ALU_Control AC(
	.ALUOp(ALUOp_outDE),
	.Funct(Funct_outDE),
	.Operation(Operation)
);

adder A1(
    .a(PC_Out), 
	.b(64'd4),
    .out(out1) 
);

adder A2(
    .a(PC_outDE), 
	.b(imm_data_outDE<<1), 
    .out(out2) 
);

endmodule

