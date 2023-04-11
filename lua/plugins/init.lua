-- this file holds the plugins that do not need to be mannually set
return {
	------------------------ Basic  -------------------
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = false
			vim.o.timeoutlen = 500
		end,
	},
	------------------------ Core -------------------
	------------------------ UI ---------------------
	{ "MunifTanjim/nui.nvim", lazy = true },
	{ "lukas-reineke/indent-blankline.nvim" },
	------------------ Editing ----------------------
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{ "folke/todo-comments.nvim", dependencies = "nvim-lua/plenary.nvim" },
	{ "folke/trouble.nvim" },
	{ "numToStr/Comment.nvim", config = true },
}
