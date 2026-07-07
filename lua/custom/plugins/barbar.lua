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
    map('n', '[b', '<Cmd>BufferPrevious<CR>', vim.tbl_extend('force', opts, { desc = 'Previous buffer' }))
    map('n', ']b', '<Cmd>BufferNext<CR>', vim.tbl_extend('force', opts, { desc = 'Next buffer' }))

    -- Close buffer
    map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)

    -- Buffer picker (magic mode)
    map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
  end,
}

