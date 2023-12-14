# set up workspace
set origin_dir [file dirname [info script]]
setws "$origin_dir/../build"

# set up platform project
platform create -name rfsoc4x2_r5_standalone -hw "[getws]/../hw/RFSoC_4x2.xsa" -proc psu_cortexr5_0 -os standalone
platform generate

# set up application project

# use this for template
# app create -name hello_r5 -template {Hello World} -platform rfsoc4x2_r5_standalone
# app build -name hello_r5

# use this for custom source code
app create -name hello_r5 -template {Empty Application(C)} -platform rfsoc4x2_r5_standalone
importsources -name hello_r5 -path "[getws]/../src"
app build -name hello_r5