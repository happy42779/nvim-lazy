-- theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd([[colorscheme catppuccin-macchiato]])
		-- vim.api.nvim_set_hl(0, "Comment", { fg = "#5a5e72", italic = true})
		vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
		-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#868e96", bold = true })
	end,
}
