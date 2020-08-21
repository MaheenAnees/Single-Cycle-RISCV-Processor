vlib work
vlog tb.v RISC_V_Processor_Pipelined.v registerFile.v ID_EX.v IF_ID.v EX_MEM.v MEM_WB.v mux.v parser.v Program_Counter.v Control_Unit.v ALU_64_bit.v ALU_Control.v adder.v data_extractor.v Data_Memory.v Instruction_Memory.v 
vsim -novopt work.tb
add wave -r /*
run 500ns