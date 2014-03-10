compxlib -s mti_se -arch all -lib unisim -lib xilinxcorelib -l vhdl -dir %SIMLIB_ROOTDIR%\xilinx -log compxlib.log -w
del compxlib*.*
del modelsim.ini
pause
