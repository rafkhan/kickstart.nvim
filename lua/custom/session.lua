-- Per-project session persistence built on mini.sessions.
-- mini.sessions never creates a session on its own (autowrite only saves a
-- session that is already active), so `save` is called from a VimLeavePre
-- autocmd to create/update one global session per working directory.
local M = {}

-- Session files live in a single flat directory, so encode the cwd into the
-- file name (same scheme persistence.nvim uses)
function M.name()
  return (vim.fn.getcwd():gsub('[\\/:]', '%%'))
end

-- Restore the session for cwd if one exists, otherwise fall back to
-- mini.sessions' default (local Session.vim, else latest global session)
function M.restore()
  local sessions = require 'mini.sessions'
  local name = sessions.detected[M.name()] ~= nil and M.name() or nil
  if name == nil and vim.tbl_isempty(sessions.detected) then
    vim.notify('No sessions found', vim.log.levels.INFO)
    return
  end
  sessions.read(name)
end

function M.save()
  -- An active session is already autowritten by mini.sessions itself
  if vim.v.this_session ~= '' then
    return
  end
  -- Only persist when at least one real file buffer is open, so quick
  -- scratch/pager/dashboard-only runs don't create sessions
  local has_file = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buflisted and vim.bo[buf].buftype == '' and vim.api.nvim_buf_get_name(buf) ~= '' then
      has_file = true
      break
    end
  end
  if not has_file then
    return
  end
  local ok, sessions = pcall(require, 'mini.sessions')
  if ok then
    sessions.write(M.name(), { verbose = false })
  end
end

return M
