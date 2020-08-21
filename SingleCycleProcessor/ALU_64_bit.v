module ALU_64_bit
(
	input [63:0] a,
	input [63:0] b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg Zero,
	output reg Positive
);
		
always @(*)
begin
	case (ALUOp)
			4'b0000: 
				Result = a & b;
			4'b0001: 
				Result = a | b;
			4'b0010: 
				Result = a + b;
			4'b0110: 
				Result = a - b;
			4'b1100: 
				Result = ~(a | b);

	endcase
Zero = 1'b0;
Positive = 1'b0;
	
if (Result == 64'd0)
	Zero = 1'b1;
else if (Result[63] == 1'b1)
	Positive = 1'b1;
	
//if (Result > 64'd0)
//	Positive = 1'b1; //if result positive
//else
//	Positive = 1'b0; //if result negative
end
endmodule 