local status_ok, venv = pcall(require, "swenv")
if not status_ok then
	print('error swenv')
	return
end

venv.setup({
	-- Should return a list of tables with a `name` and a `path` entry each.
	-- Gets the argument `venvs_path` set below.
	-- By default just lists the entries in `venvs_path`.
	get_venvs = function(venvs_path)
		return require('swenv.api').get_venvs(venvs_path)
	end,
	-- Path passed to `get_venvs`.
	venvs_path = vim.fn.expand('~/.cache/venvs'),
	-- Something to do after setting an environment, for example call vim.cmd.LspRestart
	post_set_venv = function()
		vim.cmd('LspRestart')
	end,
})

local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
 require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

