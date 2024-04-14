local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- theme
	{ "folke/tokyonight.nvim",     lazy = false },

	-- ui/core
	{ "folke/which-key.nvim",      lazy = true },
	{ "nvim-lualine/lualine.nvim", lazy = false },
	{ "echasnovski/mini.surround", version = "*", lazy = true },
	{ "akinsho/toggleterm.nvim",   lazy = true },
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},

	-- lsp
	{ "neovim/nvim-lspconfig",             lazy = true },
	{ "williamboman/mason.nvim",           lazy = true },
	{ "williamboman/mason-lspconfig.nvim", lazy = true },
	{ "nvim-telescope/telescope.nvim",     dependencies = { "nvim-lua/plenary.nvim" } },

	{ "echasnovski/mini.completion",       version = "*",                               lazy = true },
	{ "echasnovski/mini.align",            version = "*",                               lazy = true },
	{ "echasnovski/mini.sessions",         version = "*",                               lazy = true },
	{ "echasnovski/mini.bracketed",        version = "*",                               lazy = true },
	{ "echasnovski/mini.comment",          version = "*",                               lazy = true },
	{ "lewis6991/gitsigns.nvim",           lazy = true },
	{ "NeogitOrg/neogit",                  dependencies = { "nvim-lua/plenary.nvim", }, lazy = true },

	{ "AckslD/swenv.nvim",                 lazy = true },

}, { lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json" })
