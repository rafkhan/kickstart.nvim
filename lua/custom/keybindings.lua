-- Existing keybindings
vim.keymap.set('n', '<leader>rp', function()
  vim.fn.setreg('+', vim.fn.expand '%:p:.')
end, { desc = 'Copy file [p]ath' })

vim.api.nvim_set_keymap('n', 'grE', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gre', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })

-- Blackhole register keybindings
vim.keymap.set('n', 'd', '"_d', { desc = 'Delete to blackhole register' })
vim.keymap.set('v', 'd', '"_d', { desc = 'Delete to blackhole register' })
vim.keymap.set('n', 'D', '"_D', { desc = 'Delete line to blackhole register' })
vim.keymap.set('n', 'c', '"_c', { desc = 'Change to blackhole register' })
vim.keymap.set('v', 'c', '"_c', { desc = 'Change to blackhole register' })
vim.keymap.set('n', 'C', '"_C', { desc = 'Change line to blackhole register' })
-- Note: keeping X as normal delete backwards, using leader for cut line
vim.keymap.set('v', 'x', '"_x', { desc = 'Delete selection to blackhole register' })

-- Paste over text without copying to register
vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste over without copying' })

-- Cut commands that copy to clipboard (supports movements)
vim.keymap.set('n', '<leader>x', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set('v', '<leader>x', '"+d', { desc = 'Cut to clipboard' })
vim.keymap.set('n', '<leader>xx', '"+dd', { desc = 'Cut entire line to clipboard' })

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
