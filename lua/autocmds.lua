local api = vim.api

local agvimrc = api.nvim_create_augroup("vimrc", { clear = true })
api.nvim_create_autocmd("BufWritePre",
	{ pattern = "*/tmp/*", command = "setlocal noundofile", group = agvimrc })
