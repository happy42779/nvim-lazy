return {
		"folke/trouble.nvim",
		enabled = false,
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{ "<leader>xx", "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics (Trouble)" },
			-- { "<leader>xX", "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics (Trouble)" },
			{ "<leader>xl", "<Cmd>TroubleToggle loclist<CR>",              desc = "Location list (Trouble)" },
			{ "<leader>xq", "<cmd>troubletoggle quickfix<cr>",             desc = "quickfix list (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cprevious()
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					else
						vim.cmd.cnext()
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
}
