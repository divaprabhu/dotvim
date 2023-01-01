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
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
})

vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", {noremap = true, silent = true})
