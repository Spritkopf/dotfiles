---@module 'hl'

hl.workspace_rule({
    workspace = 1,
    monitor = "desc:Iiyama North America PL2480H 11182M3300120",
    default = false,
})

hl.workspace_rule({
    workspace = 3,
    monitor = "desc:LG Electronics LG TV 0x01010101",
    default = true,
})

hl.workspace_rule({
    workspace = 2,
    monitor = "desc:Dell Inc. DELL U2715H GH85D76G1K2S",
    default = true,
})

hl.exec_cmd("sleep 1 && hyprctl dispatch 'hl.dsp.focus({ workspace = 2 })'")
