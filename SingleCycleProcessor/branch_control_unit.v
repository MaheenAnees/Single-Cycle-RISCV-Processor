module branch_control_unit(
input Branch, Zero, Positive, [2:0]funct3,
output reg branch_out
);

always@(*)
begin
case(Branch)
	1'b1:
		case(funct3)
			3'b000: //beq
				if(Zero == 1'b0) //if not equal
				begin
					branch_out = 1'b0;
				end
				else
				begin
					branch_out = 1'b1;
				end	
			3'b001: //bne
				if(Zero == 1'b0) //if not equal
				begin
					branch_out = 1'b1;
				end	
				else
					branch_out = 1'b0;
			3'b100: //blt
				if(Positive == 1'b0) // result is positive
				begin
					branch_out = 1'b0;
				end	
				else if(Positive == 1'b1) //result is negative
				begin
					branch_out = 1'b1;
				end	
		endcase
	1'b0:
	begin
		branch_out = 1'b0;	
	end
endcase
end
endmodule
