local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- setting the leader key to ';'
vim.g.mapleader = ";"

-- launch lazy
map("n", "<leader>lz", "<Cmd>Lazy<CR>", { desc = "Luanch Lazy" })

-- mapping something easier to reach to backspace
map("i", "<A-,>", "<backspace>", {})

-- mapping Esc to something that's close to my thumb
map("i", "jj", "<Esc>", {})
map("i", "kk", "<Esc>", {})

-- split screen horizontally
map("n", "<LEADER>|", ":vsplit ", { desc = "Vertical split" })
map("n", "<LEADER>_", ":split ", { desc = "Horizontal split" })

-- exit without writing buffer
map("n", "<A-q>", ":q<CR>", { desc = "Fast quit buffer" })
-- map("i", "<A-q>", "<ESC>:q!<CR>", opts)

-- write buffer
map("n", "<C-s>", "<cmd>:w<CR>", { desc = "Fast save buffer" })
map("i", "<C-s>", "<ESC><cmd>:w<CR>", { desc = "Fast save buffer" })

-- fast moving
-- map("n", "H", "0", { desc = "Fast move to start of line" })
-- map("n", "L", "$", { desc = "Fast move to start of line" })

-- Move to the end of line in the INSERT MODE,
-- really helpful when editting in a '', (), [] etc...
map("i", "<A-a>", "<End>", { desc = "Fast move to end of line in insert mode" })
-- Fast moving between windows
map("n", "<C-h>", "<C-w>h", { desc = "Move to the left window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to the right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to the below window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to the above window" })
-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cR>", { desc = "Decrease window width" })

map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Samples learnt from ThePrimeagen
-- map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move blocks down" })
-- move lines
-- map("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move blocks up" })

map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move up" })

map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- close tabs
map("n", "<A-w>", "<cmd>bdelete!<CR>", { desc = "Close current buffer" })

-- merge lines without moving the cursor
map("n", "J", "mzJ`z", { desc = "Merge lines" })
-- scroll but with cursor not moved
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })

map("n", "<C-u>", "<C-U>zz", { desc = "Merge up" })

-- paste over selected items and keep the copied content
map("x", "<leader>p", [["_dP]], { desc = "paste" })
map("n", "<leader>ax", "<cmd>!chmod +x %<CR>", { desc = "Add x mask" })

-- fast replace
map("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Fast split window and start a terminal
-- with a set height
map("n", "<leader>t_", "<cmd>split | resize 20 | term<CR>", { desc = "Open a terminal below" })
map("n", "<leader>t|", "<cmd>vsplit | resize 20 | term<CR>", { desc = "Open a terminal right" })

map("n", "  ", "<cmd>nohlsearch<CR>", { desc = "Clear highlight" })
