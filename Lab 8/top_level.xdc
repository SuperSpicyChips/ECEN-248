#Switches
set_property PACKAGE_PIN G15 [get_port {SWs[0]}]
set_property IOSTANDARD LVCMOS33 [get_port {SWs[0]}]
set_property PACKAGE_PIN P15 [get_ports {SWs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SWs[1]}]

##Buttons
##IO_L20N_T3_34
set_property PACKAGE_PIN K18 [get_port {BTNs[0]}]
set_property IOSTANDARD LVCMOS33 [get_port {BTNs[0]}]
set_property PACKAGE_PIN P16 [get_ports {BTNs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[1]}]

##LEDS
##IO_L20N_T3_35
set_property PACKAGE_PIN M14 [get_port {LEDs[0]}]
set_property IOSTANDARD LVCMOS33 [get_port {LEDs[0]}]
set_property PACKAGE_PIN M15 [get_ports {LEDs[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]
set_property PACKAGE_PIN G14 [get_ports {LEDs[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[2]}]
set_property PACKAGE_PIN D18 [get_ports {LEDs[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[3]}]

##Clock Signal
set_property PACKAGE_PIN K17 [get_ports FastClk]
set_property IOSTANDARD LVCMOS33 [get_ports FastClk]
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports FastClk]
