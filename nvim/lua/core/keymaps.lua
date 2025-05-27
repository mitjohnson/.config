-- keymaps for adjusting window size
vim.keymap.set('n', '<C-h>', '<C-w><') -- decrease window width
vim.keymap.set('n', '<C-l>', '<C-w>>') -- increase window width
vim.keymap.set('n', '<C-j>', '<C-w>-') -- decrease window height
vim.keymap.set('n', '<C-k>', '<C-w>+') -- increase window height

-- keymaps for switching windows
vim.keymap.set('n', '<leader>h', '<C-w>h') -- move to the left window
vim.keymap.set('n', '<leader>j', '<C-w>j') -- move to the window below
vim.keymap.set('n', '<leader>k', '<C-w>k') -- move to the window above
vim.keymap.set('n', '<leader>l', '<C-w>l') -- move to the right window

-- keymaps for tab management
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>') -- Next tab
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>') -- Previous tab
vim.keymap.set('n', '<leader>tl', ':tablast<CR>') -- Last tab
vim.keymap.set('n', '<leader>tf', ':tabfirst<CR>') -- First tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>') -- Close current tab
vim.keymap.set('n', '<leader>to', ':tabnew<CR>') -- Open a new tab

-- LSP keymaps
vim.keymap.set(
  'n',
  'K',
  require('noice.lsp').hover,
  { desc = 'Show Definition' }
)
vim.keymap.set(
  'n',
  'gd',
  '<cmd>Telescope lsp_definitions<cr>',
  { desc = 'Show LSP References' }
)
vim.keymap.set(
  'n',
  '<leader>gt',
  '<cmd>Telescope lsp_type_definitions<cr>',
  { desc = 'Show LSP Type Definitions' }
)
vim.keymap.set(
  'n',
  '<leader>ca',
  vim.lsp.buf.code_action,
  { desc = 'Show available code actions' }
)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Smart rename' })
vim.keymap.set(
  'n',
  '<leader>D',
  '<cmd>Telescope diagnostics bufnr=0<cr>',
  { desc = 'Show buffer Diagnostics' }
)
vim.keymap.set('n', '<leader>rs', ':LspRestart<cr>', { desc = 'Reset LSP' })
