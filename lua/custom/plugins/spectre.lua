return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '<leader>Sr', '<cmd>lua require("spectre").toggle()<CR>', desc = 'Toggle Spectre' },
    { '<leader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = 'Search current word' },
    { '<leader>Sw', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = 'Search on current file' },
    { '<leader>Ss', '<cmd>lua require("spectre").open_visual()<CR>', mode = 'v', desc = 'Search current word' },
  },
  opts = {},
  config = function()
    require('spectre').setup {
      mapping = {
        ['toggle_fixed_strings'] = {
          map = 'tf',
          cmd = "<cmd>lua require('spectre').change_options('fixed-strings')<CR>",
          desc = 'toggle fixed strings (literal search)',
        },
      },
      find_engine = {
        ['rg'] = {
          cmd = 'rg',
          args = {
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
          },
          options = {
            ['ignore-case'] = {
              value = '--ignore-case',
              icon = '[I]',
              desc = 'ignore case',
            },
            ['hidden'] = {
              value = '--hidden',
              icon = '[H]',
              desc = 'hidden file',
            },
            ['fixed-strings'] = {
              value = '--fixed-strings',
              icon = '[F]',
              desc = 'fixed strings (literal search)',
            },
          },
        },
      },
    }

    -- Add which-key group for Spectre
    if package.loaded['which-key'] then
      require('which-key').add {
        { '<leader>S', group = 'Spectre [S]earch & Replace' },
      }
    end
  end,
}

