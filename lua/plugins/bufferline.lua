return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "v3.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Move to the previous tab" },
		{ "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "Move to the next tab" },
	},
	opts = {
		options = {
			indicator = {
				style = "underline",
			},
			color_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = {
				{ filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "left" },
			},
			always_show_bufferline = false,
			separator_style = "thick",
		},
	},
}
