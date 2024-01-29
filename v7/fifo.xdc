#################################################################
# Constraints for V7 - FiFo implementation
#################################################################
#
# !!!! DO NOT CHANGE THIS FILE !!!!
#
#################################################################

# Inputs ########################################################
#################################################################

# data_in
set_property PACKAGE_PIN AB10 [get_ports {data_in[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[7]}]
set_property PACKAGE_PIN AB9 [get_ports {data_in[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[6]}]
set_property PACKAGE_PIN AB7 [get_ports {data_in[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[5]}]
set_property PACKAGE_PIN AB6 [get_ports {data_in[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[4]}]
set_property PACKAGE_PIN AB5 [get_ports {data_in[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[3]}]
set_property PACKAGE_PIN AB4 [get_ports {data_in[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[2]}]
set_property PACKAGE_PIN AB2 [get_ports {data_in[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[1]}]
set_property PACKAGE_PIN AB1 [get_ports {data_in[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_in[0]}]


# we
set_property PACKAGE_PIN AB12 [get_ports we]
set_property IOSTANDARD LVCMOS33 [get_ports we]

# re
set_property PACKAGE_PIN AB14 [get_ports re]
set_property IOSTANDARD LVCMOS33 [get_ports re]


# clk_in
set_property PACKAGE_PIN Y9 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]

# clk_out
set_property PACKAGE_PIN Y19 [get_ports clk_out]
set_property IOSTANDARD LVCMOS33 [get_ports clk_out]

# res
set_property PACKAGE_PIN Y6 [get_ports res]
set_property IOSTANDARD LVCMOS33 [get_ports res]



# Outputs ########################################################
#################################################################

# data_out
set_property PACKAGE_PIN W22 [get_ports {data_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[7]}]
set_property PACKAGE_PIN W21 [get_ports {data_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[6]}]
set_property PACKAGE_PIN W20 [get_ports {data_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[5]}]
set_property PACKAGE_PIN W18 [get_ports {data_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[4]}]
set_property PACKAGE_PIN W17 [get_ports {data_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[3]}]
set_property PACKAGE_PIN W16 [get_ports {data_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[2]}]
set_property PACKAGE_PIN W15 [get_ports {data_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[1]}]
set_property PACKAGE_PIN W13 [get_ports {data_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data_out[0]}]

# empty
set_property PACKAGE_PIN AB22 [get_ports empty]
set_property IOSTANDARD LVCMOS33 [get_ports empty]

# level_reached
set_property PACKAGE_PIN AB21 [get_ports level_reached]
set_property IOSTANDARD LVCMOS33 [get_ports level_reached]

# full
set_property PACKAGE_PIN AB20 [get_ports full]
set_property IOSTANDARD LVCMOS33 [get_ports full]