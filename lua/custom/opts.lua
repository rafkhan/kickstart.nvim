vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'typescriptreact' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})
