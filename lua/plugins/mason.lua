return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>ms", "<Cmd>Mason<CR>", desc = "Mason" } },
	opts = {
		ensure_installed = {
			"stylua",
			"shfmt",
			"clangd",
			"bash-language-server",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end,
}
