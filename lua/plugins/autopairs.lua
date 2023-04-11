return {
	"windwp/nvim-autopairs",
	config = function()
		local Rule = require("nvim-autopairs.rule")
		local cond = require("nvim-autopairs.conds")
		-- local ts_conds = require("nvim-autopairs.ts-conds")
		local autopair = require("nvim-autopairs")

		autopair.setup({
			-- use treesitter to check for a pair
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
			},
			enable_check_bracket_line = false,
			-- will ignore alphanumeric and `.` symbol
			ignored_next_char = "[%w%.]",
			-- fast_wrap = {},
			fast_wrap = {
				map = "<A-e>",
				chars = { "{", "[", "(", '"', "'", "<" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})
		-- rules
		autopair.add_rules({
			-- Rule("%", "%", "lua")
			-- 	:with_pair(ts_conds.is_ts_node({'string','comment'})),

			-- Rule("$", "$", "lua")
			-- 	:with_pair(ts_conds.is_not_ts_node({'function'})),

			-- add space after = , but ignore for types listed after
			Rule("=", "", { "-sh", "-zsh", "-bash", "-make" })
				:with_pair(cond.not_inside_quote())
				:with_pair(function(opts)
					local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
					if last_char:match("[%w%=%s]") then
						return true
					end
					return false
				end)
				:replace_endpair(function(opts)
					local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
					local next_char = opts.line:sub(opts.col, opts.col)
					next_char = next_char == " " and "" or " "
					if prev_2char:match("%w$") then
						return "<bs> =" .. next_char
					end
					if prev_2char:match("%=$") then
						return next_char
					end
					if prev_2char:match("=") then
						return "<bs><bs>=" .. next_char
					end
					return ""
				end)
				:set_end_pair_length(0)
				:with_move(cond.none())
				:with_del(cond.none()),
			-- js functions
			Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript" })
				:use_regex(true)
				:set_end_pair_length(2),
		})
	end,
}
