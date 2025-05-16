-- tab settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- enable spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- number line settings
vim.opt.number = true
vim.opt.relativenumber = true

-- keymaps for adjusting window size
vim.keymap.set("n", "<C-h>", "<C-w><") -- decrease window width
vim.keymap.set("n", "<C-l>", "<C-w>>") -- increase window width
vim.keymap.set("n", "<C-j>", "<C-w>-") -- decrease window height
vim.keymap.set("n", "<C-k>", "<C-w>+") -- increase window height

-- keymaps for switching windows
vim.keymap.set("n", "<leader>h", "<C-w>h") -- move to the left window
vim.keymap.set("n", "<leader>j", "<C-w>j") -- move to the window below
vim.keymap.set("n", "<leader>k", "<C-w>k") -- move to the window above
vim.keymap.set("n", "<leader>l", "<C-w>l") -- move to the right window

-- keymaps for tab management
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>") -- Next tab
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>") -- Previous tab
vim.keymap.set("n", "<leader>tl", ":tablast<CR>") -- Last tab
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>") -- First tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>") -- Close current tab
vim.keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open a new tab
