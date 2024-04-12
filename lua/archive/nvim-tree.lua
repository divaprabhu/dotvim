local status_ok, tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			git_placement = "before",
			modified_placement = "before",
			padding = " ",
			symlink_arrow = "",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "",
				modified = "●",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "U",
					staged = "S",
					unmerged = "M",
					renamed = "R",
					untracked = "T",
					deleted = "D",
					ignored = "I",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
})

vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>",
{ noremap = true, silent = true, desc = "Collapse Tree Recursively" })
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle Tree" })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>",
{ noremap = true, silent = true, desc = "Cursor on current bufname" })
vim.keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { noremap = true, silent = true, desc = "Refresh Tree" })
