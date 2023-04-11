vim.opt.number = true
vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
vim.opt.confirm = true

vim.opt.formatoptions = "jcrqlnt"

vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"

vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.encoding = "UTF-8"
vim.opt.langmenu = "en_US.UTF-8"
-- vim.opt.language message = "zh_CN.UTF-8"
vim.opt.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5"
-- using ftplugin
vim.opt.filetype = "plugin"

-- whitespaces / indents
vim.opt.list = true
vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append("space:⋅")

vim.opt.termguicolors = true

-- folding
-- vim.opt.foldmethod = "expr"

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
