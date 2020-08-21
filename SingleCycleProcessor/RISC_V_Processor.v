module RISC_V_Processor(
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
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Positive, branch_out; //CU
wire [1:0] ALUOp; wire [3:0] Operation; //ALU control
wire [63:0]out1; //adder1
wire [63:0]out2; //adder2


Program_Counter PC(	
	.PC_In(data_out1),
	.clk(clk),
	.reset(reset),
	.PC_Out(PC_Out)
);

ALU_64_bit ALU1(
	.a(ReadData1),
	.b(data_out2),
	.ALUOp(Operation),
	.Result(Result),
	.Zero(Zero),
	.Positive(Positive)
);

registerFile RF(
    .clk(clk), 
	.reset(reset), 
	.RegWrite(RegWrite),
    .WriteData(data_out3), 
	.RS1(rs1), 
	.RS2(rs2), 
	.RD(rd),
    .ReadData1(ReadData1), 
	.ReadData2(ReadData2)
);

parser P1(
    .instruction(Instruction),
    .opcode(opcode), 
	.rd(rd), 
	.funct3(funct3), 
	.rs1(rs1), 
	.rs2(rs2), 
	.funct7(funct7)
);
branch_control_unit BCU(
	.Branch(Branch),  
	.Positive(Positive), 
	.funct3(funct3),
	.branch_out(branch_out),
	.Zero(Zero)
);

mux M1(
    .a(out1), 
	.b(out2), 
	.sel(branch_out), //check
    .data_out(data_out1)
);

mux M2(
    .a(ReadData2), 
	.b(imm_data), 
	.sel(ALUSrc),
    .data_out(data_out2)
);

mux M3(
    .b(Read_Data), 
	.a(Result), 
	.sel(MemtoReg),
    .data_out(data_out3)
);

Instruction_Memory IM(
	.Inst_Address(PC_Out),
	.Instruction(Instruction)
);

Data_Memory DM(
	.Mem_Addr(Result), 
	.Write_Data(ReadData2),
	.clk(clk), 
	.MemWrite(MemWrite), 
	.MemRead(MemRead),
	.Read_Data(Read_Data)
);

data_extractor DE(
    .instruction(Instruction),
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
	.ALUOp(ALUOp),
	.Funct({Instruction[30], Instruction[14:12]}), //ask ms aiman
	.Operation(Operation)
);

adder A1(
    .a(PC_Out), 
	.b(64'd4),
    .out(out1) 
);

adder A2(
    .a(PC_Out), 
	.b(imm_data<<1), //check
    .out(out2) 
);

endmodule

