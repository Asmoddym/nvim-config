vim.keymap.set('i', '<S-TAB>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


vim.g.copilot_filetypes = {
  ['*'] = false,
  ['javascript'] = true,
  ['typescript'] = true,
  ['typescriptreact'] = true,
  ['typescript.tsx'] = true,
  ['javascriptreact'] = true,
  ['json'] = true,
  ['jsonc'] = true,
  ['markdown'] = true,
  ['html'] = true,
  ['ruby'] = true,
  ['lua'] = true
}

require("CopilotChat").setup({})

-- require('gitlab').setup({
--   statusline = {
--     enabled = false
--   },
--   code_suggestions = {
--     -- For the full list of default languages, see the 'auto_filetypes' array in
--     -- https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim/-/blob/main/lua/gitlab/config/defaults.lua
--     auto_filetypes = { 'ruby', 'javascript' }, -- Default is { 'ruby' }
--     ghost_text = {
--       enabled = true, -- ghost text is an experimental feature
--       toggle_enabled = "<C-h>",
--       accept_suggestion = "<S-TAB>",
--       clear_suggestions = "<C-k>",
--       stream = false,
--     },
--   }
-- })
--
--
