onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /fpga_fmc230_top_tb/clk_out
add wave -noupdate -format Logic /fpga_fmc230_top_tb/clk_tb
add wave -noupdate -format Logic /fpga_fmc230_top_tb/logic_0
add wave -noupdate -format Logic /fpga_fmc230_top_tb/logic_1
add wave -noupdate -format Logic /fpga_fmc230_top_tb/reset
add wave -noupdate -format Logic /fpga_fmc230_top_tb/reset_b
add wave -noupdate -format Logic /fpga_fmc230_top_tb/sim_done
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14216152 ps} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {21 us}
