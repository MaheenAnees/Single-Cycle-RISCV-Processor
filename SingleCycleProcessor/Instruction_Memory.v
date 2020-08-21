module Instruction_Memory
(
input [63:0] Inst_Address,
output reg [31:0] Instruction
);

reg [7:0] memory [147:0];

initial
begin
	//addi x1,zero,4
	memory[0] <= 8'b10010011;
	memory[1] <= 8'b00000000;
	memory[2] <= 8'b01000000;
	memory[3] <= 8'b00000000;
	//addi x22,zero,0
	memory[4] <= 8'b00010011;
	memory[5] <= 8'b00001011;
	memory[6] <= 8'b00000000;
	memory[7] <= 8'b00000000;
	//addi x23,zero,0
	memory[8] <= 8'b10010011;
	memory[9] <= 8'b00001011;
	memory[10] <= 8'b00000000;
	memory[11] <= 8'b00000000;
	//add x5,zero,zero
	memory[12] <= 8'b10110011;
	memory[13] <= 8'b00000010;
	memory[14] <= 8'b00000000;
	memory[15] <= 8'b00000000;
	//add x2,zero,zero
	memory[16] <= 8'b00110011;
	memory[17] <= 8'b00000001;
	memory[18] <= 8'b00000000;
	memory[19] <= 8'b00000000;
	//addi x3,zero,0 array
	memory[20] <= 8'b10010011;
	memory[21] <= 8'b00000001;
	memory[22] <= 8'b00000000;
	memory[23] <= 8'b00000000;
	//add x12, x2, x3
	memory[24] <= 8'b00110011;
	memory[25] <= 8'b00000110;
	memory[26] <= 8'b00110001;
	memory[27] <= 8'b00000000;
	//sw x22, 0(x12)
	memory[28] <= 8'b00100011;
	memory[29] <= 8'b00100000;
	memory[30] <= 8'b01100110;
	memory[31] <= 8'b00000001;
	//addi x22, x22, 1
	memory[32] <= 8'b00010011;
	memory[33] <= 8'b00001011;
	memory[34] <= 8'b00011011;
	memory[35] <= 8'b00000000;
	//addi x2,x2,8
	memory[36] <= 8'b00010011;
	memory[37] <= 8'b00000001;
	memory[38] <= 8'b10000001;
	memory[39] <= 8'b00000000;
	//bne x22, x1, Loop
	memory[40] <= 8'b11100011;
	memory[41] <= 8'b00011000;
	memory[42] <= 8'b00011011;
	memory[43] <= 8'b11111110;
	//addi x22, zero, 0
	memory[44] <= 8'b00010011;
	memory[45] <= 8'b00001011;
	memory[46] <= 8'b00000000;
	memory[47] <= 8'b00000000;
	//add x2,zero,zero
	memory[48] <= 8'b00110011;
	memory[49] <= 8'b00000001;
	memory[50] <= 8'b00000000;
	memory[51] <= 8'b00000000;
	//add x11,zero,zero
	memory[52] <= 8'b10110011;
	memory[53] <= 8'b00000101;
	memory[54] <= 8'b00000000;
	memory[55] <= 8'b00000000;
	//add x23,zero,x22
	memory[56] <= 8'b10110011;
	memory[57] <= 8'b00001011;
	memory[58] <= 8'b01100000;
	memory[59] <= 8'b00000001;
	//add x12, x2, x3
	memory[60] <= 8'b00110011;
	memory[61] <= 8'b00000110;
	memory[62] <= 8'b00110001;
	memory[63] <= 8'b00000000;
	//lw x15, 0(x12)
	memory[64] <= 8'b10000011;
	memory[65] <= 8'b00100111;
	memory[66] <= 8'b00000110;
	memory[67] <= 8'b00000000;
	//addi x11,x23,0
	memory[68] <= 8'b10010011;
	memory[69] <= 8'b10000101;
	memory[70] <= 8'b00001011;
	memory[71] <= 8'b00000000;
	//add x11,x11,x23
	memory[72] <= 8'b10110011;
	memory[73] <= 8'b10000101;
	memory[74] <= 8'b01110101;
	memory[75] <= 8'b00000001;
	//add x11,x11,x23
	memory[76] <= 8'b10110011;
	memory[77] <= 8'b10000101;
	memory[78] <= 8'b01110101;
	memory[79] <= 8'b00000001;
	//add x11,x11,x23
	memory[80] <= 8'b10110011;
	memory[81] <= 8'b10000101;
	memory[82] <= 8'b01110101;
	memory[83] <= 8'b00000001;
	//add x11,x11,x23
	memory[84] <= 8'b10110011;
	memory[85] <= 8'b10000101;
	memory[86] <= 8'b01110101;
	memory[87] <= 8'b00000001;
	//add x11,x11,x23
	memory[88] <= 8'b10110011;
	memory[89] <= 8'b10000101;
	memory[90] <= 8'b01110101;
	memory[91] <= 8'b00000001;
	//add x11,x11,x23
	memory[92] <= 8'b10110011;
	memory[93] <= 8'b10000101;
	memory[94] <= 8'b01110101;
	memory[95] <= 8'b00000001;
	//add x11,x11,x23
	memory[96] <= 8'b10110011;
	memory[97] <= 8'b10000101;
	memory[98] <= 8'b01110101;
	memory[99] <= 8'b00000001;
	//add x10, x11, x3	
	memory[100] <= 8'b00110011;
	memory[101] <= 8'b10000101;
	memory[102] <= 8'b00110101;
	memory[103] <= 8'b00000000;
	//lw x16, 0(x10)
	memory[104] <= 8'b00000011;
	memory[105] <= 8'b00101000;
	memory[106] <= 8'b00000101;
	memory[107] <= 8'b00000000;
	//blt x15,x16,else
	memory[108] <= 8'b01100011;
	memory[109] <= 8'b11000100;
	memory[110] <= 8'b00000111;
	memory[111] <= 8'b00000001;
	//beq x0,x0,exit
	memory[112] <= 8'b01100011;
	memory[113] <= 8'b00001000;
	memory[114] <= 8'b00000000;
	memory[115] <= 8'b00000000;
	//add x5, zero, x15
	memory[116] <= 8'b10110011;
	memory[117] <= 8'b00000010;
	memory[118] <= 8'b11110000;
	memory[119] <= 8'b00000000;
	//sw x16, 0(x12)
	memory[120] <= 8'b00100011;
	memory[121] <= 8'b00100000;
	memory[122] <= 8'b00000110;
	memory[123] <= 8'b00000001;
	//sw x5, 0(x10)
	memory[124] <= 8'b00100011;
	memory[125] <= 8'b00100000;
	memory[126] <= 8'b01010101;
	memory[127] <= 8'b00000000;
	//addi x23,x23,1
	memory[128] <= 8'b10010011;
	memory[129] <= 8'b10001011;
	memory[130] <= 8'b00011011;
	memory[131] <= 8'b00000000;
	//bne x23, x1, loopinner
	memory[132] <= 8'b11100011;
	memory[133] <= 8'b10011100;
	memory[134] <= 8'b00011011;
	memory[135] <= 8'b11111010;
	//addi x22, x22, 1
	memory[136] <= 8'b00010011;
	memory[137] <= 8'b00001011;
	memory[138] <= 8'b00011011;
	memory[139] <= 8'b00000000;
	//addi x2,x2,8
	memory[140] <= 8'b00010011;
	memory[141] <= 8'b00000001;
	memory[142] <= 8'b10000001;
	memory[143] <= 8'b00000000;
	//bne x22, x1, loopouter
	memory[144] <= 8'b11100011;
	memory[145] <= 8'b00010100;
	memory[146] <= 8'b00011011;
	memory[147] <= 8'b11111010;
end

always@(*)
	Instruction = {memory[Inst_Address + 3], memory[Inst_Address + 2], memory[Inst_Address + 1], memory[Inst_Address]};
	
endmodule	
	