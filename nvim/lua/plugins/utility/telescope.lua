---@module 'telescope'

local builtin = require('telescope.builtin')
return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-project.nvim',
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
    },
    lazy = true,
    keys = {
      { '<leader>ff', builtin.find_files, desc = 'Find Files' },
      { '<leader>fg', builtin.live_grep, desc = 'Live Grep' },
      { '<leader>fb', builtin.buffers, desc = 'Find Buffers' },
      { '<leader>fh', builtin.help_tags, desc = 'Help Tags' },
      { '<leader>fc', builtin.commands, desc = 'Commands' },
      { '<leader>fp', '<CMD>Telescope project<CR>', desc = 'Projects' },
    },
    init = function()
      require('telescope').load_extension('ui-select')
      require('telescope').load_extension('project')
    end,
  },
}
