return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
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
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
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
@@@@@@@@@@@@@@@@@@W;#-;   =W@@@@@@@@@@W@@*=W@W  @@@@@@@@@@..+W@@@*W@@@@@W=   .-+=+@@@@@@@@@@@@@@@@@@]],
      },
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
    lazygit = { enabled = true },
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
    indent = { enabled = true },
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
