set origin_dir [file dirname [info script]]

setws "$origin_dir/../build"

connect
target -set -filter {name =~ "PL"}
fpga "[getws]/../hw/RFSoC_4x2-0x00000000-20231213110530-darren-dev-ab7cab6.bit"

target -set -filter {name =~ "Cortex-R5 #0"}
rst -processor
dow "[getws]/rfsoc4x2_r5_standalone/export/rfsoc4x2_r5_standalone/sw/rfsoc4x2_r5_standalone/boot/fsbl.elf"
con
stop


source "[getws]/rfsoc4x2_r5_standalone/hw/psu_init.tcl"
psu_init

dow "[getws]/hello_r5/Debug/hello_r5.elf"
con