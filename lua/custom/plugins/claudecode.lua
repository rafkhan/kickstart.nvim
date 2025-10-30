return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- Terminal configuration with floating window
    terminal = {
      provider = "snacks",
      snacks_win_opts = {
        position = "float",
        width = 0.9,
        height = 0.9,
        border = "rounded",
        wo = {
          winblend = 0,  -- No transparency
        },
        keys = {
          claude_hide = {
            "<C-,>",
            function(self) self:hide() end,
            mode = "t",
            desc = "Hide Claude window"
          }
        }
      },
    },

    -- Diff configuration for better code review
    diff_opts = {
      auto_close_on_accept = true,
      vertical_split = true,
      open_in_current_tab = true,
      keep_terminal_focus = false,
    },

    -- Real-time selection tracking (Cursor-like behavior)
    track_selection = true,
    visual_demotion_delay_ms = 300,

    -- Server configuration
    auto_start = true,
    log_level = "warn",

    -- Git-aware working directory
    git_repo_cwd = true,
  },

  keys = {
    -- Core commands (recommended mappings from README)
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select model" },
    { "<leader>aq", "<cmd>ClaudeCode --quit<cr>", desc = "Quit Claude" },
    { "<leader>aR", "<cmd>ClaudeCode --restart<cr>", desc = "Restart Claude" },
    { "<leader>al", "<cmd>ClaudeCodeLogs<cr>", desc = "View Claude logs" },

    -- Context management
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>aB", "<cmd>ClaudeCodeAdd .<cr>", desc = "Add entire project" },
    { "<leader>aw", "<cmd>ClaudeCodeAdd<cr>", desc = "Add current working directory" },
    { "<leader>at", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file from tree" },
    { "<leader>aT", function()
        -- Integration with neo-tree
        if vim.bo.filetype == 'neo-tree' then
          local state = require('neo-tree.sources.manager').get_state('filesystem')
          local node = state.tree:get_node()
          if node then
            vim.cmd('ClaudeCodeAdd ' .. node.path)
            vim.notify('Added ' .. node.name .. ' to Claude context')
          end
        else
          vim.cmd('ClaudeCodeTreeAdd')
        end
      end, desc = "Add selected file/folder to Claude" },
    { "<leader>aF", "<cmd>ClaudeCodeAdd --files<cr>", desc = "Add files interactively" },
    { "<leader>ax", "<cmd>ClaudeCodeClear<cr>", desc = "Clear Claude context" },

    -- Send operations
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    { "<leader>aS", "<cmd>ClaudeCodeSend %<cr>", desc = "Send entire buffer" },
    { "<leader>ap", "<cmd>ClaudeCodePrompt<cr>", desc = "Send custom prompt" },

    -- Chat operations
    { "<leader>ai", "<cmd>ClaudeCodeChat<cr>", desc = "Start new chat" },
    { "<leader>ah", "<cmd>ClaudeCodeHistory<cr>", desc = "View chat history" },
    { "<leader>an", "<cmd>ClaudeCodeNew<cr>", desc = "New Claude session" },

    -- Diff operations
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
    { "<leader>av", "<cmd>ClaudeCodeDiffView<cr>", desc = "View diff" },
    { "<leader>au", "<cmd>ClaudeCodeDiffUndo<cr>", desc = "Undo last diff" },

    -- Workspace integration
    { "<leader>ae", function()
        -- Integration with existing neo-tree workflow
        vim.cmd('Neotree reveal')
        vim.defer_fn(function()
          vim.cmd('ClaudeCodeTreeAdd')
        end, 100)
      end, desc = "Open file tree and add to Claude" },
  },
}
