local status_ok, term = pcall(require, "toggleterm")
if not status_ok then
	return
end

term.setup({
	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<leader>tt]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	autochdir = true,  -- when neovim changes it current directory the terminal will change it's own when next it's opened
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	start_in_insert = true,
	insert_mappings = false, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "horizontal",
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	winbar = {
		enabled = false,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
})


local Terminal = require('toggleterm.terminal').Terminal

local python   = Terminal:new({ cmd = "python", hidden = true })
function _python_toggle()
	python:toggle()
end

local jshell = Terminal:new({ cmd = "jshell", hidden = true })
function _jshell_toggle()
	jshell:toggle()
end

local lua = Terminal:new({ cmd = "lua", hidden = true })
function _lua_toggle()
	lua:toggle()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>tj",
	"<cmd>lua _jshell_toggle()<CR>",
	{ noremap = true, silent = true, desc = "Jshell" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>tl",
	"<cmd>lua _lua_toggle()<CR>",
	{ noremap = true, silent = true, desc = "Lua" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>tp",
	"<cmd>lua _python_toggle()<CR>",
	{ noremap = true, silent = true, desc = "Python" }
)
