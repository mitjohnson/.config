return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@module 'which-key
  ---@class wk.Opts
  opts = {
    spec = {
      -- global Key maps
      { '<C-h>', '<C-w><', desc = 'Decrease window width' },
      { '<C-l>', '<C-w>>', desc = 'Increase window width' },
      { '<C-j>', '<C-w>-', desc = 'Decrease window height' },
      { '<C-k>', '<C-w>+', desc = 'Increase window height' },
      { '<leader>tn', ':tabnext<CR>', desc = 'Next tab' },
      { '<leader>tp', ':tabprevious<CR>', desc = 'Previous tab' },
      { '<leader>tl', ':tablast<CR>', desc = 'Last tab' },
      { '<leader>tf', ':tabfirst<CR>', desc = 'First tab' },
      { '<leader>tc', ':tabclose<CR>', desc = 'Close current tab' },
      { '<leader>to', ':tabnew<CR>', desc = 'Open a new tab' },
      { '<leader>rn', vim.lsp.buf.rename, desc = 'LSP: Smart rename' },
      { '<leader>l', '<cmd>LspEslintFixAll<cr>', desc = 'LSP: Apply ESLint' },
      {
        'K',
        '<cmd>lua require("noice.lsp").hover()<cr>',
        desc = 'LSP: Show Definition',
      },
      {
        'gd',
        '<cmd>Telescope lsp_definitions<cr>',
        desc = 'LSP: Show References',
      },
      {
        '<leader>gt',
        '<cmd>Telescope lsp_type_definitions<cr>',
        desc = 'LSP: Show Type Definitions',
      },
      {
        '<leader>ca',
        vim.lsp.buf.code_action,
        desc = 'LSP: Show available code actions',
      },
      {
        '<leader>D',
        '<cmd>Telescope diagnostics bufnr=0<cr>',
        desc = 'LSP: Show buffer Diagnostics',
      },
      { '<leader>rs', ':LspRestart<cr>', desc = 'Reset LSP' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
