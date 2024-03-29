return {
	"jose-elias-alvarez/null-ls.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
			sources = {
				nls.builtins.formatting.stylua,
				-- nls.builtins.diagnostics.codespell,
				nls.builtins.diagnostics.clang_check,
				-- nls.builtins.diagnostics.cspell,
				-- nls.builtins.code_actions.cspell,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end,
		}
	end,
}
