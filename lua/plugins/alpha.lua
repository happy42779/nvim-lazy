return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find file", ":Telescope fd <CR>"),
			dashboard.button("t", "  Find text", ":Telescope live_grep_raw <CR>"),
			dashboard.button("p", "  Find project", ":Telescope project <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}
		require("alpha").setup(dashboard.opts)
	end,
}
