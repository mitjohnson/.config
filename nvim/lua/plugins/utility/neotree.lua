return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  init = function()
    vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {})
  end,
  opts = {
    event_handlers = {

      {
        event = 'file_open_requested',
        handler = function()
          require('neo-tree.command').execute({ action = 'close' })
        end,
      },
    },
    git_status = {
      symbols = {
        -- Change type
        added = '',
        modified = '',
        deleted = '✖',
        renamed = '󰁕',
        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          'node_modules',
        },
      },
      commands = {
        avante_add_files = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local relative_path = require('avante.utils').relative_path(filepath)

          local sidebar = require('avante').get()

          local open = sidebar:is_open()
          -- ensure avante sidebar is open
          if not open then
            require('avante.api').ask()
            sidebar = require('avante').get()
          end

          sidebar.file_selector:add_selected_file(relative_path)

          -- remove neo tree buffer
          if not open then
            sidebar.file_selector:remove_selected_file(
              'neo-tree filesystem [1]'
            )
          end
        end,
      },
      window = {
        mappings = {
          ['oa'] = 'avante_add_files',
        },
      },
    },
  },
}
