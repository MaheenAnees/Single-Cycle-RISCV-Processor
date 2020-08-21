module Data_Memory
(
	input [63:0] Mem_Addr, Write_Data,
	input clk, MemWrite, MemRead,
	output reg [63:0] Read_Data
);


reg [7:0] Memory [63:0];
integer i;

initial
begin
	for(i=0; i < 64; i = i + 1)
	begin
		Memory[i] <= 0;
	end	
end

always@(posedge clk)
    if (MemWrite == 1'b1)
	begin
		Memory[Mem_Addr + 7] = Write_Data[63:56];
		Memory[Mem_Addr + 6] = Write_Data[55:48];
		Memory[Mem_Addr + 5] = Write_Data[47:40];
		Memory[Mem_Addr + 4] = Write_Data[39:32];
		Memory[Mem_Addr + 3] = Write_Data[31:24];
		Memory[Mem_Addr + 2] = Write_Data[23:16];
		Memory[Mem_Addr + 1] = Write_Data[15:8];
		Memory[Mem_Addr] = Write_Data[7:0];
	end	
	

always@(*)
	if (MemRead == 1'b1)
		Read_Data = {Memory[Mem_Addr + 7], Memory[Mem_Addr + 6], Memory[Mem_Addr + 5], Memory[Mem_Addr + 4], Memory[Mem_Addr + 3], Memory[Mem_Addr + 2], Memory[Mem_Addr + 1], Memory[Mem_Addr]};

endmodule		