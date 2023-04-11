return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<space>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostics" },
		{ "[e", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Go to previous diagnostics" },
		{ "]e", "<Cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Go to next daignostics" },
		{ "<space>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", desc = "Open diagnostics" },
	},
	dependencies = {
		{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = { spacing = 4, prefix = "●" },
			severity_sort = true,
		},
		autoformat = true,
		format = {
			formatting_options = nil,
			timout_ms = nil,
		},
		-- LSP Server Settings
		-- @type lspconfig.options
		servers = {
			jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
		-- you can do any additional lsp server setup here
		-- return true if you don't want this server to be setup with lspconfig
		-- @type table<string, fun(server:string, otps:_.lspconfig.options):boolean?>
		setup = {},
	},
	-- @param opts PluginLspopts
	config = function(_, opts)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.nvim.lsp.omnifunc"
				local _opts = { buffer = ev.buf, noremap = true, silent = true }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, _opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, _opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, _opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, _opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, _opts)
				vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, _opts)
				vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, _opts)
				vim.keymap.set("n", "<space>wl", function()
					print(vim.inspect(vim.lsp.buf.list_worksapce_folders()))
				end, _opts)
				vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, _opts)
				vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, _opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, _opts)
				vim.keymap.set("n", "<space>f", function()
					vim.lsp.buf.format({ async = true })
				end, _opts)
			end,
		})

		-- diagnositcs
		vim.diagnostic.config(opts.diagnostics)

		-- servers settings
		local servers = opts.servers
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- a function to setup capabilities to lspconfig,
		-- will be called from mason.setup()
		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})

			if opts.setup[server] then
				if opts.setup[server](server, server - opts) then
					return
				end
			elseif opts.setup["*"] then
				if opts.setup["*"](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end

		-- setup mason_lspconfig
		local have_mason, mlsp = pcall(require, "mason-lspconfig")
		local available = have_mason and mlsp.get_available_servers() or {}

		local ensure_installed = {}
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				-- run manual setup if mason = false ro if this is a server that cannot be installed
				-- with mason-lspconfig
				if server_opts.mason == false or not vim.tbl_contains(available, server) then
					setup(server)
				else
					-- add the server listed in servers above to the end of ensure_installed
					ensure_installed[#ensure_installed + 1] = server
				end
			end
		end

		-- setup mason
		if have_mason then
			mlsp.setup({ ensure_installed = ensure_installed })
			mlsp.setup_handlers({ setup })
		end
	end,
}
