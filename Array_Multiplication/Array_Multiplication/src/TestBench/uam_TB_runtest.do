SetActiveLib -work
comp -include "$DSN\src\Combinatorial_Array_Multiplier.vhd" 
comp -include "$DSN\src\TestBench\uam_TB.vhd" 
asim TESTBENCH_FOR_uam 
wave 
wave -noreg m
wave -noreg q
wave -noreg p
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\uam_TB_tim_cfg.vhd" 
# asim TIMING_FOR_uam 
