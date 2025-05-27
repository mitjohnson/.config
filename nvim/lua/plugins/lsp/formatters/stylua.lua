---
--- Configuration for the lua formatter (stylua).
---
return {
  'stevearc/conform.nvim',
  opts = {
    stylua = {
      config = true,
      config_command = '--config-path', -- provides fallback to global stylua config
      config_names = { '.stylua.toml', 'stylua.toml' },
      config_path = '.stylua.toml',
    },
  },
}
