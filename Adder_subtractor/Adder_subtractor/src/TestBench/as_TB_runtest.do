SetActiveLib -work
comp -include "$DSN\src\Adder_Subtractor.vhd" 
comp -include "$DSN\src\TestBench\as_TB.vhd" 
asim TESTBENCH_FOR_as 
wave 
wave -noreg a
wave -noreg b
wave -noreg op
wave -noreg s
wave -noreg overflow
wave -noreg cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\as_TB_tim_cfg.vhd" 
# asim TIMING_FOR_as 
