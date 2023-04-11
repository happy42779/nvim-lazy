return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	keys = {
		{"<leader>mp", "<Cmd>MarkdownPreview<CR>", desc = "Start mardown preview"},
		{"<leader>ms", "<Cmd>MarkdownPreviewStop<CR>", desc = "Stop mardown preview"},
	},
	init = function ()
		vim.g.mkdp_filetypes = {"markdown"}
		vim.g.mkdp_auto_close = 1
	end,
	ft = {"markdown"}
}
