REM load create the project
quartus_sh -t create.tcl

REM generate the nessessary qsys files
cd ../src/HW/nios_system
call nios_systyem_hw.bat
cd ../../../HW

REM load all the files
quartus_sh -t load.tcl
pause
