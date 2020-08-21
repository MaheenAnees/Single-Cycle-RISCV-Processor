module data_extractor(
    input [31:0]instruction,
    output reg  [63:0]imm_data
);

wire [11:0] data1;
wire [11:0] data2;
wire [11:0] data3;
wire [1:0] mode;

assign data1 = instruction[31:20];
assign data2[4:0] = instruction[11:7];
assign data2[11:5] = instruction[31:25];
assign data3[3:0] = instruction[11:8];
assign data3[9:4] = instruction[30:25];
assign data3[10] = instruction[7];
assign data3[11] = instruction[31];
assign mode = instruction[6:5];


always@(*)
begin

if (mode == 2'b00)
imm_data = {{52{instruction[31]}}, data1};
else if (mode == 2'b01)
imm_data = {{52{instruction[31]}}, data2};
else
imm_data = {{52{instruction[31]}}, data3};

end
endmodule

