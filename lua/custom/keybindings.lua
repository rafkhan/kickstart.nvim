-- Existing keybindings
vim.keymap.set('n', '<leader>rp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p:.')
end, { desc = 'Copy file [p]ath' })

vim.api.nvim_set_keymap('n', 'grE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gre', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- Blackhole register keybindings
-- vim.keymap.set('n', 'd', '"_d', { desc = 'Delete to blackhole register' })
-- vim.keymap.set('v', 'd', '"_d', { desc = 'Delete to blackhole register' })
-- vim.keymap.set('n', 'D', '"_D', { desc = 'Delete line to blackhole register' })
-- vim.keymap.set('n', 'c', '"_c', { desc = 'Change to blackhole register' })
-- vim.keymap.set('v', 'c', '"_c', { desc = 'Change to blackhole register' })
-- vim.keymap.set('n', 'C', '"_C', { desc = 'Change line to blackhole register' })
-- Note: keeping X as normal delete backwards, using leader for cut line
-- vim.keymap.set('v', 'x', '"_x', { desc = 'Delete selection to blackhole register' })

-- Paste over text without copying to register
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste over without copying' })

-- Comment toggle with Cmd+/ (D-/)
vim.keymap.set('n', '<D-/>', 'gcc', { desc = 'Toggle comment line', remap = true })
vim.keymap.set('v', '<D-/>', 'gc', { desc = 'Toggle comment selection', remap = true })
vim.keymap.set('i', '<D-/>', '<C-o>gcc', { desc = 'Toggle comment line', remap = true })

-- Save with Cmd+S (D-s)
vim.keymap.set('n', '<D-s>', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('i', '<D-s>', '<C-o><cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('v', '<D-s>', '<C-c><cmd>w<cr>', { desc = 'Save file' })

-- Terminal
vim.keymap.set('n', '<leader>T', function()
  vim.cmd 'botright 10split | terminal'
end, { desc = 'Open [T]erminal' })

-- Buffer management (barbar)
-- Navigation
-- vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPrevious<CR>', { desc = 'Previous' })
-- vim.keymap.set('n', '<leader>bn', '<Cmd>BufferNext<CR>', { desc = 'Next' })
-- vim.keymap.set('n', '<leader>bb', '<Cmd>BufferPick<CR>', { desc = 'Pick Buffer' })
-- vim.keymap.set('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', { desc = 'Go to 1' })
-- vim.keymap.set('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', { desc = 'Go to 2' })
-- vim.keymap.set('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', { desc = 'Go to 3' })
-- vim.keymap.set('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', { desc = 'Go to 4' })
-- vim.keymap.set('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', { desc = 'Go to 5' })
-- vim.keymap.set('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', { desc = 'Go to 6' })
-- vim.keymap.set('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>', { desc = 'Go to 7' })
-- vim.keymap.set('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>', { desc = 'Go to 8' })
-- vim.keymap.set('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>', { desc = 'Go to 9' })
-- vim.keymap.set('n', '<leader>b0', '<Cmd>BufferLast<CR>', { desc = 'Last' })

-- Reordering
-- vim.keymap.set('n', '<leader>b<', '<Cmd>BufferMovePrevious<CR>', { desc = 'Move Left' })
-- vim.keymap.set('n', '<leader>b>', '<Cmd>BufferMoveNext<CR>', { desc = 'Move Right' })

-- Closing buffers
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>bC', '<Cmd>BufferClose!<CR>', { desc = 'Close (Force)' })
vim.keymap.set('n', '<leader>bd', '<Cmd>BufferClose<CR>', { desc = 'Delete' })
vim.keymap.set('n', '<leader>bD', '<Cmd>BufferClose!<CR>', { desc = 'Delete (Force)' })
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close All But Current' })
vim.keymap.set('n', '<leader>bO', '<Cmd>BufferCloseAllButPinned<CR>', { desc = 'Close All But Pinned' })
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferCloseBuffersLeft<CR>', { desc = 'Close All Left' })
vim.keymap.set('n', '<leader>br', '<Cmd>BufferCloseBuffersRight<CR>', { desc = 'Close All Right' })

-- Pinning
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferPin<CR>', { desc = 'Pin/Unpin' })

-- Sorting
vim.keymap.set('n', '<leader>bse', '<Cmd>BufferOrderByBufferNumber<CR>', { desc = 'By Number' })
vim.keymap.set('n', '<leader>bsd', '<Cmd>BufferOrderByDirectory<CR>', { desc = 'By Directory' })
vim.keymap.set('n', '<leader>bsl', '<Cmd>BufferOrderByLanguage<CR>', { desc = 'By Language' })
vim.keymap.set('n', '<leader>bsw', '<Cmd>BufferOrderByWindowNumber<CR>', { desc = 'By Window' })
