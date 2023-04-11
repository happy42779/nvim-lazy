-- theme
return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
		})
		vim.cmd([[colorscheme catppuccin-frappe]])
		-- vim.api.nvim_set_hl(0, "Comment", { fg = "#5c940d", bold = true, italic = true })
	end,
}
