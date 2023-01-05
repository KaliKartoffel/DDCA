create_clock -name "clk" -period 20.000ns [get_ports {clk}]
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty

set_false_path -from [get_clocks {clk}] -to [get_clocks {PLL_inst|altpll_component|auto_generated|pll1|clk[0]}];