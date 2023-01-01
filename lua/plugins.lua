-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local agpacker = vim.api.nvim_create_augroup("packer_user_config", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost",
	{ pattern = "plugins.lua", command = "source <afile> | PackerSync", group = agpacker })

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use { "folke/tokyonight.nvim" }
	use { "wbthomason/packer.nvim" } -- Have packer manage itself

	use { 'echasnovski/mini.sessions', branch = 'stable' }
	use { 'echasnovski/mini.surround', branch = 'stable' }
	use { 'echasnovski/mini.align', branch = 'stable' }

	use { 'nvim-lualine/lualine.nvim' }
	use { 'nvim-tree/nvim-tree.lua' }
	use { 'akinsho/toggleterm.nvim' }
	use { 'numToStr/Comment.nvim' }

	-- LSP and Autocompletion
	use { "neovim/nvim-lspconfig" } -- enable LSP
	use { "hrsh7th/nvim-cmp" } -- The completion plugin
	use { "hrsh7th/cmp-nvim-lsp" } -- send more capabilities than omnifunc to lsp server
	use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
	use { "L3MON4D3/LuaSnip" } --snippet engine

	-- buffer and path completion
	use { "hrsh7th/cmp-buffer" } -- buffer completion
	use { "hrsh7th/cmp-path" } -- path completion
	use { "hrsh7th/cmp-cmdline" } -- vim cmdline completion

	-- treesitter
	use { "nvim-treesitter/nvim-treesitter" }

	-- lsp installer
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }

	-- vimscript plugins
	use { "tpope/vim-unimpaired" } -- Have packer manage itself

	-- which key
	use { "folke/which-key.nvim" }

	-- telescope
	use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }}
	use { 'nvim-telescope/telescope-project.nvim' }
	use { 'BurntSushi/ripgrep' }

	-- debugger
	use { 'mfussenegger/nvim-dap' }
	use { 'rcarriga/nvim-dap-ui' }
end)
