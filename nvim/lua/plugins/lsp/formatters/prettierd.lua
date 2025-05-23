return {
  "stevearc/conform.nvim",
  opts = {
    prettierd = {
      config_command = "--config",
      config_names = {
        ".prettierrc",
        ".prettierrc.json",
        ".prettierrc.yml",
        ".prettierrc.yaml",
        ".prettierrc.json5",
        ".prettierrc.js",
      },
      config_path = ".prettierrc.json",
    }
  }
}
