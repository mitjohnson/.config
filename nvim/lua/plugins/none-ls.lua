return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local completion = null_ls.builtins.completion
		null_ls.setup({
			debug = false,
			sources = {
				formatting.stylua,
				formatting.prettierd,
				formatting.shfmt,
				completion.spell,
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
	init = function()
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
