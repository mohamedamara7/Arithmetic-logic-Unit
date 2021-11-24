SetActiveLib -work
comp -include "$DSN\src\ripple_cnt.vhd" 
comp -include "$DSN\src\TestBench\r_cnt_TB.vhd" 
asim TESTBENCH_FOR_r_cnt 
wave 
wave -noreg clk
wave -noreg clr
wave -noreg cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$DSN\src\TestBench\r_cnt_TB_tim_cfg.vhd" 
# asim TIMING_FOR_r_cnt 
