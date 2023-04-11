return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local ftMap = {
			vim = "indent",
			python = { "indent" },
			git = "",
		}
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return ftMap[filetype], { "treesitter", "indent" }
			end,
		})
	end,
}
