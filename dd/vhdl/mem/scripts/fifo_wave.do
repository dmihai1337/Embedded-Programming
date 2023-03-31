onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Generics
add wave -noupdate /fifo_1c1r1w_tb/CLK_PERIOD
add wave -noupdate /fifo_1c1r1w_tb/DATA_WIDTH
add wave -noupdate /fifo_1c1r1w_tb/FILL_LEVEL_COUNTER
add wave -noupdate -divider Signals
add wave -noupdate /fifo_1c1r1w_tb/stop_clock
add wave -noupdate /fifo_1c1r1w_tb/clk
add wave -noupdate /fifo_1c1r1w_tb/res_n
add wave -noupdate /fifo_1c1r1w_tb/rd
add wave -noupdate /fifo_1c1r1w_tb/rd_data
add wave -noupdate /fifo_1c1r1w_tb/empty
add wave -noupdate /fifo_1c1r1w_tb/wr
add wave -noupdate /fifo_1c1r1w_tb/wr_data
add wave -noupdate /fifo_1c1r1w_tb/full
add wave -noupdate /fifo_1c1r1w_tb/half_full
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16197 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {752483 ps}
