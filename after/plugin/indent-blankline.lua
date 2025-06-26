local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "iblScope", { fg = "#4B5474" })
end)

require('ibl').setup({
  scope = { enabled = true, show_start = false, show_end = false },
  indent = {
    char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
  },
})
