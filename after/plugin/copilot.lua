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
