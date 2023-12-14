# set up workspace
set origin_dir [file dirname [info script]]
setws "$origin_dir/../build"

# program FPGA bitstream
connect
target -set -filter {name =~ "PL"}
fpga "[getws]/../hw/RFSoC_4x2.bit"

# run First Stage Bootloader (FSBL) on r5
target -set -filter {name =~ "Cortex-R5 #0"}
rst -processor
dow "[getws]/rfsoc4x2_r5_standalone/export/rfsoc4x2_r5_standalone/sw/rfsoc4x2_r5_standalone/boot/fsbl.elf"
con
stop

# run Platform Management Unit (PMU) firmware initialization on r5
dow "[getws]/rfsoc4x2_r5_standalone/export/rfsoc4x2_r5_standalone/sw/rfsoc4x2_r5_standalone/boot/pmufw.elf"
con
stop

# initialize Processor System (PS), reset Programmable Logic (PL), and remove PS-PL isolation
source "[getws]/rfsoc4x2_r5_standalone/hw/psu_init.tcl"
psu_init
psu_post_config
psu_ps_pl_reset_config
psu_ps_pl_isolation_removal

# run your code on the r5!
dow "[getws]/hello_r5/Debug/hello_r5.elf"
con