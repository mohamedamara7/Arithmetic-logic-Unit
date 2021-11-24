SetActiveLib -work
comp -include "$DSN\src\cla_generator_3carries.vhd" 
comp -include "$DSN\src\bitcell.vhd" 
comp -include "$DSN\src\cla_generator_4carries.vhd" 
comp -include "$DSN\src\cla_4bit.vhd" 
comp -include "$DSN\src\cla_16bit.vhd" 
comp -include "$DSN\src\TestBench\cla_16b_TB.vhd" 
asim TESTBENCH_FOR_cla_16b 
wave 
wave -noreg c00
wave -noreg a
wave -noreg b
wave -noreg s
wave -noreg c16
wave -noreg p_dpar
wave -noreg g_dpar
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\cla_16b_TB_tim_cfg.vhd" 
# asim TIMING_FOR_cla_16b 
