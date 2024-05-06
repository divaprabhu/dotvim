local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.register({
	-- Core
	["<leader>e"] = {
		name = "[e]xplorer",
		["e"] = { "<cmd>Neotree toggle<CR>", "[e]xplorer Toggle" },
		["f"] = { "<cmd>Neotree focus<CR>", "[f]ocus" },
		["b"] = { "<cmd>Neotree buffers<CR>", "[b]uffers" },
		["g"] = { "<cmd>Neotree git_status<CR>", "[g]it Status" },
		["c"] = { "<cmd>Neotree git_status<CR>", "[c]lose" },
	},
	["<leader>t"] = { name = "[t]erminal" },
	["<leader>a"] = { name = "[a]lign" },

	-- Pickers
	["<leader>f"] = {
		name = "[f]ile Picker",
		["f"] = { "<cmd>Telescope find_files cwd=~ follow=true<CR>", "[f]ile Picker" },
		["w"] = { "<cmd>Telescope find_files<CR>", "File Picker [w]orking Directory" },
		["b"] = { "<cmd>Telescope buffers<CR>", "[b]uffer Picker" },
		["j"] = { "<cmd>Telescope jumplist<CR>", "[j]umplist Picker" },
		["h"] = { "<cmd>Telescope help_tags<CR>", "[h]elp Picker" },
		["k"] = { "<cmd>Telescope keymaps<CR>", "[k]eymaps Picker" },
		["m"] = { "<cmd>Telescope marks<CR>", "[m]arks Picker" },
		["l"] = { "<cmd>Telescope resume<CR>", "Open [l]ast Used Picker" },
		["c"] = { "<cmd>Telescope commands<CR>", "Open [c]ommand Palette" },
		["s"] = { "<cmd>lua require('auto-session.session-lens').search_session()<CR>", "[s]ession Picker" },
		["d"] = { "<cmd>Telescope diagnostics<CR>", "[d]iagnostics Picker" },
	},

	-- LSP
	["<leader>l"] = {
		name = "[l]SP",
		["m"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Sy[m]bol References" },
		["k"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Symbol Help" },
		["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "[r]ename Symbol" },
		["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code [a]ction" },
		["f"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "[f]ormat Buffer" },
		["s"] = { "<cmd>Telescope lsp_document_symbols<CR>", "[s]ymbol Picker" },
		["w"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "[w]orkspace Symbol Picker" },
		["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto [d]efinition" },
		["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto [D]eclaration" },
		["y"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto T[y]pe Definition" },
		["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto [i]mplementation" },
	},
	["<leader>w"] = {
		name = "[w]orkspace",
		["a"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "[a]dd Folder" },
		["d"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "[r]emove Folder" },
		["l"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "[l]ist Folder" },
	},
	-- DAP
	["<leader>d"] = {
		name = "[d]ebugger",
		["C"] = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "[C]lear All Breakpoints" },
		["L"] = { "<cmd>lua require('dap').list_breakpoints()<CR>", "[L]ist All Breakpoints" },
		["R"] = { "<cmd>lua require('dap').restart()<CR>", "[R]estart" },
		["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle [b]reakpoint" },
		["c"] = { "<cmd>lua require('dap').continue()<CR>", "[c]ontinue Program Execution" },
		["i"] = { "<cmd>lua require('dap').step_into()<CR>", "Step [i]n" },
		["l"] = { "<cmd>lua require('dap').continue()<CR>", "[l]aunch Debugger" },
		["e"] = { "<cmd>lua require('dap').run_last()<CR>", "[e]xecute Previous Config" },
		["n"] = { "<cmd>lua require('dap').step_over()<CR>", "Step [n]ext" },
		["o"] = { "<cmd>lua require('dap').step_out()<CR>", "Step [o]ut" },
		["p"] = { "<cmd>lua require('dap.ui.widgets').preview()<CR>", "[p]review" },
		["r"] = { "<cmd>lua require('dap.repl').toggle()<CR>", "[r]EPL Toggle" },
		["t"] = { "<cmd>lua require('dap').terminate()<CR>", "[t]erminate" },
	},

	-- Git
	["<leader>g"] = {
		name = "[g]itsigns",
		["s"] = { function() require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, "[S]tage Hunk" },
		["r"] = { function() require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, "[R]eset Hunk To Index" },
		["u"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "[U]ndo Stage Hunk" },
		["S"] = { "<cmd>lua require('gitsigns').stage_buffer()<CR>", "[S]tage Buffer" },
		["R"] = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", "[R]eset Buffer To Index" },
		["U"] = { "<cmd>lua require('gitsigns').reset_buffer_index()<CR>", "[U]ndo Stage Buffer" },
		["p"] = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "[P]review Hunk" },
		["b"] = { "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", "[B]lame Toggle" },
		["l"] = { "<cmd>lua require('gitsigns').setloclist()<CR>", "Hunks To [L]ocation List" },
		["d"] = { "<cmd>lua require('gitsigns').diffthis(nil, { split = 'belowright' })<CR>", "[D]iff With Index" },
		["D"] = { "<cmd>lua require('gitsigns').diffthis('~', { split = 'belowright' })<CR>", "[D]iff With Last Commit" },
		["h"] = { "<cmd>lua require('gitsigns').select_hunk()<CR>", "Select [H]unk" },
	},

	["<leader>G"] = { "<cmd>Neogit<CR>", "Neo[g]it" },

	-- python
	["<leader>v"] = { 
		name = "Python [V]env",
		["p"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "[P]ick Venv" },
	}
})
