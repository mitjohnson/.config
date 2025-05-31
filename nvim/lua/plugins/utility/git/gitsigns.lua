---@module 'gitsigns.nvim'

return {
  'lewis6991/gitsigns.nvim',
  opts = { current_line_blame = true },
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' },
  init = function()
    local wk = require('which-key')

    wk.add({
      {
        '<leader>gh',
        '<cmd>Gitsigns preview_hunk<CR>',
        desc = 'Git Preview Hunk',
      },
      { '<leader>gb', '<cmd>Gitsigns blame<CR>', desc = 'Git Blame' },
    })
  end,
}
