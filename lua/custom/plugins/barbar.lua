return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    { 'nvim-tree/nvim-web-devicons', optional = false },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  event = 'BufRead',
  opts = {
    icons = {
      filetype = {
        enabled = true,
      },
    },
  },
  config = function()
    require('barbar').setup()

    -- Essential key mappings
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Navigate between buffers
    map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)

    -- Close buffer
    map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

    -- Buffer picker (magic mode)
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  end,
}

