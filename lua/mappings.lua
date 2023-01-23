local map = vim.keymap.set

local options = {
	noremap = true,
	silent = true
}
local eoptions = {
	noremap = true,
	silent = true,
	expr = true
}

vim.g.mapleader = " "
map("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", eoptions)

-- navigate and move windows
map("n", "<M-h>", "<C-w>h", options)
map("n", "<M-j>", "<C-w>j", options)
map("n", "<M-k>", "<C-w>k", options)
map("n", "<M-l>", "<C-w>l", options)

map({"i", "v"}, "<M-h>", "<Esc><C-w>h", options)
map({"i", "v"}, "<M-j>", "<Esc><C-w>j", options)
map({"i", "v"}, "<M-k>", "<Esc><C-w>k", options)
map({"i", "v"}, "<M-l>", "<Esc><C-w>l", options)

map("t", "<M-h>", "<C-\\><C-n><C-w>h", options)
map("t", "<M-j>", "<C-\\><C-n><C-w>j", options)
map("t", "<M-k>", "<C-\\><C-n><C-w>k", options)
map("t", "<M-l>", "<C-\\><C-n><C-w>l", options)

-- remove highlights
map("n", "<C-l>", ":<C-u>nohlsearch<CR><C-l>", options)

-- Repeat substitution with flags
map("n", "&", ":&&<CR>", options)
map("x", "&", ":&&<CR>", options)

-- tag jump
map("n", "<C-]", ":normal g<C-]>", options)

-- terminal mode
map("t", "<Esc>", "<C-\\><C-n>", options)
map("t", "<C-[", "<Esc>", options)

-- unimpaired
map("n", "[a", ":previous<CR>", options)
map("n", "]a", ":next<CR>", options)
map("n", "[A", ":first<CR>", options)
map("n", "]A", ":last<CR>", options)
map("n", "[b", ":bprevious<CR>", options)
map("n", "]b", ":bnext<CR>", options)
map("n", "[B", ":bfirst<CR>", options)
map("n", "]B", ":blast<CR>", options)
map("n", "[l", ":lprevious<CR>", options)
map("n", "]l", ":lnext<CR>", options)
map("n", "[L", ":lfirst<CR>", options)
map("n", "]L", ":llast<CR>", options)
map("n", "[q", ":cprevious<CR>", options)
map("n", "]q", ":cnext<CR>", options)
map("n", "[Q", ":cfirst<CR>", options)
map("n", "]Q", ":clast<CR>", options)
