return {
  vim.keymap.set('n', '<leader>rp', function()
    vim.fn.setreg('+', vim.fn.expand '%:p:.')
  end, { desc = 'Copy file [p]ath' }),
}
