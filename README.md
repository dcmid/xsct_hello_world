# XSCT Hello World Project
This is an example project showing how Processor System (PS) firmware can be built and run on the RFSoC4x2 without using the Vitis GUI.

## Quick Start
To run the hello world program, just execute:

```make debug```

## Notes
This project is configured to run on the Xona fpga-dev-station with one RFSoC_4x2 connected. Behavior with multiple boards connected has not been tested.

The Hello World output will be output over serial, so you will need to use a serial monitor such as minicom or putty to view it.