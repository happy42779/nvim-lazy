return {
	"nvim-neo-tree/neo-tree.nvim",
	cmd = "Neotree",
	branch = "v2.x",
	keys = {
		{ "<leader>e", "<Cmd>Neotree toggle focus reveal_force_cwd<CR>", desc = "Open File Explorer" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		-- "nvim-tree/nvim-web-devicons",
	},
	opts = {
		window = {
			width = 30,
		},
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = "open_current",
		},
	},
}
