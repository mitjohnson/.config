---
--- Configuration for the prettier formatter.
---
return {
  'stevearc/conform.nvim',
  opts = {
    black = {
      config = false,
      prepend_args = { '--line-length', '79' }, -- standard black options
    },
  },
}
