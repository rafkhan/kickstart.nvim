return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    picker = {
      enabled = true,
      -- NOTE: single-sidebar enforcement lives at the keymap layer in init.lua
      -- (close-others-then-open). Using picker.on_show for this corrupts vim's
      -- split layout because it fires AFTER the new picker has created its windows.
      -- Custom sidebar layout: input + list only, no preview block.
      -- This OVERRIDES the built-in `sidebar` preset, so even sources that hard-code
      -- `preset = "sidebar"` (like explorer) get the same clean layout with no empty preview slot.
      layouts = {
        sidebar = {
          layout = {
            backdrop = false,
            width = 40,
            min_width = 40,
            height = 0,
            position = 'left',
            border = 'none',
            box = 'vertical',
            { win = 'input', height = 1, border = true, title = '{title} {live} {flags}', title_pos = 'center' },
            { win = 'list', border = 'none' },
          },
        },
      },
      layout = { preset = 'sidebar' },
      sources = {
        files = { hidden = true },
        -- Keymaps are too wide for the 40-col sidebar: use a centered popup,
        -- and close it on confirm/leave (the sidebar's keep-open behavior
        -- doesn't make sense for a transient float). The key/description list
        -- gets 70% of the width; the code preview only 30% (the `default`
        -- preset's 50/50 split buries the descriptions).
        keymaps = {
          layout = {
            layout = {
              box = 'horizontal',
              width = 0.9,
              min_width = 120,
              height = 0.8,
              {
                box = 'vertical',
                border = true,
                title = '{title} {live} {flags}',
                { win = 'input', height = 1, border = 'bottom' },
                { win = 'list', border = 'none' },
              },
              { win = 'preview', title = '{preview}', border = true, width = 0.3 },
            },
          },
          jump = { close = true },
          auto_close = true,
        },
      },
      jump = {
        close = false, -- keep sidebar open after opening a file
      },
      auto_close = false, -- don't close when focus moves to editor
      win = {
        list = {
          keys = {
            ['q'] = 'close',
          },
        },
      },
    },
    dashboard = {
      enabled = true,
      width = 60,
      row = nil,
      col = nil,
      pane_gap = 4,
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
      preset = {
        pick = nil,
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ':Telescope find_files' },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ':Telescope live_grep' },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ':Telescope oldfiles' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua require('telescope.builtin').find_files({cwd = vim.fn.stdpath('config')})" },
          { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
        header = [[
@@@@@@@@@@@@@@@@@@@@@@  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@W  @@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@W+  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -W@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@;    *@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#    ,@@@@@@@@@@@@@@@@@@@
@@@@@@#-..=#@@@@@:     +@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*     .@@@@@W=;;-*@@@@@@
@@@@@@@@@#   +@@:        ,:#@@@@@@@@@@@@@+*@@@@@@+#@@@@@@@@@@@@@@@@@@@@@#:.        ;@@#   *@@@@@@@@@
@@@@@@@@@@ +          ,;*@@#@@@@@@@@@@@. -@@@@. :W@@@@@@*=*+@@@@@@@@@@@@#@@@@@#         :,#@@@@@@@@@
@@@@@@@@@=+W             W@@@@@@@@@@@=  =@@@;  @@@@@@@@@@@;   :*@@@@@@=*@@@@@@@@-       W#:@@@@@@@@@
@@@@@@@@@-@;     .@;      ,.@@@@@@@@;   #@W   W@@@#*@@@@@@@#    ;@@@@@ -@@@@@@@@@@:      @-@@@@@@@@@
W@@@@@@@@@@-     W@@@        .W@@@:    :@-     @@W -@@@@@@@*       ;W@ .@@@@@@@@@@@     ;@W@@@@@@@@W
W:.*@@@@@@@     @@@@@##*       -#WW:   +-,     -   ;+@@@@@@        #+@   W*@@@@@@@@@     @@@@@@@#;;#
@@:            .@@@@@=#@=      W@@W    -@@W       **  ;#W@+         @@;     =@@#=@@@-            .@@
@@@@@*          #@@@@=@@     @   -    .@#.     .#@@@@:        #@W    .@+          #W          +@@@@@
@@@@@@@ =@      ,@@@@-#     =@*               @@@@@@@@#               @@W-:               WW @@@@@@@
@@@@@@@;=@W+    +@@@@;-     W@@@W.           @@@@@@@@@@-              :@@@@@W*.         :W@W @@@@@@@
@@@@@@@+=@@W     @@@@      @@@@@@+     +     +@@@@@@@@@#    ;@*        W@@@@@@@*        W@@W:@@@@@@@
@@@@@@@@+@@ ;    =@@W     @@@@@@@*    W#@     -@@@@@@@@.   :@@@ W#+     @@@W@@@@@@-    , @@W*@@@@@@@
@@@@@@@@@@@W     +@@:     @@@@:@@,   ,@@@W*      ;*#=      W@@@ @@@@    ,@W @@@@@@+     #@@@@@@@@@@@
@@@@@@@@@W+,      @*      ;@@@ .+    ;@@@@@#+    @@@@@    @@@@@ @@@@-      .@@@@@@      ,+#@@@@@@@@@
@@@@@@@@@@@+:          =@@#+@@@      #W@@@@@@    -@@@#   ,@@@@@:@@@@=.     @@@@@;      :+@@@@@@@@@@@
@@@@@@@@@@@@@W         @@@@@@@@@.    #:@@@@@@@    @W#-    @@@@@+@@@@*+    @@@@@;      #@@@@@@@@@@@@@
@@@@@@@@@@@@@@@        @@@@@@@@@@,    =@@@@@@@     #*     #@@@@@@@@@#    =@@@@,      @@@@@@@@@@@@@@@
@@@@@@@@@@@@@@*        W@@@@@@@@@@#    +@@@@@@.   @@@@*   #@@@@@@@@@    W@@@@        +@@@@@@@@@@@@@@
@@@@@@@@@@@@@@=-@@      @@@@@@@@@@@@W;   :W@@@   W@@@@@@:  @@@@@@W;  ,+@@@@@      @@+-@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@W;#-;   =W@@@@@@@@@@W@@*=W@W  @@@@@@@@@@..+W@@@*W@@@@@W=   .-+=+@@@@@@@@@@@@@@@@@@

]],
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
    lazygit = {
      enabled = true,
      win = {
        position = 'float',
        width = 0.9, -- 90% of screen width
        height = 0.9, -- 90% of screen height
        border = 'rounded',
      },
    },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        position = 'bottom',
        height = 0.4, -- 40% of screen height
        border = 'rounded',
        title = ' Terminal ',
        title_pos = 'center',
        footer = ' Press <C-/> or <leader>rt to toggle ',
        footer_pos = 'center',
        wo = {
          winblend = 0,
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
        },
      },
    },
    indent = {
      enabled = true,
      char = '┊',
      scope = {
        enabled = true,
        char = '┊',
      },
    },
    animate = { enabled = true },
    scroll = { enabled = true },
    toggle = { enabled = true },
  },
  keys = {
    -- Lazygit
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log()
      end,
      desc = 'Lazygit Log',
    },
    {
      '<leader>gL',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit Log (File)',
    },
    -- Git
    {
      '<leader>ghb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gob',
      function()
        Snacks.gitbrowse()
      end,
      desc = 'Git Browse',
      mode = { 'n', 'v' },
    },
    -- Terminal
    {
      '<leader>rt',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
    {
      '<C-/>',
      function()
        Snacks.terminal()
      end,
      desc = 'Toggle Terminal',
    },
  },
}
