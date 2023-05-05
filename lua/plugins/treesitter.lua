return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
	},
	-- keys = {
	-- 	-- { "<c-space>", desc = "Increment selection" },
	-- 	-- { "<bs>",      desc = "Decrement selection", mode = "x" },
	-- },
	opts = {
		highlight = { enable = true, disable = {} },
		indent = { enable = false, disable = { "python" } },
		context_commentstring = { enable = true, enable_autocmd = false },
		ensure_installed = {
			"bash",
			"c",
			"cpp",
			"html",
			"javascript",
			"json",
			"lua",
			"luap",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"regex",
			"tsx",
			"typescript",
			"vim",
			"yaml",
			"latex",
			"sql",
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremenal = "<nop>",
				node_decremental = "<bs>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
					["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
				},
				-- selection_modes = {
				-- 	["@parameter.outer"] = "v",
				-- 	["@function.outer"] = "V",
				-- 	["@class.outer"] = "<C-v>",
				-- },
			},
			include_surrounding_whitespace = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
