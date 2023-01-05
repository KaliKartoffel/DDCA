onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /decimal_printer_tb/clk
add wave -noupdate /decimal_printer_tb/gfx_instr_wr
add wave -noupdate /decimal_printer_tb/start
add wave -noupdate /decimal_printer_tb/number
add wave -noupdate /decimal_printer_tb/x
add wave -noupdate /decimal_printer_tb/y
add wave -noupdate /decimal_printer_tb/uut/number_synced
add wave -noupdate /decimal_printer_tb/uut/counter
add wave -noupdate /decimal_printer_tb/uut/state
add wave -noupdate /decimal_printer_tb/uut/leading_zero_flag
add wave -noupdate /decimal_printer_tb/uut/next_leading_zero_flag
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
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
configure wave -timelineunits us
update
WaveRestoreZoom {4499998668 ps} {4500000319 ps}
