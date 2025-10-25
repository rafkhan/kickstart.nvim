return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>SS', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
    { '<leader>SW', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = 'Search current word' },
    { '<leader>SP', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = 'Search on current file' },
    { '<leader>SS', '<cmd>lua require("spectre").open_visual()<CR>', mode = 'v', desc = 'Search current word' },
  },
  opts = {},
  config = function()
    require('spectre').setup()

    -- Add which-key group for Spectre
    if package.loaded['which-key'] then
      require('which-key').add({
        { '<leader>S', group = 'Spectre [S]earch & Replace' },
      })
    end
  end,
}