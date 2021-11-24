SetActiveLib -work
comp -include "$DSN\src\non_restoring_division.vhd" 
comp -include "$DSN\src\TestBench\non_res_TB.vhd" 
asim TESTBENCH_FOR_non_res 
wave 
wave -noreg m
wave -noreg q
wave -noreg qoutient
wave -noreg remainder
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\non_res_TB_tim_cfg.vhd" 
# asim TIMING_FOR_non_res 
