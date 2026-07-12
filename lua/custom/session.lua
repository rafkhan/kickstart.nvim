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

-- Restore ONLY the session that belongs to the current directory.
--
-- Never fall back to mini.sessions' "latest" session (`read(nil)`): on a plain
-- `nvim` in a directory without its own session, that would (1) load an
-- unrelated project's files and (2) fire SessionLoadPost, which makes the
-- snacks dashboard skip opening ("buffer has a name"). When cwd has no session,
-- do nothing and let the dashboard (ASCII art) show.
function M.restore()
  local sessions = require 'mini.sessions'
  if sessions.detected[M.name()] == nil then
    return
  end
  sessions.read(M.name())
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
