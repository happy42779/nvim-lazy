return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"windwp/nvim-autopairs",
	},
	config = function()
		local cmp = require("cmp")
		local lsnip = require("luasnip")
		local kind_icons = {
			Text = "",
			Method = "",
			Function = "",
			Constructor = "",
			Field = "",
			Variable = "",
			Class = "ﴯ",
			Interface = "",
			Module = "",
			Property = "ﰠ",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "",
			Struct = "",
			Event = "",
			Operator = "",
			TypeParameter = "",
		}
		-- call setup
		cmp.setup({
			-- completion = {
			-- 	completeopt = "menu, menuone, noinsert",
			-- },
			enabled = function()
				local buftype = vim.api.nvim_buf_get_option(0, "buftype")
				if buftype == "prompt" then
					return false
				end
				local context = require("cmp.config.context")
				return not context.in_treesitter_capture("comment") and not context.in_syntax_group("comment")
			end,
			snippet = {
				expand = function(args)
					lsnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({
					-- i = function(fallback)
					-- 	if cmp.visible() and cmp.get_active_entry() then
					-- 		cmp.confirm({ behavior = cmp.SelectBehavior.Replace, select = false })
					-- 	else
					-- 		fallback()
					-- 	end
					-- end,
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
					-- s = cmp.mapping.confirm({ select = true }),
					-- c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				-- tab
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- local entry = cmp.get_selected_entry()
						-- if not entry then
						-- 	cmp.select_next_item()
						-- else
						-- 	-- cmp.confirm()
						-- 	return
						-- end
					elseif lsnip.expand_or_locally_jumpable() then
						lsnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif lsnip.jumpable(-1) then
						lsnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[SNI]",
						buffer = "[BUF]",
						latex_symbols = "[LaTex]",
					})[entry.source.name]
					return vim_item
				end,
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			}),
			experimental = {
				ghost_text = {
					hl_group = "LspCodeLens",
				},
			},
			cmdline = {
				options = {
					type = { "/", "?" },
					sources = {
						{ name = "buffer" },
					},
					{
						type = ":",
						sources = {
							{ name = "path" },
							{ name = "cmdline" },
						},
					},
				},
			},
		})
		-- recipe
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
