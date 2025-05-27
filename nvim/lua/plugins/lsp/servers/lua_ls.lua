---
--- Configuration for the Lua Language Server (lua_ls).
--- Provides LSP support for Lua files, including Neovim's Lua API.
---
return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              enable = true,
            },
            diagnostics = {
              globals = {
                'vim',
                'client',
              },
            },
            runtime = {
              -- Tell the language server which version of Lua you're using (most
              -- likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Tell the language server how to find Lua modules same way as Neovim
              -- (see `:h lua-module-load`)
              path = {
                'lua/?.lua',
                'lua/?/init.lua',
              },
            },
            workspace = {
              library = {
                ['/usr/share/nvim/runtime/lua'] = true,
                ['/usr/share/awesome/lib'] = true,
              },
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
            format = {
              enable = false,
            },
          },
        },
      },
    },
  },
}
