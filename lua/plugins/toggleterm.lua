return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	keys = {
		{
			"<leader>lg",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
				lazygit:toggle()
			end,
			desc = "Toggle Lazygit",
			noremap = true,
			silent = true,
		},
	},
	opts = {
		size = 20,
		open_mapping = [[<C-\>]],
		direction = "float",
		-- direction = "horizontal",
		float_opts = {},
	},
	-- config = function(_, opts)
	-- 	require("toggleterm").setup(opts)
	--
	-- 	local Terminal = require("toggleterm.terminal").Terminal
	-- 	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	--
	-- 	function _Lazygit_toggle()
	-- 		lazygit:toggle()
	-- 	end
	--
	-- 	vim.api.nvim_set_keymap(
	-- 		"n",
	-- 		"<leader>lg",
	-- 		"<cmd>lua _Lazygit_toggle()<CR>",
	-- 		{ noremap = true, silent = true, desc = "Open Lazygit" }
	-- 	)
	-- end,
}
