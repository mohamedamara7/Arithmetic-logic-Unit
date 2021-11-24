SetActiveLib -work
comp -include "$DSN\src\Sequential_Multiplication.vhd" 
comp -include "$DSN\src\TestBench\seq_mul_TB.vhd" 
asim TESTBENCH_FOR_seq_mul 
wave 
wave -noreg m
wave -noreg q
wave -noreg p
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\seq_mul_TB_tim_cfg.vhd" 
# asim TIMING_FOR_seq_mul 
