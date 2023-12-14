WORK_DIR := build
FSBL := $(WORK_DIR)/rfsoc4x2_r5_standalone/export/rfsoc4x2_r5_standalone/sw/rfsoc4x2_r5_standalone/boot/fsbl.elf
PSU_INIT := $(WORK_DIR)/rfsoc4x2_r5_standalone/hw/psu_init.tcl
ELF := $(WORK_DIR)/hello_r5/Debug/hello_r5.elf


$(FSBL) $(PSU_INIT) $(ELF): hw/RFSoC_4x2.xsa | $(WORK_DIR)
	xsct tcl/build.tcl

debug: $(FSBL) $(PSU_INIT) $(ELF) | $(WORK_DIR) 
	xsct tcl/debug.tcl

$(WORK_DIR):
	mkdir $(WORK_DIR)

clean:
	rm -rf ./$(WORK_DIR)/*
	rm -rf ./$(WORK_DIR)/.analytics ./$(WORK_DIR)/.metadata ./$(WORK_DIR)/.Xil

.PHONY: debug clean
