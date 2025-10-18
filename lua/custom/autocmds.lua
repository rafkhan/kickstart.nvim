-- Custom autocommands
-- This file contains all custom autocommands for the Neovim configuration

-- Auto-refresh LSP when new files are created or written
-- This helps LSP recognize newly created files in the project
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufWritePost' }, {
  group = vim.api.nvim_create_augroup('custom-lsp-refresh', { clear = true }),
  pattern = '*',
  callback = function()
    -- Only restart if LSP is already attached to avoid unnecessary restarts
    if next(vim.lsp.get_clients { bufnr = 0 }) then
      vim.cmd 'LspRestart'
    end
  end,
  desc = 'Refresh LSP when new files are created or written',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'typescriptreact' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

-- Add more autocommands here as needed

