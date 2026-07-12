-- Custom autocommands
-- This file contains all custom autocommands for the Neovim configuration

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'typescriptreact' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})

-- Always show 2 lines of shortcut help at the top of every oil buffer.
-- Rendered as virtual lines (not real buffer text) so they never interfere
-- with oil's edit-based file operations. Re-applied on every oil render via
-- the `OilEnter` event that oil fires after building the buffer.
local oil_help_ns = vim.api.nvim_create_namespace 'oil_help_header'
local oil_help_rows = {
  {
    { '  - ', 'Special' },
    { 'parent  ', 'NonText' },
    { '<CR> ', 'Special' },
    { 'open  ', 'NonText' },
    { '<C-s>/<C-h> ', 'Special' },
    { 'v/h split  ', 'NonText' },
    { '<C-t> ', 'Special' },
    { 'tab  ', 'NonText' },
    { '<C-p> ', 'Special' },
    { 'preview', 'NonText' },
  },
  {
    { '  g. ', 'Special' },
    { 'hidden  ', 'NonText' },
    { 'g\\ ', 'Special' },
    { 'trash  ', 'NonText' },
    { 'gs ', 'Special' },
    { 'sort  ', 'NonText' },
    { 'gx ', 'Special' },
    { 'open-ext  ', 'NonText' },
    { '_ ', 'Special' },
    { 'cwd  ', 'NonText' },
    { 'g? ', 'Special' },
    { 'help', 'NonText' },
  },
}

vim.api.nvim_create_autocmd('User', {
  pattern = 'OilEnter',
  callback = function(args)
    local bufnr = args.data and args.data.buf
    if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end
    vim.api.nvim_buf_clear_namespace(bufnr, oil_help_ns, 0, -1)
    vim.api.nvim_buf_set_extmark(bufnr, oil_help_ns, 0, 0, {
      virt_lines = oil_help_rows,
      virt_lines_above = true,
    })
  end,
})

-- Session persistence (see lua/custom/session.lua for the mini.sessions
-- wrapper). Restore the current directory's session on a plain `nvim` with
-- no file/dir arguments and nothing piped into stdin; save it on exit.
vim.api.nvim_create_autocmd('VimEnter', {
  nested = true,
  callback = function()
    if vim.fn.argc() ~= 0 or vim.fn.line2byte '$' ~= -1 then
      -- argc ~= 0: opened with file/dir args; line2byte ~= -1: stdin was
      -- piped in (e.g. `git diff | nvim -`) so the buffer already has content
      return
    end
    require('custom.session').restore()
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    require('custom.session').save()
  end,
})
