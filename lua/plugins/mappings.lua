local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

local builtin = require('telescope.builtin')

wk.register({

	["<leader>f"] = { "<cmd>Telescope find_files cwd=~ follow=true<CR>", "File Picker" },
	["<leader>F"] = { "<cmd>Telescope find_files<CR>", "File Picker Working Directory" },
	["<leader>b"] = { "<cmd>Telescope buffers<CR>", "Buffer Picker" },
	["<leader>j"] = { "<cmd>Telescope jumplist<CR>", "Jumplist Picker" },
	["<leader>s"] = { "<cmd>Telescope lsp_document_symbols<CR>", "[LSP]Symbol Picker" },
	["<leader>S"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "[LSP]Workspace Symbol Picker" },
	["<leader>d"] = { "<cmd>Telescope diagnostics<CR>", "[LSP]Diagnostics Picker" },
	["<leader>'"] = { "<cmd>Telescope resume<CR>", "Open Last Used Picker" },

	["<leader>h"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "[LSP]Symbol References" },
	["<leader>k"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "[LSP]Symbol Help" },
	["<leader>r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "[LSP]Rename Symbol" },
	["<leader>a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "[LSP]Code Action" },
	["<leader>="] = { "<cmd>lua vim.lsp.buf.format()<CR>", "[LSP]Format Buffer" },
	["g"] = {
		["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "[LSP]Goto Definition" },
		["y"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "[LSP]Goto Type Definition" },
		["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "[LSP]Goto Implementation" },
	},

	["<leader>e"] = { "<cmd>Neotree toggle<CR>", "Explorer" },
	["<leader>t"] = { "<cmd>ToggleTerm<CR>", "Terminal" },

	["<leader>&"] = { name="Align" },
	["<leader>g"] = { name="Gitsigns" },
	["<leader>G"] = { "<cmd>Neogit<CR>", "Neogit" },

	["<leader>?"] = { "<cmd>Telescope commands<CR>", "Open Command Palette" },
})
