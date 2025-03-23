return {
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          default_prompt = " ",
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        select = {
          enabled = true,
          backend = "telescope",
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
      })
    end,
  },
}
