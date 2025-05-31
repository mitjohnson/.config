---@module 'oil'

return {
  'stevearc/oil.nvim',
  ---@type oil.SetupOpts
  opts = {
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  init = function()
    vim.keymap.set('n', '-', function()
      require('oil').open()
    end, { desc = 'Open Oil' })
  end
}
