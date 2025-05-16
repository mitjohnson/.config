-- https://github.com/lewis6991/gitsigns.nvim
return {
  {
    "tpope/vim-fugitive",
    init = function()
      vim.keymap.set("n", "<leader>gs", ":Git status<CR>", {})
      vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", {})
      vim.keymap.set("n", "<leader>gC", ":Git commit<CR>", {})
      vim.keymap.set("n", "<leader>gP", ":Git push<CR>", {})
      vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", {})
      vim.keymap.set("n", "<leader>gl", ":Git log<CR>", {})
      vim.keymap.set("n", "<leader>gL", ":Git log --graph --oneline<CR>", {})
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
    init = function()
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", {})
    end,
  },
}
