-- https://github.com/lewis6991/gitsigns.nvim
return {
  {
    "tpope/vim-fugitive",
    init = function()
      vim.keymap.set("n", "<leader>gs", ":Git status<CR>", {})
      vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", {})
      vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Git push<CR>", {})
      vim.keymap.set("n", "<leader>gr", ":Git rebase<CR>", {})
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", {})
      vim.keymap.set("n", "<leader>gL", ":Git log --graph --oneline<CR>", {})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
    init = function()
      vim.keymap.set("n", "<leader>th", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
}
