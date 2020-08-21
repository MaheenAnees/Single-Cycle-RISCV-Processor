vlib work
vlog tb.v registerFile.v RISC_V_Processor.v data_extractor.v Data_Memory.v Instruction_Memory.v Control_Unit.v adder.v ALU_Control.v ALU_64_bit.v parser.v Program_Counter.v mux.v branch_control_unit.v 
vsim -novopt work.tb
add wave -r /*
run 5000ns