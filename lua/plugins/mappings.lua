local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.register({
	-- Core
	["<leader>e"] = {
		name = "[E]xplorer",
		["e"] = { "<cmd>Neotree toggle<CR>", "[E]xplorer Toggle" },
		["f"] = { "<cmd>Neotree focus<CR>", "[E]xplorer [F]ocus" },
		["b"] = { "<cmd>Neotree buffers<CR>", "[E]xplorer [B]uffers" },
		["g"] = { "<cmd>Neotree git_status<CR>", "[E]xplorer [G]it Status" },
		["c"] = { "<cmd>Neotree git_status<CR>", "[E]xplorer [C]lose" },
	},
	["<leader>t"] = { name = "[T]erminal" },
	["<leader>a"] = { name = "[A]lign" },

	-- Pickers
	["<leader>f"] = {
		name = "[F]ile Picker",
		["f"] = { "<cmd>Telescope find_files cwd=~ follow=true<CR>", "[F]ile Picker" },
		["w"] = { "<cmd>Telescope find_files<CR>", "File Picker [W]orking Directory" },
		["b"] = { "<cmd>Telescope buffers<CR>", "[B]uffer Picker" },
		["j"] = { "<cmd>Telescope jumplist<CR>", "[J]umplist Picker" },
		["h"] = { "<cmd>Telescope help_tags<CR>", "[H]elp Picker" },
		["k"] = { "<cmd>Telescope keymaps<CR>", "[K]eymaps Picker" },
		["m"] = { "<cmd>Telescope marks<CR>", "[M]arks Picker" },
		["l"] = { "<cmd>Telescope resume<CR>", "Open [L]ast Used Picker" },
		["c"] = { "<cmd>Telescope commands<CR>", "Open [C]ommand Palette" },
		["s"] = { "<cmd>lua require('auto-session.session-lens').search_session()<CR>", "[S]ession Picker" },
		["d"] = { "<cmd>Telescope diagnostics<CR>", "[D]iagnostics Picker" },
	},

	-- LSP
	["<leader>l"] = {
		name = "[L]SP",
		["m"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Sy[m]bol References" },
		["k"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Symbol Help" },
		["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "[R]ename Symbol" },
		["a"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code [A]ction" },
		["f"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "[F]ormat Buffer" },
		["s"] = { "<cmd>Telescope lsp_document_symbols<CR>", "[S]ymbol Picker" },
		["w"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "[W]orkspace Symbol Picker" },
		["d"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto [D]efinition" },
		["D"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto [D]eclaration" },
		["y"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto T[y]pe Definition" },
		["i"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto [I]mplementation" },
	},
	["<leader>w"] = {
		name = "[W]orkspace",
		["a"] = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "[A]dd Folder" },
		["d"] = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "[R]emove Folder" },
		["l"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "[L]ist Folder" },
	},
	-- DAP
	["<leader>d"] = {
		name = "[D]ebugger",
		["l"] = { "<cmd>lua require('dap').continue()<CR>", "[L]aunch Debugger" },
		["c"] = { "<cmd>lua require('dap').continue()<CR>", "[C]ontinue Program Execution" },
		["n"] = { "<cmd>lua require('dap').step_over()<CR>", "Step [N]ext" },
		["i"] = { "<cmd>lua require('dap').step_into()<CR>", "Step [I]n" },
		["o"] = { "<cmd>lua require('dap').step_out()<CR>", "Step [O]ut" },
		["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle [B]reakpoint" },
		["r"] = { "<cmd>lua require('dap.repl').toggle()<CR>", "[R]EPL Toggle" },
		["R"] = { "<cmd>lua require('dap').restart()<CR>", "[R]estart" },
		["C"] = { "<cmd>lua require('dap').clear_breakpoints()<CR>", "[C]lear All Breakpoints" },
		["L"] = { "<cmd>lua require('dap').list_breakpoints()<CR>", "[L]ist All Breakpoints" },
		["t"] = { "<cmd>lua require('dap').terminate()<CR>", "[T]erminate" },
		["p"] = { "<cmd>lua require('dap.ui.widgets').preview()<CR>", "[P]review" },
	},

	-- Git
	["<leader>g"] = {
		name = "[G]itsigns",
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
	["<leader>v"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "[V]env Picker" },
})
