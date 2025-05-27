vim.opt.laststatus = 3
return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function(_, opts)
      local trouble = require('trouble')
      local symbols = trouble.statusline({
        mode = 'lsp_document_symbols',
        groups = {},
        title = false,
        filter = { range = true },
        format = '{kind_icon}{symbol.name:Normal}',
        -- The following line is needed to fix the background color
        -- Set it to the lualine section you want to use
        hl_group = 'lualine_c_normal',
      })
      opts.sections = vim.tbl_deep_extend('force', {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
          },
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'lsp_status' },
        lualine_z = { 'location' },
      }, opts.sections or {})

      table.insert(opts.sections.lualine_c, {
        symbols.get,
        cond = symbols.has,
      })
    end,
  },
}
