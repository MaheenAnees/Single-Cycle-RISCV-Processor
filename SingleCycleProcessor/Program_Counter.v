//module Program_Counter(
//    input clk, reset, 
//	input [63:0]PC_In,
//    output reg [63:0]PC_Out
//);
//
//always@(reset)
//	PC_Out = 0;
//
//always@(posedge clk)
//  PC_Out = PC_In;
//   
//endmodule

module Program_Counter
(
	input [63:0] PC_In,
	input clk,reset,
	output reg[63:0] PC_Out
);

	always@(posedge clk or posedge reset)
	begin
		if(reset)
			PC_Out = 0;
		else
			PC_Out = PC_In;
	end
endmodule