return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "williamboman/mason.nvim",             config = true },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "html",
          "emmet_language_server",
          "typos_lsp",
          "cssls",
          "bashls",
          "pylsp",
          "vimls",
          "lua_ls",
          "eslint",
          "ts_ls",
          "volar",
        },
        version = {
          ["vue-language-server"] = "v2.2.8",
        },
      },
    },
  },
  import = "plugins.lsp.servers",

  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = false,
      severity_sort = true,
      signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
      },
    },
  },
  config = function(l, opts)
    local file_types = {}
    local handlers = {}
    local on_attach = function(client, bufnr)
      local keymap_opts = { noremap = true, silent = true, buffer = bufnr }

      -- Keymaps
      vim.keymap.set("n", "K", require('noice.lsp').hover, { desc = "Show Definition", unpack(keymap_opts) })
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>",
        { desc = "Show LSP References", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>",
        { desc = "Show LSP Type Definitions", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
        { desc = "Show available code actions", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>",
        { desc = "Show buffer Diagnostics", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>rs", ":LspRestart<cr>", { desc = "Reset LSP", unpack(keymap_opts) })
      vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format code", unpack(keymap_opts) })

      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "LspEslintFixAll",
      })
    end

    -- Capabilities definition
    local cmp_status, cmp_lsp = pcall(require, "cmp_nvim_lsp")

    -- Diagnostics definition
    for _, sign in ipairs(opts.diagnostics.signs) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end
    vim.diagnostic.config(opts.diagnostics)

    -- Extract all filetypes from the list of servers inside the module "lsp.servers"
    for file_type, _ in pairs(l._.handlers.ft) do
      table.insert(file_types, file_type)
    end

    -- Extra lazy-loaded LSP setup. Only configure / setup the servers which are actually needed by the currently open filetypes.
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = file_types,
      once = true, -- Run only once for every filetype
      callback = function()
        -- Iterate over all available servers and see if they need to be setup
        for server_name, server_config in pairs(opts.servers) do
          -- Check if any given filetype warrants this server to be setup. If so, set it up and remove it from the table to not set it up again
          for _, server_ft in pairs(server_config.ft) do
            if server_ft == vim.bo.filetype then
              -- Prepare server configuration
              local server_options = {
                capabilities = vim.tbl_deep_extend(
                  "force",
                  cmp_status and cmp_lsp.default_capabilities() or {},
                  server_config.use_default and vim.lsp.protocol.make_client_capabilities() or {},
                  server_config.capabilities or {}
                ),
                on_attach = on_attach,
                on_new_config = server_config.on_new_config,
                settings = server_config.settings,
                cmd = server_config.cmd,
              }
              -- Setup server and start it, then remove it form table
              vim.lsp.config(server_name, server_options)
              opts.servers[server_name] = nil
              break
            end
          end
        end
      end,
    })
  end,
}
