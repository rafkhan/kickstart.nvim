return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async',
  },
  event = 'BufRead',
  opts = {
    -- Use treesitter as primary provider, with indent as fallback
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end,
    -- Show fold column
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (' 󰁂 %d lines'):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end,
  },
  config = function(_, opts)
    -- Configure fold column
    vim.o.foldcolumn = '1' -- Show fold column
    vim.o.foldlevel = 99 -- Using ufo provider need a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require('ufo').setup(opts)

    -- Keymaps for folding
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'Open all folds' })
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'Close all folds' })
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'Fold less' })
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith, { desc = 'Fold more' })
    vim.keymap.set('n', 'zp', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = 'Peek fold or hover' })
  end,
}
