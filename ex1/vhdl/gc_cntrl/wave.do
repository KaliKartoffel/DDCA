onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /gc_cntrl_tb/data
add wave -noupdate /gc_cntrl_tb/clk
add wave -noupdate /gc_cntrl_tb/res_n
add wave -noupdate /gc_cntrl_tb/cntrl_state
add wave -noupdate /gc_cntrl_tb/cntrl_state_right
add wave -noupdate /gc_cntrl_tb/data_to_send
add wave -noupdate /gc_cntrl_tb/uut/state
add wave -noupdate /gc_cntrl_tb/uut/data_synced
add wave -noupdate /gc_cntrl_tb/uut/clk_cnt
add wave -noupdate /gc_cntrl_tb/uut/next_state
add wave -noupdate /gc_cntrl_tb/uut/ONE_US
add wave -noupdate /gc_cntrl_tb/uut/shiftreg_btns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {378457184 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 130
configure wave -valuecolwidth 40
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
WaveRestoreZoom {378452887 ps} {378489114 ps}
