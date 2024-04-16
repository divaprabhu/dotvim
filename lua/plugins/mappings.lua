local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.register({
	-- Core
	["<leader>e"] = { "<cmd>Neotree toggle<CR>", "Explorer" },
	["<leader>c"] = { "<cmd>ToggleTerm<CR>", "Command Line" },
	["<leader>a"] = { name = "Align" },

	-- Pickers
	["<leader>t"] = {
		name = "Telescope File Picker",
		["f"] = { "<cmd>Telescope find_files cwd=~ follow=true<CR>", "File Picker" },
		["w"] = { "<cmd>Telescope find_files<CR>", "File Picker Working Directory" },
		["b"] = { "<cmd>Telescope buffers<CR>", "Buffer Picker" },
		["j"] = { "<cmd>Telescope jumplist<CR>", "Jumplist Picker" },
		["m"] = { "<cmd>Telescope marks<CR>", "Marks Picker" },
		["'"] = { "<cmd>Telescope resume<CR>", "Open Last Used Picker" },
		["?"] = { "<cmd>Telescope commands<CR>", "Open Command Palette" },
	},

	-- LSP
	["<leader>l"] = {
		name = "LSP",
		["h"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "[LSP]Symbol References" },
		["k"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "[LSP]Symbol Help" },
		["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "[LSP]Rename Symbol" },
		["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "[LSP]Code Action" },
		["f"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "[LSP]Format Buffer" },
		["s"] = { "<cmd>Telescope lsp_document_symbols<CR>", "[LSP]Symbol Picker" },
		["w"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "[LSP]Workspace Symbol Picker" },
		["d"] = { "<cmd>Telescope diagnostics<CR>", "[LSP]Diagnostics Picker" },
	},
	["g"] = {
		["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "[LSP]Goto Definition" },
		["y"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "[LSP]Goto Type Definition" },
		["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "[LSP]Goto Implementation" },
	},

	-- DAP
	["<leader>d"] = {
		name = "Debugger",
		["l"] = { "<cmd>lua require('dap').continue()<CR>", "Launch Debugger" },
		["c"] = { "<cmd>lua require('dap').continue()<CR>", "Continue Program Execution" },
		["n"] = { "<cmd>lua require('dap').step_over()<CR>", "Step Next" },
		["i"] = { "<cmd>lua require('dap').step_into()<CR>", "Step In" },
		["o"] = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
		["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		["r"] = { "<cmd>lua require('dap.repl').toggle()<CR>", "REPL Toggle" },
		["R"] = { "<cmd>lua require('dap').restart()<CR>", "Restart" },
		["C"] = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "Clear All Breakpoints" },
		["L"] = { "<cmd>lua require('dap').list_breakpoints()<CR>", "List All Breakpoints" },
		["t"] = { "<cmd>lua require('dap').terminate()<CR>", "Terminate" },
		["h"] = { "<cmd>lua require('dap.ui.widgets').preview()<CR>", "Preview" },
	},

	-- Git
	["<leader>g"] = { name = "Gitsigns" },
	["<leader>G"] = { "<cmd>Neogit<CR>", "Neogit" },

	-- python
	["<leader>v"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "Venv Picker" },
})
