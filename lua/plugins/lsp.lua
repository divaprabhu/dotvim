local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, masonconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

local status_ok, completion = pcall(require, "mini.completion")
if not status_ok then
	return
end

--[[
local status_ok, installer = pcall(require, "mason-tool-installer")
if not status_ok then
	return
end

local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

local status_ok, lint = pcall(require, "nvim-lint")
if not status_ok then
	return
end
]]

local install_dir = vim.fn.stdpath("data") .. "/mason"
vim.fn.mkdir(install_dir, "p")

local ensure_installed = {}

local servers = {
	"lua_ls",
	"pylsp",
}

local formatters = {
	"beautysh",
	"prettier",
	"stylua",
	"black",
	"sqlfmt",
	"xmlformatter",
}

local linters = {
	"shellcheck",
	"sonarlint-language-server",
	"jsonlint",
	"luacheck",
	"markdownlint",
	"sqlfluff",
}

table.insert(ensure_installed, servers)
table.insert(ensure_installed, formatters)
table.insert(ensure_installed, linters)

mason.setup({
	-- The directory in which to install packages.
	install_root_dir = install_dir,

	-- Where Mason should put its bin location in your PATH. Can be one of:
	-- - "prepend" (default, Mason's bin location is put first in PATH)
	-- - "append" (Mason's bin location is put at the end of PATH)
	-- - "skip" (doesn't modify PATH)
	---@type '"prepend"' | '"append"' | '"skip"'
	PATH = "prepend",

	pip = {
		-- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
		upgrade_pip = true,

		-- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
		-- and is not recommended.
		--
		-- Example: { "--proxy", "https://proxyserver" }
		install_args = {},
	},

	-- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
	-- debugging issues with package installations.
	log_level = vim.log.levels.INFO,

	-- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
	-- packages that are requested to be installed will be put in a queue.
	max_concurrent_installers = 4,

	github = {
		-- The template URL to use when downloading assets from GitHub.
		-- The placeholders are the following (in order):
		-- 1. The repository (e.g. "rust-lang/rust-analyzer")
		-- 2. The release version (e.g. "v0.3.0")
		-- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},

	-- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
	-- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
	-- Builtin providers are:
	--   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
	--   - mason.providers.client                 - uses only client-side tooling to resolve metadata
	providers = {
		"mason.providers.registry-api",
		"mason.providers.client",
	},

	registries = {
		"github:mason-org/mason-registry",
	},

	ui = {
		-- Whether to automatically check for new versions when opening the :Mason window.
		check_outdated_packages_on_open = true,

		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "none",

		icons = {
			-- The list icon to use for installed packages.
			package_installed = "✓",
			-- The list icon to use for packages that are installing, or queued for installation.
			package_pending = "➜",
			-- The list icon to use for packages that are not installed.
			package_uninstalled = "✗",
		},

		keymaps = {
			-- Keymap to expand a package
			toggle_package_expand = "<CR>",
			-- Keymap to install the package under the current cursor position
			install_package = "i",
			-- Keymap to reinstall/update the package under the current cursor position
			update_package = "u",
			-- Keymap to check for new version for the package under the current cursor position
			check_package_version = "c",
			-- Keymap to update all installed packages
			update_all_packages = "U",
			-- Keymap to check which installed packages are outdated
			check_outdated_packages = "C",
			-- Keymap to uninstall a package
			uninstall_package = "X",
			-- Keymap to cancel a package installation
			cancel_installation = "<C-c>",
			-- Keymap to apply language filter
			apply_language_filter = "<C-f>",
			-- Keymap to toggle viewing package installation log
			toggle_package_install_log = "<CR>",
			-- Keymap to toggle the help view
			toggle_help = "g?",
		},
	},
})

masonconfig.setup({
	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
	-- This setting has no relation with the `automatic_installation` setting.
	---@type string[]
	ensure_installed = servers,

	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	---@type boolean
	automatic_installation = true,

	-- See `:h mason-lspconfig.setup_handlers()`
	---@type table<string, fun(server_name: string)>?
	handlers = nil,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp

--[[ for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		--on_attach = on_attach,
		capabilities = capabilities,
	})
end
]]
lspconfig.lua_ls.setup {
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT'
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME
					-- Depending on the usage, you might want to add additional paths here.
					-- "${3rd}/luv/library"
					-- "${3rd}/busted/library",
				}
				-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
				-- library = vim.api.nvim_get_runtime_file("", true)
			}
		})
	end,
	settings = {
		Lua = {}
	}
}

lspconfig.pylsp.setup {}
-- Enable Mini Autocompletion
completion.setup({
	-- Delay (debounce type, in ms) between certain Neovim event and action.
	-- This can be used to (virtually) disable certain automatic actions by
	-- setting very high delay time (like 10^7).
	delay = { completion = 100, info = 100, signature = 50 },

	-- Configuration for action windows:
	-- - `height` and `width` are maximum dimensions.
	-- - `border` defines border (as in `nvim_open_win()`).
	window = {
		info = { height = 40, width = 40, border = 'none' },
		signature = { height = 25, width = 40, border = 'none' },
	},

	-- Way of how module does LSP completion
	lsp_completion = {
		-- `source_func` should be one of 'completefunc' or 'omnifunc'.
		source_func = 'completefunc',

		-- `auto_setup` should be boolean indicating if LSP completion is set up
		-- on every `BufEnter` event.
		auto_setup = true,

		-- `process_items` should be a function which takes LSP
		-- 'textDocument/completion' response items and word to complete. Its
		-- output should be a table of the same nature as input items. The most
		-- common use-cases are custom filtering and sorting. You can use
		-- default `process_items` as `MiniCompletion.default_process_items()`.
		-- process_items = --<function: filters out snippets; sorts by LSP specs>,
	},

	-- Fallback action. It will always be run in Insert mode. To use Neovim's
	-- built-in completion (see `:h ins-completion`), supply its mapping as
	-- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
	-- fallback_action = --<function: like `<C-n>` completion>,

	-- Module mappings. Use `''` (empty string) to disable one. Some of them
	-- might conflict with system mappings.
	mappings = {
		force_twostep = '<C-Space>', -- Force two-step completion
		force_fallback = '<A-Space>', -- Force fallback completion
	},

	-- Whether to set Vim's settings for better experience (modifies
	-- `shortmess` and `completeopt`)
	set_vim_settings = true,
})
-- vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
-- vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
--
--[[
conform.setup({
	formatters_by_ft = {
		bash = { "beautysh" },
		html = { "prettier" },
		json = { "prettier" },
		java = {},
		javascript = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "black" },
		sql = { "sqlfmt" },
		typescript = { "prettier" },
		xml = { "xmlformatter" },
		yaml = { "prettier" },
	},
})
local format_augroup = vim.api.nvim_create_augroup("format", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*",
	group = format_augroup,
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})


lint.linters_by_ft = {
	bash = {'shellcheck'},
	html = {'sonarlint-language-server'},
	json = {'jsonlint'},
	java = {'sonarlint-language-server'},
	javascript = {'sonarlint-language-server'},
	lua = {'luacheck'},
	markdown = {'markdownlint'},
	python = {'sonarlint-language-server'},
	sql = {'sqlfluff'},
	typescript = {'sonarlint-language-server'},
	xml = {'sonarlint-language-server'},
	yaml = {'sonarlint-language-server'},
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" },{
	pattern = "*",
	group = lint_augroup,
	callback = function()

		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint()

		-- You can call `try_lint` with a linter name or a list of names to always
		-- run specific linters, independent of the `linters_by_ft` configuration
		require("lint").try_lint("cspell")
	end,
})
]]
