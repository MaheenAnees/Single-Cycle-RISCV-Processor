module registerFile(
    input clk , reset, RegWrite,
    input [63:0]WriteData, [4:0]RS1 , [4:0]RS2, [4:0]RD,
    output reg [63:0]ReadData1 , [63:0]ReadData2
);

reg [63:0] Register [31:0];
integer i;

initial
begin
	for(i=0; i < 32; i = i + 1)
	begin
		Register[i] <= 2;
	end
end

always@(posedge clk)
    if (RegWrite == 1)
		Register[RD] = WriteData;

always@(reset, RS1, RS2, Register)
	if(reset)
	begin
		ReadData1 = 64'd0;
		ReadData2 = 64'd0;
	end
	else
	begin
		ReadData1 = Register[RS1];
		ReadData2 = Register[RS2];
	end	
	
endmodule