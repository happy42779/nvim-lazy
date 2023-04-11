return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTrouble", "TodoTelescope" },
	event = { "BufReadPost", "BufNewFile" },
	keys = {

		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Prev todo comment",
		},
		{ "<leader>xt", "<Cmd>TodoTrouble<CR>", desc = "Todo (Trouble)" },
		{ "<leader>xT", "<Cmd>TodoTrouble keywords=TODO,FIX,FIXME<CR>", desc = "Todo/Fix/fixme (Trouble)" },
		{ "<leader>ft", "<Cmd>TodoTelescope<CR>", desc = "Todo" },
	},
	config = true,
}
