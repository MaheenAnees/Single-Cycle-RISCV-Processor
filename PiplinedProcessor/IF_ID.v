module IF_ID(
    input clk, reset,
	input [31:0] Instruction,
    input [63:0] PC,

    output reg [31:0] Instruction_out,
	output reg [63:0] PC_out
);

always@(posedge clk)
begin
if(reset == 1'b0)
begin
	Instruction_out = Instruction;
	PC_out = PC;
end	
else
begin
	Instruction_out = 0;
	PC_out = 0;
end	
end
endmodule