#################################################################
# CLOCK Constraints for V7 - FiFo implementation
#################################################################
#
# specify the clocks in this file

create_clock -period 10.000 -name clk_in -waveform {5.000 10.000} [get_nets clk_in]
create_clock -period 10.000 -name clk_out -waveform {2.500 7.500} [get_nets clk_out]

#################################################################


