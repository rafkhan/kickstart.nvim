return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      -- Columns to display in the oil buffer
      columns = {
        'icon',
        'permissions',
        'size',
        'mtime',
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = 'no',
        cursorcolumn = false,
        foldcolumn = '0',
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = 'nvic',
      },
      -- Send deleted files to the trash instead of permanently deleting them
      delete_to_trash = true,
      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = true,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,
      -- Keymaps in oil buffer. Can be any value that vim.keymap.set accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in vertical split' },
        ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open in horizontal split' },
        ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open in new tab' },
        ['<C-p>'] = 'actions.preview',
        ['<C-c>'] = 'actions.close',
        ['<C-r>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['_'] = 'actions.open_cwd',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = 'Set cwd to oil directory (tab)' },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, '.')
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        -- Sort file names in a more intuitive order for humans
        natural_order = true,
        -- Sort case-insensitively
        case_insensitive = false,
        sort = {
          -- sort order can be "asc" or "desc"
          { 'type', 'asc' },
          { 'name', 'asc' },
        },
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 90,
        max_height = 30,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
      },
      -- Configuration for the actions floating preview window
      preview = {
        -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0.9,
        -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
        min_width = { 40, 0.4 },
        -- optionally define an integer/float for the exact width of the preview window
        width = nil,
        -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = 'rounded',
        win_options = {
          winblend = 0,
        },
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
      },
      -- Configuration for the floating progress window
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = 'rounded',
        minimized_border = 'none',
        win_options = {
          winblend = 0,
        },
      },
      -- Configuration for the floating SSH window
      ssh = {
        border = 'rounded',
      },
    },
    -- Optional dependencies
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { '-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
      { '<leader>-', '<CMD>Oil --float<CR>', desc = 'Open parent directory (floating)' },
    },
  },
}
