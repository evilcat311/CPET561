set_global_assignment -entity "unsaved" -library "lib_unsaved" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "unsaved" -library "lib_unsaved" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "unsaved" -library "lib_unsaved" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_unsaved" -name SPD_FILE [file join $::quartus(sip_path) "../unsaved.spd"]
set_global_assignment -library "lib_unsaved" -name MISC_FILE [file join $::quartus(sip_path) "../../unsaved.qsys"]

set_global_assignment -library "lib_unsaved" -name MISC_FILE [file join $::quartus(sip_path) "unsaved.vhd"]
set_global_assignment -library "lib_unsaved" -name MISC_FILE [file join $::quartus(sip_path) "submodules/unsaved_jtag_uart_0.vhd"]
