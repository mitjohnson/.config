return {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
    init = function()
      vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", {})
    end,
}
