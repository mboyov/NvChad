local live_preview = require("live-preview")

live_preview.setup({
    port = 5500, -- ou tout autre port de ton choix
    browser = "default", -- Ou spécifie ton navigateur, par exemple "firefox", "chrome"
    commands = {
        start = "LivePreview",
        stop = "StopPreview",
    },
})
