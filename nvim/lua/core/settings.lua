-- General Settings
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 999

vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldtext = 'v:lua.custom_fold()'

vim.opt.fillchars = {
  fold = ' ',
  foldopen = '',
  foldclose = '',
  foldsep = ' ',
}

vim.cmd([[
    highlight Folded guibg=NONE guifg=NONE
    highlight FoldColumn guibg=NONE
]])

function _G.custom_fold()
  local line = vim.fn.getline(vim.v.foldstart)
  local num_lines = vim.v.foldend - vim.v.foldstart + 1
  return string.format('%s... (%d lines)', line, num_lines)
end

