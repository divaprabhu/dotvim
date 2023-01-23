local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	print("lspconfig not found")
	return
end
local status_ok, nvimcmp = pcall(require, "cmp")
if not status_ok then
	print("cmp not found")
	return
end
local status_ok, cmpnvimlsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	print("cmp_nvim_lsp not found")
	return
end
local status_ok, cmpluasnip = pcall(require, "cmp_luasnip")
if not status_ok then
	print("cmp_luasnip not found")
	return
end
local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	print("luasnip not found")
	return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = cmpnvimlsp.default_capabilities()
local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration,
		{ noremap = true, silent = true, buffer = bufnr, desc = "jump to declaration" })
	vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list references" })
	vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list code actions" })
	vim.keymap.set('n', '<leader>lci', vim.lsp.buf.incoming_calls,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list incoming call" })
	vim.keymap.set('n', '<leader>lco', vim.lsp.buf.outgoing_calls,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list outgoing call" })
	vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
		{ noremap = true, silent = true, buffer = bufnr, desc = "jump to definition" })
	vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
		{ noremap = true, silent = true, buffer = bufnr, desc = "format buffer" })
	vim.keymap.set('n', '<leader>lg', vim.lsp.buf.signature_help,
		{ noremap = true, silent = true, buffer = bufnr, desc = "show signature help" })
	vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list implementation" })
	vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover,
		{ noremap = true, silent = true, buffer = bufnr, desc = "display hover information" })
	vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { noremap = true, silent = true, buffer = bufnr, desc = "rename" })
	vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list symbols" })
	vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list type definition" })
	vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder,
		{ noremap = true, silent = true, buffer = bufnr, desc = "add_workspace_folder" })
	vim.keymap.set('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list workspace folders" })
	vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder,
		{ noremap = true, silent = true, buffer = bufnr, desc = "remove workspace folder" })
	vim.keymap.set('n', '<leader>lws', vim.lsp.buf.workspace_symbol,
		{ noremap = true, silent = true, buffer = bufnr, desc = "list workspace symbol" })
end
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "clangd", "gopls", "jdtls", "sumneko_lua", "pylsp" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

nvimcmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = nvimcmp.mapping.preset.insert({
		['<C-b>'] = nvimcmp.mapping.scroll_docs(-4),
		['<C-f>'] = nvimcmp.mapping.scroll_docs(4),
		['<C-Space>'] = nvimcmp.mapping.complete(),
		['<CR>'] = nvimcmp.mapping.confirm {
			behavior = nvimcmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = nvimcmp.mapping(function(fallback)
			if nvimcmp.visible() then
				nvimcmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = nvimcmp.mapping(function(fallback)
			if nvimcmp.visible() then
				nvimcmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
