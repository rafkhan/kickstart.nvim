return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  event = 'VimEnter',
  config = function()
    require('fine-cmdline').setup({
      popup = {
        border = {
          style = 'rounded',
        },
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:Normal',
        },
      },
    })

    -- Set a keymap to open fine-cmdline
    vim.keymap.set('n', ':', '<cmd>FineCmdline<cr>', { desc = 'Fine Cmdline' })
  end,
}
