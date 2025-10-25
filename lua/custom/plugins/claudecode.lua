return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    -- Terminal positioning (right side like Cursor)
    split_side = "right",
    split_width_percentage = 0.4,
    provider = "snacks",

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

    -- Floating window setup for snacks
    snacks_win_opts = {
      position = "float",
      width = 0.85,
      height = 0.85,
    },

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

    -- Context management
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add file from tree" },

    -- Send selection
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },

    -- Diff operations
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject diff" },
  },
}
