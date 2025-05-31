---
--- Configures the shfmt formatter for shell scripts.
---
return {
  'stevearc/conform.nvim',
  opts = {
    shfmt = {
      config = false, -- no config files available for shfmt
      prepend_args = { '-i', '2', '-ci', '-sr', '-bn' }, -- tabs, indent, and other formatting options
    },
  },
}
