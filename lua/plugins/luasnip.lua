return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	keys = {

		{
			"<Tab>",
			function()
				return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
			end,
			expr = true,
			silent = true,
			mode = "i",
		},
		{
			"<Tab>",
			function()
				require("luasnip").jump(1)
			end,
			mode = "s",
		},
		{
			"<S-Tab>",
			function()
				require("luasnip").jump(-1)
			end,
			mode = { "s", "i" },
		},
	},
	opts = {
		history = true,
		delete_check_events = "TextChanged",
	},
}
