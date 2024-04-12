local status_ok, session = pcall(require, "mini.sessions")
if not status_ok then
	return
end

vim.fn.mkdir(vim.fn.stdpath('data') .. '/session', 'p')

session.setup(
	-- No need to copy this inside `setup()`. Will be used automatically.
	{
	  -- Whether to read latest session if Neovim opened without file arguments
	  autoread = true,

	  -- Whether to write current session before quitting Neovim
	  autowrite = true,

	  -- Directory where global sessions are stored (use `''` to disable)
	  directory = vim.fn.stdpath('data') .. '/session',

	  -- File for local session (use `''` to disable)
	  file = 'Session.vim',

	  -- Whether to force possibly harmful actions (meaning depends on function)
	  force = { read = true, write = true, delete = true },

	  -- Hook functions for actions. Default `nil` means 'do nothing'.
	  hooks = {
	    -- Before successful action
	    pre = { read = nil, write = nil, delete = nil },
	    -- After successful action
	    post = { read = nil, write = nil, delete = nil },
	  },

	  -- Whether to print session path after action
	  verbose = { read = true, write = true, delete = true },
	}
)
