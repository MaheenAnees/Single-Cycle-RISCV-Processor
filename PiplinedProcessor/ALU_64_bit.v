module ALU_64_bit
(
	input [63:0] a,
	input [63:0] b,
	input [3:0] ALUOp,
	output reg [63:0] Result,
	output reg Zero
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
if (Result == 64'd0)
	Zero = 1'b1;
else
	Zero = 1'b0;
end



endmodule 