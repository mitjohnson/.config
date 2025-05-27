return {
  'rebelot/kanagawa.nvim',

  opts = {
    compile = false, -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = { -- add/modify theme and palette colors
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {
          ui = {
            bg_gutter = 'none',
          },
        },
      },
    },
    overrides = function(colors) -- add/modify highlights
      local theme = colors.theme
      local makeDiagnosticColor = function(color)
        local c = require('kanagawa.lib.color')
        return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
      end
      return {
        DiagnosticVirtualTextHint = makeDiagnosticColor(theme.diag.hint),
        DiagnosticVirtualTextInfo = makeDiagnosticColor(theme.diag.info),
        DiagnosticVirtualTextWarn = makeDiagnosticColor(theme.diag.warning),
        DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

        FloatBorder = { bg = 'NONE' },
        NormalFloat = { bg = 'NONE' },
        LineNr = { fg = '#C0A36E', bg = 'NONE' },
        CursorLineNr = { fg = colors.palette.sakuraPink, bg = 'NONE' },
      }
    end,
    theme = 'dragon', -- Load "wave" theme
    background = { -- map the value of 'background' option to a theme
      dark = 'dragon',
      light = 'lotus',
    },
  },
  init = function()
    vim.cmd('colorscheme kanagawa')
  end,
}
