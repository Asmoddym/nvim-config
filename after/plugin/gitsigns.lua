require('gitsigns').setup({
  linehl = false,
  signcolumn = false,
  word_diff = false,
  numhl = false,
  -- auto_attach = false,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 250,
    virt_text_pos = 'right_align'
  }
})

