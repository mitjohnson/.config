---@module 'vim-dadbod-ui'

return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
    }, -- Optional
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    local wk = require('which-key')

    wk.add({
      { '<leader>db', '<cmd>DBUIToggle<CR>', desc = 'Toggle DBUI' },
    })

    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
