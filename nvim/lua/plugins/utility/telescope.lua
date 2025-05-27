return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    },
  },
}
