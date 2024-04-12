local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local builtin = require('telescope.builtin')

wk.register({
	["e"] = { ":Neotree toggle<CR>", "Explorer" },
	["t"] = { ":ToggleTerm<CR>", "Terminal" },
	["f"] = { ":Telescope find_files cwd=~ follow=true<CR>", "File Picker" },
	["F"] = { ":Telescope find_files<CR>", "File Picker Working Directory" },
	["b"] = { ":Telescope buffers<CR>", "Buffer Picker" },
	["j"] = { ":Telescope jumplist<CR>", "Jumplist Picker" },
}, { prefix = "<leader>" })


-- file pickers
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc="find_files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc="live_grep" })

-- vim pickers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc="buffers" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc="commands" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc="help_tags" })
vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc="jump list" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc="keymaps" })
vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc="location list" })
vim.keymap.set('n', '<leader>fm', builtin.marks, { desc="marks" })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc="quickfix" })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc="registers" })

-- lsp pickers
vim.keymap.set('n', '<leader>fdci', builtin.lsp_incoming_calls, { desc="list incoming calls" })
vim.keymap.set('n', '<leader>fdco', builtin.lsp_outgoing_calls, { desc="list outgoing calls" })
vim.keymap.set('n', '<leader>fdd', builtin.lsp_definitions, { desc="goto or list definitions" })
vim.keymap.set('n', '<leader>fdi', builtin.lsp_implementations, { desc="goto or list implementation" })
vim.keymap.set('n', '<leader>fdr', builtin.lsp_references, { desc="list references" })
vim.keymap.set('n', '<leader>fds', builtin.lsp_document_symbols, { desc="list symbols" })
vim.keymap.set('n', '<leader>fdt', builtin.lsp_type_definitions, { desc="goto or list type definitions" })
vim.keymap.set('n', '<leader>fdws', builtin.lsp_workspace_symbols, { desc="list workspace symbols" })

-- git pickers
vim.keymap.set('n', '<leader>fvc', builtin.git_commits, { desc="list git commits" })
vim.keymap.set('n', '<leader>fvb', builtin.git_branches, { desc="list git branches" })
vim.keymap.set('n', '<leader>fvs', builtin.git_status, { desc="list git status" })
vim.keymap.set('n', '<leader>fvh', builtin.git_stash, { desc="list git stashes" })

-- treesitter
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc="treesitter" })

