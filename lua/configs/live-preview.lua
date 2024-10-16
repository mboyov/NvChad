local live_preview = require("livepreview")

live_preview.setup({
    port = 3000, --
    browser = "default", --
    commands = {
        start = "LivePreview",
        stop = "StopPreview",
    },
})
