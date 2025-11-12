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

-- Open dashboard when last buffer is deleted
vim.api.nvim_create_autocmd('BufDelete', {
  group = vim.api.nvim_create_augroup('dashboard-on-empty', { clear = true }),
  callback = function(event)
    -- Don't interfere if we're quitting
    if vim.v.exiting ~= vim.NIL then
      return
    end

    -- Don't interfere with oil.nvim buffer management
    local buf_ft = vim.bo[event.buf].filetype
    if buf_ft == 'oil' then
      return
    end

    vim.schedule(function()
      local buffers = vim.tbl_filter(function(buf)
        return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
      end, vim.api.nvim_list_bufs())

      -- If no buffers remain, open the dashboard instead of exiting
      if #buffers == 0 and Snacks then
        Snacks.dashboard()
      end
    end)
  end,
  desc = 'Open dashboard when no buffers remain',
})

-- Create a smart quit function that opens dashboard instead of exiting
-- when on the last buffer/window
_G.smart_quit = function()
  local buffers = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())

  local windows = vim.api.nvim_tabpage_list_wins(0)
  local tabpages = vim.api.nvim_list_tabpages()

  -- If this is the last window in the last tab
  if #tabpages == 1 and #windows == 1 then
    -- If there are multiple buffers, just delete the current one
    if #buffers > 1 then
      vim.cmd 'bdelete'
    else
      -- Last buffer - show dashboard instead of quitting
      vim.cmd 'enew'
      vim.bo.buftype = 'nofile'
      vim.bo.bufhidden = 'wipe'
      vim.bo.buflisted = false
      if Snacks then
        Snacks.dashboard()
      end
    end
  else
    -- Not the last window/tab, just close normally
    vim.cmd 'quit'
  end
end

-- Create :Q command for smart quit
vim.api.nvim_create_user_command('Q', 'lua smart_quit()', {})
