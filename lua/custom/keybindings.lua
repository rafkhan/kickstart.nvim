-- Existing keybindings
vim.keymap.set('n', '<leader>rp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p:.')
end, { desc = 'Copy file [p]ath' })

vim.api.nvim_set_keymap('n', 'grE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gre', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- -- Blackhole register keybindings
-- -- d deletes without copying (blackhole register)
-- vim.keymap.set('n', 'd', '"_d', { desc = 'Delete to blackhole register' })
-- vim.keymap.set('v', 'd', '"_d', { desc = 'Delete to blackhole register' })
-- vim.keymap.set('n', 'D', '"_D', { desc = 'Delete line to blackhole register' })

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

-- Tab management
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', { desc = 'Close tab' })

-- Terminal
vim.keymap.set('n', '<leader>T', function()
  vim.cmd 'botright 10split | terminal'
end, { desc = 'Open [T]erminal' })

-- Closing buffers
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferClose<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>bC', '<Cmd>BufferClose!<CR>', { desc = 'Close (Force)' })
vim.keymap.set('n', '<leader>bd', '<Cmd>BufferClose<CR>', { desc = 'Delete' })
vim.keymap.set('n', '<leader>bD', '<Cmd>BufferClose!<CR>', { desc = 'Delete (Force)' })
vim.keymap.set('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', { desc = 'Close All But Current' })
vim.keymap.set('n', '<leader>bO', '<Cmd>BufferCloseAllButPinned<CR>', { desc = 'Close All But Pinned' })

-- Pinning
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferPin<CR>', { desc = 'Pin/Unpin' })
