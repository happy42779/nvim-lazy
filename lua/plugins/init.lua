-- this file holds the plugins that do not need to be manually set
return {
	------------------------ Basic  -------------------
	{
		"folke/which-key.nvim",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
	},
	------------------------ Core -------------------
	------------------------ UI ---------------------
	{ "MunifTanjim/nui.nvim",               lazy = true },
	{ "nvim-tree/nvim-web-devicons",        lazy = true },
	{ "lukas-reineke/indent-blankline.nvim", enabled =false },
	------------------ Editing ----------------------
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	config = function()
	-- 		require("leap").add_default_mappings()
	-- 	end,
	-- },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-surround" },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		opts = function()
			local ft = require("Comment.ft")
			return {
				ft.set("verilog", "//%s"),
			}
		end,
	},
	-- { "folke/trouble.nvim" },
	{ "numToStr/Comment.nvim", config = true },
}
