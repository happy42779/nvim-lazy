return {
	'nvim-telescope/telescope.nvim',
	cmd = "Telescope",
	version = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
		'stevearc/aerial.nvim'
	},
	keys = {
		-- find
		{ "<leader>ff", "<Cmd>Telescope find_files<CR>",           desc = "Find files" },
		{ "<leader>fg", "<Cmd>Telescope live_grep<CR>",            desc = "Grep search" },
		{ "<leader>fn", "<Cmd>Telescope aerial<CR>",               desc = "List Functions" },
		{ "<leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "Find symbols" },
		{ "<leader>fc", "<Cmd>Telescope commands<CR>",             desc = "Find commands" },
		{ "<leader>ss", "<Cmd>Telescope grep_string<CR>",          desc = "Grep strings" },
		{ "<leader>:",  "<Cmd>Telescope command_history<CR>",      desc = "List commands history" },
		{ "<leader>fh", "<Cmd>Telescope help_tags<CR>",            desc = "List commands history" },
		{ "<leader>fH", "<Cmd>Telescope highlights<CR>",           desc = "List commands history" },
		-- git
		{ "<leader>gs", "<Cmd>Telescope git_status<CR>",           desc = "Git status" },
		{ "<leader>gf", "<Cmd>Telescope git_files<CR>",            desc = "Git files" },
	},
	opts = function()
		require("telescope").load_extension("aerial")
		local actions = require("telescope.actions")
		-- local actions_layout = require("telescope.actions.layout")
		local Job = require("plenary.job")
		local previewers = require("telescope.previewers.previewer")
		local _bad = { ".*%.csv", ".*%.lua" }
		local bad_files = function(filepath)
			for _, v in ipairs(_bad) do
				if filepath:match(v) then
					return false
				end
			end
		end
		local new_make = function(filepath, bufnr, opts)
			opts = opts or {}
			if opts.use_ft_detect == nil then
				opts.use_ft_detect = true
			end
			opts.user_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
			previewers.buffer_previewr_maker(filepath, bufnr, opts)
			-- disable binary previewers
			-- filepath = vim.fn.expand(filepath)
			-- Job:new({
			-- 	command = "file",
			-- 	args = { "--mime-type", "-b", filepath },
			-- 	on_exit = function(j)
			-- 		local mime_type = vim.split(j:result()[1], "/")[1]
			-- 		if mime_type == "text" then
			-- 			previewers.buffer_previewr_maker(filepath, bufnr, opts)
			-- 		else
			-- 			vim.schedule(function()
			-- 				vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
			-- 			end)
			-- 		end
			-- 	end
			-- }):sync()
		end
		return {
			defaults = {
				buffer_previewr = new_make,
				mappings = {
					i = {
						["<M-q>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
					n = {
						["q"] = actions.close
					}
				}
			},
			pickers = {
				find_files = {
					-- theme = "dropdown",
					mappings = {
						n = {
							["cd"] = function(prompt_bunr)
								local selection = require("telescope.actions.state").get_selected_entry()
								local dir = vim.fn.fnamemodify(selection.path, ":p:h")
								require("telescope.actions").close(prompt_bunr)
								vim.cmd(string.format("silent cd %s ", dir))
							end
						}
					}
				},
			},
			extentions = {
				aerial = {
					show_nesting = {
						["_"] = false,
						json = true,
						yaml = true
					}
				}
			}
		}
	end,
}
