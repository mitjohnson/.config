return {
  "yetone/avante.nvim",
  lazy = true,
  event = "VeryLazy",
  version = false,   -- Never set this value to "*"! Never!
  opts = {
    provider = "copilot",
    behavior = {
      auto_suggestions = false,
    }
  },
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",   -- for file_selector provider fzf
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  }
}
