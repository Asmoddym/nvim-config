require('gitsigns').setup({
  linehl = false,
  signcolumn = true,
  word_diff = false,
  numhl = false,
  -- auto_attach = false,
  current_line_blame = true,
  -- current_line_blame_opts = {
  --   delay = 250,
  --   virt_text_pos = 'right_align'
  -- }
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
    delay = 250,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },

  signs = {
    add          = { text = '│'},
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },

  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = "preview hunk" })
    vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline)

    vim.keymap.set('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end, { desc = "blame" })
  end
})

-- require('gitsigns').setup{
-- signs = {
--     add          = { text = '│┃' },
--     change       = { text = '┃' },
--     delete       = { text = '_' },
--     topdelete    = { text = '‾' },
--     changedelete = { text = '~' },
--     untracked    = { text = '┆' },
--   },
--   signs_staged = {
--     add          = { text = '┃' },
--     change       = { text = '┃' },
--     delete       = { text = '_' },
--     topdelete    = { text = '‾' },
--     changedelete = { text = '~' },
--     untracked    = { text = '┆' },
--   },
--   signs_staged_enable = true,
--   signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
--   numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
--   linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
--   word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
--   watch_gitdir = {
--     follow_files = true
--   },
--   auto_attach = true,
--   attach_to_untracked = false,
--   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
--   current_line_blame_opts = {
--     virt_text = true,
--     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--     delay = 1000,
--     ignore_whitespace = false,
--     virt_text_priority = 100,
--     use_focus = true,
--   },
--   current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
--   sign_priority = 6,
--   update_debounce = 100,
--   status_formatter = nil, -- Use default
--   max_file_length = 40000, -- Disable if file is longer than this (in lines)
--   preview_config = {
--     -- Options passed to nvim_open_win
--     style = 'minimal',
--     relative = 'cursor',
--     row = 0,
--     col = 1
--   },
-- }
