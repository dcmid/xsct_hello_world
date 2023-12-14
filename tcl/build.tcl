set origin_dir [file dirname [info script]]

setws "$origin_dir/../build"

platform create -name rfsoc4x2_r5_standalone -hw "[getws]/../hw/RFSoC_4x2.xsa" -proc psu_cortexr5_0 -os standalone
platform generate

app create -name hello_r5 -template {Hello World} -platform rfsoc4x2_r5_standalone
app build -name hello_r5